(* Feature is used to give levels to various
 * if expressions and create a tree by maintaining
 * parent child relation which depicts the path
 * condition obtained.
 *)

open Pretty
open Cil
open Trace
module E = Errormsg
module H = Hashtbl

(* Hash table for mapping expressions of conditional statement to level *)
let levelH : (int, int) Hashtbl.t = (Hashtbl.create 100)

(* Hash table for mapping child id to parent id *)
let parH : (int, int) Hashtbl.t = (Hashtbl.create 100)
let file = "level.txt"
let leftStmt = ref dummyStmt
let parentExp = ref ""
let parentId = ref 0
let save  = ref []
let testNesting = ref 0
let stmtlist : stmt list ref = ref []
let countif = ref 0
let aindex = ref 0
let levellist = ref []

let open_append fname =
  open_out_gen [Open_append; Open_creat; Open_text] 0o700 fname

let d_string (fmt : ('a,unit,doc,string) format4) : 'a = 
  let f (d: doc) : string = 
    Pretty.sprint 200 d
  in
  Pretty.gprintf f fmt 

let v2e (v : varinfo) : exp = Lval(var v)

(* counts number of references in pointer *)
let rec countRef e cnt  = 
  match e with
  | Lval(Mem(e1), NoOffset) -> countRef e1 (cnt+1)
  | UnOp(op,e1,t) -> countRef e1 cnt
  | BinOp(op, e1, e2, t) -> countRef e1 cnt; countRef e2 cnt
  | _ -> cnt



(* function to check if there is nested conditional statement*)
let rec testing (s:stmt) : unit = 
  match s.skind with
  | If(e,tb,fb,l) -> testNesting := 1
  | Block(b) -> List.iter (fun a -> testing a) b.bstmts
  | _ -> ()

(* level the nested if structure and add parent for each if statement*)
let rec fixStmt (s:stmt) (st:string) : unit = 
  match s.skind with
  | If(BinOp(op ,CastE( t1 , e1) ,CastE( t2 , CastE(t, e2)) , t3),tb,fb,l)-> 
     Hashtbl.add levelH s.sid ((Hashtbl.find levelH !parentId) + 1);
     Hashtbl.add parH s.sid !parentId;
     E.log " Added entry for key %d, level %d\n" s.sid (Hashtbl.find levelH s.sid);
     levellist := !levellist @ [(Hashtbl.find levelH s.sid)];
     let oc = open_append file in    
     fprintf oc "%d %d\n" s.sid (Hashtbl.find levelH s.sid);
     close_out oc ;
     List.iter testing tb.bstmts;
     List.iter testing fb.bstmts;

     (* if contains nested if statements then save this statement to explore its child later*)
     if !testNesting==1 then 
       (save := !save @ [s]; testNesting := 0)

  | If(BinOp(op ,CastE( t1 , e1) ,e2 , t3),tb,fb,l)-> 
     Hashtbl.add levelH s.sid ((Hashtbl.find levelH !parentId) + 1);
     Hashtbl.add parH s.sid !parentId;
     E.log " Added entry for key %d, level %d\n" s.sid (Hashtbl.find levelH s.sid);
     levellist := !levellist @ [(Hashtbl.find levelH s.sid)];
     let oc = open_append file in    
     fprintf oc "%d %d\n"s.sid (Hashtbl.find levelH s.sid);
     close_out oc ;
     List.iter testing tb.bstmts;
     List.iter testing fb.bstmts;

     (* if contains nested if statements then save this statement to explore its child later*)
     if !testNesting==1 then 
       ( save := !save @ [s]; testNesting := 0)

  | If(e,tb,fb,l) ->
     Hashtbl.add levelH s.sid ((Hashtbl.find levelH !parentId) + 1);
     Hashtbl.add parH s.sid !parentId;
     E.log " Added entry for key %d, level %d\n" s.sid (Hashtbl.find levelH s.sid);
     levellist := !levellist @ [(Hashtbl.find levelH s.sid)];
     let oc = open_append file in    
     fprintf oc "%d %d\n" s.sid (Hashtbl.find levelH s.sid);
     close_out oc ;
     testNesting := 0 ;
     List.iter testing tb.bstmts;
     List.iter testing fb.bstmts;
     if !testNesting==1 then
       ( save := !save @ [s]; testNesting := 0; )

  | Block(b) ->  List.iter (fun v -> fixStmt v st )b.bstmts;

  | _ -> ()


(* check for nesting by traversing true block and false block *)
let rec level_structFixStmt (s : stmt) : unit = 
  match s.skind with
  | If(BinOp(op ,CastE( t1 , e1) ,CastE( t2 , CastE(t, e2)) , t3),tb,fb,l)->  
     parentId := s.sid;
     level_structFixBlock tb "If";
     parentId := s.sid;
     level_structFixBlock fb "Else"; 


  | If(BinOp(op ,CastE( t1 , e1) ,e2 , t3),tb,fb,l)-> 
     parentId := s.sid;
     level_structFixBlock tb "If";
     parentId := s.sid;
     level_structFixBlock fb "Else"; 


  | If(e,tb,fb,l) ->
     parentId := s.sid;
     level_structFixBlock tb "If";
     parentId := s.sid;
     level_structFixBlock fb "Else";

  | Block(b) ->  List.iter (fun v -> level_structFixStmt v) b.bstmts; 

  | _ -> ()

and level_structFixBlock (b : block) (s:string) : unit = 
  List.iter (
      fun v->
      match v.skind with
      |Block(blk) -> List.iter (
                         fun a ->
                         fixStmt a s
                       ) blk.bstmts
      | _ ->    fixStmt v s 
    ) b.bstmts;
  
  (* Explore the "if" structures that are nested *)     
  if((List.length !save) > 1) then
    begin
      leftStmt := List.hd !save;
      save := List.tl !save; 
      level_structFixStmt !leftStmt 
    end;

  if((List.length !save) == 1) then
    begin
      leftStmt := List.hd !save;
      save := [];
      level_structFixStmt !leftStmt 
    end

(* for each statement in the function *)
let rec level_structFixFunction (s : stmt) : unit = 
  match s.skind with
  | If(BinOp(op ,CastE( t1 , e1) ,CastE( t2 , CastE(t, e2)) , t3),tb,fb,l)->                    
     Hashtbl.add levelH s.sid 1; 
     Hashtbl.add parH s.sid 0; 
     E.log "Added entry for key %d, level %d\n" s.sid (Hashtbl.find levelH s.sid);
     levellist := !levellist @ [(Hashtbl.find levelH s.sid)];
     let oc = open_append file in    
     fprintf oc "%d %d\n"s.sid (Hashtbl.find levelH s.sid);
     close_out oc ;
     level_structFixStmt s

  | If(BinOp(op ,CastE( t1 , e1) ,e2 , t3),tb,fb,l)-> 
     Hashtbl.add levelH s.sid 1; 
     Hashtbl.add parH s.sid 0; 
     E.log "Added entry for key %d, level %d\n" s.sid (Hashtbl.find levelH s.sid);
     levellist := !levellist @ [(Hashtbl.find levelH s.sid)];
     let oc = open_append file in    
     fprintf oc "%d %d\n" s.sid (Hashtbl.find levelH s.sid);
     close_out oc ;
     level_structFixStmt s

  | If(e,tb,fb,l) ->
     Hashtbl.add levelH s.sid 1; 
     Hashtbl.add parH s.sid 0; 
     E.log "Added entry for key %d, level %d\n" s.sid (Hashtbl.find levelH s.sid);
     levellist := !levellist @ [(Hashtbl.find levelH s.sid)];
     let oc = open_append file in    
     fprintf oc "%d %d\n" s.sid (Hashtbl.find levelH s.sid);
     close_out oc ;
     level_structFixStmt s

  | Block(b) ->  List.iter (fun v -> level_structFixFunction v ) b.bstmts;

  | _ -> ()


(* Function to convert infix expressions in to S-Expression format *)
let rec getSExp (e : exp)  = 
  match e with
  | BinOp(op,e1,e2,l) ->
     begin
       match op with
       | Eq -> ("(=" ^ " " ^ (getSExp e1) ^ " " ^ (getSExp e2) ^ ")")
       | Ne -> ("(not (=" ^ " " ^ (getSExp e1) ^ " " ^ (getSExp e2) ^ "))")
       | _ -> ("(" ^ (d_string "%a" d_binop op) ^ " " ^ (getSExp e1) ^ " " ^ (getSExp e2) ^ ")")
     end

  | UnOp(LNot,e1,_) -> ("(" ^ "not" ^ " " ^ (getSExp e1) ^ ")")

  | UnOp(op,e1,_) ->  ("(" ^ (d_string "%a" d_unop op) ^ " " ^ (getSExp e1) ^ ")")

  | CastE(t, e1) -> getSExp e1                     

  | _ -> (d_string "%a" d_exp e)


let getFalseExpr (e : exp) =
  match e with
  | UnOp(LNot,e1,_) -> e1
  | _ -> UnOp(LNot, e, intType)





 (*let printLeveltoFile () =
  let oc = open_out file in    
  List.iter(fun f -> fprintf oc "%d \n" f;
  ) levellist;
  close_out oc   
*)


  





let level_struct (f:file) : unit = 
  Cfg.clearFileCFG f;
  Cfg.computeFileCFG f; 
  List.iter (fun g ->
             match g with
             |GFun (fd, loc) -> 
               List.iter level_structFixFunction fd.sbody.bstmts;
               
               (*printLeveltoFile () ;*)
                      
             | _ -> ()) f.globals 
 
            
let feature : featureDescr = {
  fd_name = "level_struct";
  fd_enabled = ref false;
  fd_description = "";
  fd_extraopt = [];
  fd_doit = level_struct;
  fd_post_check = true
} 

