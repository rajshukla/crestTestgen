# 1 "./triangle.cil.c"
# 1 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 1 "<command-line>" 2
# 1 "./triangle.cil.c"
# 4 "triangle.c"
void __globinit_triangle(void) ;
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
# 362 "/usr/include/stdio.h"
extern int printf(char const * __restrict __format , ...) ;
# 202 "../bin/../include/crest.h"
extern void __CrestInt(int *x ) __attribute__((__crest_skip__)) ;
# 4 "triangle.c"
int main(void)
{
  int side1 ;
  int side2 ;
  int side3 ;
  int triang ;
  int __retres5 ;

  {
  __globinit_triangle();
  __CrestCall(1, 1);
# 7 "triangle.c"
  __CrestInt(& side1);
# 8 "triangle.c"
  __CrestInt(& side2);
# 9 "triangle.c"
  __CrestInt(& side3);
  __CrestLoad(4, (unsigned long )(& side1), (long long )side1);
  __CrestLoad(3, (unsigned long )0, (long long )0);
  __CrestApply2(2, 16, (long long )(side1 < 0));
# 11 "triangle.c"
  if (side1 < 0) {
    __CrestBranch(5, 3, 1);
# 12 "triangle.c"
    printf((char const * __restrict )"Illegal arguments !! \n");
    __CrestClearStack(7);
  } else {
    __CrestBranch(6, 4, 0);
    {
    __CrestLoad(10, (unsigned long )(& side2), (long long )side2);
    __CrestLoad(9, (unsigned long )0, (long long )0);
    __CrestApply2(8, 16, (long long )(side2 < 0));
# 11 "triangle.c"
    if (side2 < 0) {
      __CrestBranch(11, 5, 1);
# 12 "triangle.c"
      printf((char const * __restrict )"Illegal arguments !! \n");
      __CrestClearStack(13);
    } else {
      __CrestBranch(12, 6, 0);
      {
      __CrestLoad(16, (unsigned long )(& side3), (long long )side3);
      __CrestLoad(15, (unsigned long )0, (long long )0);
      __CrestApply2(14, 16, (long long )(side3 < 0));
# 11 "triangle.c"
      if (side3 < 0) {
        __CrestBranch(17, 7, 1);
# 12 "triangle.c"
        printf((char const * __restrict )"Illegal arguments !! \n");
        __CrestClearStack(19);
      } else {
        __CrestBranch(18, 8, 0);
        __CrestLoad(20, (unsigned long )0, (long long )0);
        __CrestStore(21, (unsigned long )(& triang));
# 15 "triangle.c"
        triang = 0;
        {
        __CrestLoad(24, (unsigned long )(& side1), (long long )side1);
        __CrestLoad(23, (unsigned long )(& side2), (long long )side2);
        __CrestApply2(22, 12, (long long )(side1 == side2));
# 16 "triangle.c"
        if (side1 == side2) {
          __CrestBranch(25, 10, 1);
          __CrestLoad(29, (unsigned long )(& triang), (long long )triang);
          __CrestLoad(28, (unsigned long )0, (long long )1);
          __CrestApply2(27, 0, (long long )(triang + 1));
          __CrestStore(30, (unsigned long )(& triang));
# 17 "triangle.c"
          triang ++;
        } else {
          __CrestBranch(26, 11, 0);
# 20 "triangle.c"
          printf((char const * __restrict )"not equal side1 and side2 \n");
          __CrestClearStack(31);
        }
        }
        {
        __CrestLoad(34, (unsigned long )(& side2), (long long )side2);
        __CrestLoad(33, (unsigned long )(& side3), (long long )side3);
        __CrestApply2(32, 12, (long long )(side2 == side3));
# 22 "triangle.c"
        if (side2 == side3) {
          __CrestBranch(35, 13, 1);
          __CrestLoad(39, (unsigned long )(& triang), (long long )triang);
          __CrestLoad(38, (unsigned long )0, (long long )2);
          __CrestApply2(37, 0, (long long )(triang + 2));
          __CrestStore(40, (unsigned long )(& triang));
# 23 "triangle.c"
          triang += 2;
        } else {
          __CrestBranch(36, 14, 0);
# 25 "triangle.c"
          printf((char const * __restrict )"not equal side2 and side3 \n");
          __CrestClearStack(41);
        }
        }
        {
        __CrestLoad(44, (unsigned long )(& side1), (long long )side1);
        __CrestLoad(43, (unsigned long )(& side3), (long long )side3);
        __CrestApply2(42, 12, (long long )(side1 == side3));
# 27 "triangle.c"
        if (side1 == side3) {
          __CrestBranch(45, 16, 1);
          __CrestLoad(49, (unsigned long )(& triang), (long long )triang);
          __CrestLoad(48, (unsigned long )0, (long long )3);
          __CrestApply2(47, 0, (long long )(triang + 3));
          __CrestStore(50, (unsigned long )(& triang));
# 28 "triangle.c"
          triang += 3;
        } else {
          __CrestBranch(46, 17, 0);
# 30 "triangle.c"
          printf((char const * __restrict )"not equal side1 and side3 \n");
          __CrestClearStack(51);
        }
        }
        __CrestLoad(52, (unsigned long )(& side1), (long long )side1);
        __CrestLoad(53, (unsigned long )(& side2), (long long )side2);
        __CrestLoad(54, (unsigned long )(& side3), (long long )side3);
        __CrestLoad(55, (unsigned long )(& triang), (long long )triang);
# 32 "triangle.c"
        printf((char const * __restrict )"side1=%d, side2=%d, side3=%d, triang = %d\n",
               side1, side2, side3, triang);
        __CrestClearStack(56);
        {
        __CrestLoad(59, (unsigned long )(& triang), (long long )triang);
        __CrestLoad(58, (unsigned long )0, (long long )0);
        __CrestApply2(57, 12, (long long )(triang == 0));
# 34 "triangle.c"
        if (triang == 0) {
          __CrestBranch(60, 20, 1);
          {
          __CrestLoad(66, (unsigned long )(& side1), (long long )side1);
          __CrestLoad(65, (unsigned long )(& side2), (long long )side2);
          __CrestApply2(64, 0, (long long )(side1 + side2));
          __CrestLoad(63, (unsigned long )(& side3), (long long )side3);
          __CrestApply2(62, 16, (long long )(side1 + side2 < side3));
# 36 "triangle.c"
          if (side1 + side2 < side3) {
            __CrestBranch(67, 21, 1);
# 37 "triangle.c"
            printf((char const * __restrict )"Illegal arguments !! \n");
            __CrestClearStack(69);
          } else {
            __CrestBranch(68, 22, 0);
            {
            __CrestLoad(74, (unsigned long )(& side2), (long long )side2);
            __CrestLoad(73, (unsigned long )(& side3), (long long )side3);
            __CrestApply2(72, 0, (long long )(side2 + side3));
            __CrestLoad(71, (unsigned long )(& side1), (long long )side1);
            __CrestApply2(70, 16, (long long )(side2 + side3 < side1));
# 36 "triangle.c"
            if (side2 + side3 < side1) {
              __CrestBranch(75, 23, 1);
# 37 "triangle.c"
              printf((char const * __restrict )"Illegal arguments !! \n");
              __CrestClearStack(77);
            } else {
              __CrestBranch(76, 24, 0);
              {
              __CrestLoad(82, (unsigned long )(& side1), (long long )side1);
              __CrestLoad(81, (unsigned long )(& side2), (long long )side2);
              __CrestApply2(80, 0, (long long )(side1 + side2));
              __CrestLoad(79, (unsigned long )(& side3), (long long )side3);
              __CrestApply2(78, 16, (long long )(side1 + side2 < side3));
# 36 "triangle.c"
              if (side1 + side2 < side3) {
                __CrestBranch(83, 25, 1);
# 37 "triangle.c"
                printf((char const * __restrict )"Illegal arguments !! \n");
                __CrestClearStack(85);
              } else {
                __CrestBranch(84, 26, 0);
# 39 "triangle.c"
                printf((char const * __restrict )"Scalene triangle \n");
                __CrestClearStack(86);
              }
              }
            }
            }
          }
          }
        } else {
          __CrestBranch(61, 27, 0);
          {
          __CrestLoad(89, (unsigned long )(& triang), (long long )triang);
          __CrestLoad(88, (unsigned long )0, (long long )3);
          __CrestApply2(87, 14, (long long )(triang > 3));
# 43 "triangle.c"
          if (triang > 3) {
            __CrestBranch(90, 28, 1);
# 44 "triangle.c"
            printf((char const * __restrict )"Equilateral triangle \n");
            __CrestClearStack(92);
          } else {
            __CrestBranch(91, 29, 0);
            {
            __CrestLoad(95, (unsigned long )(& triang), (long long )triang);
            __CrestLoad(94, (unsigned long )0, (long long )1);
            __CrestApply2(93, 12, (long long )(triang == 1));
# 47 "triangle.c"
            if (triang == 1) {
              __CrestBranch(96, 30, 1);
              {
              __CrestLoad(102, (unsigned long )(& side1), (long long )side1);
              __CrestLoad(101, (unsigned long )(& side2), (long long )side2);
              __CrestApply2(100, 0, (long long )(side1 + side2));
              __CrestLoad(99, (unsigned long )(& side3), (long long )side3);
              __CrestApply2(98, 14, (long long )(side1 + side2 > side3));
# 47 "triangle.c"
              if (side1 + side2 > side3) {
                __CrestBranch(103, 31, 1);
# 48 "triangle.c"
                printf((char const * __restrict )"Isosceles triangle \n");
                __CrestClearStack(105);
              } else {
                __CrestBranch(104, 32, 0);
# 47 "triangle.c"
                goto _L___0;
              }
              }
            } else {
              __CrestBranch(97, 33, 0);
              _L___0:
              {
              __CrestLoad(108, (unsigned long )(& triang), (long long )triang);
              __CrestLoad(107, (unsigned long )0, (long long )2);
              __CrestApply2(106, 12, (long long )(triang == 2));
# 51 "triangle.c"
              if (triang == 2) {
                __CrestBranch(109, 34, 1);
                {
                __CrestLoad(115, (unsigned long )(& side2), (long long )side2);
                __CrestLoad(114, (unsigned long )(& side3), (long long )side3);
                __CrestApply2(113, 0, (long long )(side2 + side3));
                __CrestLoad(112, (unsigned long )(& side1), (long long )side1);
                __CrestApply2(111, 14, (long long )(side2 + side3 > side1));
# 51 "triangle.c"
                if (side2 + side3 > side1) {
                  __CrestBranch(116, 35, 1);
# 52 "triangle.c"
                  printf((char const * __restrict )"Isosceles triangle \n");
                  __CrestClearStack(118);
                } else {
                  __CrestBranch(117, 36, 0);
# 51 "triangle.c"
                  goto _L;
                }
                }
              } else {
                __CrestBranch(110, 37, 0);
                _L:
                {
                __CrestLoad(121, (unsigned long )(& triang), (long long )triang);
                __CrestLoad(120, (unsigned long )0, (long long )3);
                __CrestApply2(119, 12, (long long )(triang == 3));
# 55 "triangle.c"
                if (triang == 3) {
                  __CrestBranch(122, 38, 1);
                  {
                  __CrestLoad(128, (unsigned long )(& side1), (long long )side1);
                  __CrestLoad(127, (unsigned long )(& side3), (long long )side3);
                  __CrestApply2(126, 0, (long long )(side1 + side3));
                  __CrestLoad(125, (unsigned long )(& side2), (long long )side2);
                  __CrestApply2(124, 14, (long long )(side1 + side3 > side2));
# 55 "triangle.c"
                  if (side1 + side3 > side2) {
                    __CrestBranch(129, 39, 1);
# 56 "triangle.c"
                    printf((char const * __restrict )"Isosceles triangle \n");
                    __CrestClearStack(131);
                  } else {
                    __CrestBranch(130, 40, 0);
# 58 "triangle.c"
                    printf((char const * __restrict )"ILLegal !!! \n");
                    __CrestClearStack(132);
                  }
                  }
                } else {
                  __CrestBranch(123, 41, 0);
# 58 "triangle.c"
                  printf((char const * __restrict )"ILLegal !!! \n");
                  __CrestClearStack(133);
                }
                }
              }
              }
            }
            }
          }
          }
        }
        }
      }
      }
    }
    }
  }
  __CrestLoad(134, (unsigned long )0, (long long )0);
  __CrestStore(135, (unsigned long )(& __retres5));
# 67 "triangle.c"
  __retres5 = 0;
  __CrestLoad(136, (unsigned long )(& __retres5), (long long )__retres5);
  __CrestReturn(137);
# 4 "triangle.c"
  return (__retres5);
}
}
void __globinit_triangle(void)
{


  {
  __CrestInit();
}
}
