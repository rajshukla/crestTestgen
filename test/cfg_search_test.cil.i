# 1 "./cfg_search_test.cil.c"
# 1 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 1 "<command-line>" 2
# 1 "./cfg_search_test.cil.c"
# 17 "cfg_search_test.c"
void __globinit_cfg_search_test(void) ;
extern void __CrestInit(void) __attribute__((__crest_skip__)) ;
extern void __CrestHandleReturn(int id , long long val ) __attribute__((__crest_skip__)) ;
extern void __CrestReturn(int id ) __attribute__((__crest_skip__)) ;
extern void __CrestCall(int id , unsigned int fid ) __attribute__((__crest_skip__)) ;
extern void __CrestBranch(int id , int bid , unsigned char b ) __attribute__((__crest_skip__)) ;
extern void __CrestApply2(int id , int op , long long val ) __attribute__((__crest_skip__)) ;
extern void __CrestApply1(int id , int op , long long val ) __attribute__((__crest_skip__)) ;
extern void __CrestClearStack(int id ) __attribute__((__crest_skip__)) ;
extern void __CrestStore(int id , unsigned long addr ) __attribute__((__crest_skip__)) ;
extern void __CrestLoad(int id , unsigned long addr , long long val ) __attribute__((__crest_skip__)) ;
# 212 "/usr/lib/gcc/x86_64-linux-gnu/4.8/include/stddef.h"
typedef unsigned long size_t;
# 131 "/usr/include/x86_64-linux-gnu/bits/types.h"
typedef long __off_t;
# 132 "/usr/include/x86_64-linux-gnu/bits/types.h"
typedef long __off64_t;
# 44 "/usr/include/stdio.h"
struct _IO_FILE;
# 44 "/usr/include/stdio.h"
struct _IO_FILE;
# 48 "/usr/include/stdio.h"
typedef struct _IO_FILE FILE;
# 144 "/usr/include/libio.h"
struct _IO_FILE;
# 154 "/usr/include/libio.h"
typedef void _IO_lock_t;
# 160 "/usr/include/libio.h"
struct _IO_marker {
   struct _IO_marker *_next ;
   struct _IO_FILE *_sbuf ;
   int _pos ;
};
# 245 "/usr/include/libio.h"
struct _IO_FILE {
   int _flags ;
   char *_IO_read_ptr ;
   char *_IO_read_end ;
   char *_IO_read_base ;
   char *_IO_write_base ;
   char *_IO_write_ptr ;
   char *_IO_write_end ;
   char *_IO_buf_base ;
   char *_IO_buf_end ;
   char *_IO_save_base ;
   char *_IO_backup_base ;
   char *_IO_save_end ;
   struct _IO_marker *_markers ;
   struct _IO_FILE *_chain ;
   int _fileno ;
   int _flags2 ;
   __off_t _old_offset ;
   unsigned short _cur_column ;
   signed char _vtable_offset ;
   char _shortbuf[1] ;
   _IO_lock_t *_lock ;
   __off64_t _offset ;
   void *__pad1 ;
   void *__pad2 ;
   void *__pad3 ;
   void *__pad4 ;
   size_t __pad5 ;
   int _mode ;
   char _unused2[(15UL * sizeof(int ) - 4UL * sizeof(void *)) - sizeof(size_t )] ;
};
# 197 "../bin/../include/crest.h"
extern void __CrestUChar(unsigned char *x ) __attribute__((__crest_skip__)) ;
# 202 "../bin/../include/crest.h"
extern void __CrestInt(int *x ) __attribute__((__crest_skip__)) ;
# 170 "/usr/include/stdio.h"
extern struct _IO_FILE *stderr ;
# 356 "/usr/include/stdio.h"
extern int fprintf(FILE * __restrict __stream , char const * __restrict __format
                   , ...) ;
# 15 "cfg_search_test.c"
int data[200] ;
# 17 "cfg_search_test.c"
int main(void)
{
  unsigned char c ;
  int i ;
  int i___0 ;
  int a ;
  int __retres5 ;

  {
  __globinit_cfg_search_test();
  __CrestCall(1, 1);
# 19 "cfg_search_test.c"
  __CrestUChar(& c);
  __CrestLoad(2, (unsigned long )0, (long long )0);
  __CrestStore(3, (unsigned long )(& i));
# 21 "cfg_search_test.c"
  i = 0;
# 21 "cfg_search_test.c"
  while (1) {
    while_continue: ;
    {
    __CrestLoad(6, (unsigned long )(& i), (long long )i);
    __CrestLoad(5, (unsigned long )0, (long long )200);
    __CrestApply2(4, 16, (long long )(i < 200));
# 21 "cfg_search_test.c"
    if (i < 200) {
      __CrestBranch(7, 6, 1);

    } else {
      __CrestBranch(8, 7, 0);
# 21 "cfg_search_test.c"
      goto while_break;
    }
    }
    __CrestLoad(9, (unsigned long )0, (long long )400);
    __CrestStore(10, (unsigned long )(& data[i]));
# 22 "cfg_search_test.c"
    data[i] = 400;
    __CrestLoad(13, (unsigned long )(& i), (long long )i);
    __CrestLoad(12, (unsigned long )0, (long long )1);
    __CrestApply2(11, 0, (long long )(i + 1));
    __CrestStore(14, (unsigned long )(& i));
# 21 "cfg_search_test.c"
    i ++;
  }
  while_break:
  __CrestLoad(15, (unsigned long )0, (long long )13);
  __CrestStore(16, (unsigned long )(& data[100]));
# 24 "cfg_search_test.c"
  data[100] = 13;
  __CrestLoad(17, (unsigned long )0, (long long )0);
  __CrestStore(18, (unsigned long )(& i___0));
# 26 "cfg_search_test.c"
  i___0 = 0;
# 26 "cfg_search_test.c"
  while (1) {
    while_continue___0: ;
    {
    __CrestLoad(21, (unsigned long )(& i___0), (long long )i___0);
    __CrestLoad(20, (unsigned long )0, (long long )200);
    __CrestApply2(19, 16, (long long )(i___0 < 200));
# 26 "cfg_search_test.c"
    if (i___0 < 200) {
      __CrestBranch(22, 15, 1);

    } else {
      __CrestBranch(23, 16, 0);
# 26 "cfg_search_test.c"
      goto while_break___0;
    }
    }
    {
    __CrestLoad(26, (unsigned long )(& c), (long long )c);
    __CrestLoad(25, (unsigned long )(& data[i___0]), (long long )data[i___0]);
    __CrestApply2(24, 12, (long long )((int )c == data[i___0]));
# 28 "cfg_search_test.c"
    if ((int )c == data[i___0]) {
      __CrestBranch(27, 18, 1);
# 29 "cfg_search_test.c"
      fprintf((FILE * __restrict )stderr, (char const * __restrict )"GOAL!\n");
      __CrestClearStack(29);
    } else {
      __CrestBranch(28, 19, 0);

    }
    }
# 34 "cfg_search_test.c"
    __CrestInt(& a);
    __CrestLoad(32, (unsigned long )(& i___0), (long long )i___0);
    __CrestLoad(31, (unsigned long )0, (long long )1);
    __CrestApply2(30, 0, (long long )(i___0 + 1));
    __CrestStore(33, (unsigned long )(& i___0));
# 26 "cfg_search_test.c"
    i___0 ++;
  }
  while_break___0:
  __CrestLoad(34, (unsigned long )0, (long long )0);
  __CrestStore(35, (unsigned long )(& __retres5));
# 38 "cfg_search_test.c"
  __retres5 = 0;
  __CrestLoad(36, (unsigned long )(& __retres5), (long long )__retres5);
  __CrestReturn(37);
# 17 "cfg_search_test.c"
  return (__retres5);
}
}
void __globinit_cfg_search_test(void)
{


  {
  __CrestInit();
}
}
