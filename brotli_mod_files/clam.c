#include "clam.h"
// for rand()
#include <stdlib.h>

void __CRAB_assert(int c) {}
void __CRAB_assume(int c) {}
void __CRAB_intrinsic_unfreed_or_null(void*ptr) {}
int __CRAB_nd_int() {
  // The code of rand() is not available so it will treated as a
  // function that returns non-deterministically an integer. 
  return rand() ;
}

