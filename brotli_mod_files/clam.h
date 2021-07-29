#pragma once

#ifdef __cplusplus
extern "C" {
#endif        

extern void __CRAB_assert(int);
extern void __CRAB_assume(int);
extern void __CRAB_intrinsic_unfreed_or_null(void*);  
extern int  __CRAB_nd_int();
extern uint8_t  __CRAB_nd_uint8_t();
extern uint16_t  __CRAB_nd_uint16_t();    
#ifdef __cplusplus
}
#endif


#define clam_assume __CRAB_assume
#define clam_assert(X) __CRAB_assert(X)
#define clam_unfreed_or_null(X) __CRAB_intrinsic_unfreed_or_null(X)
