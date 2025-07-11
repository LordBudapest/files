/* run.config*

   STDOPT: #"-eva-default-loop-unroll 10"
   STDOPT: +"-main test_split -eva-partition-value k"
   STDOPT: #"-main test_loop_split -eva-partition-history 1"
   STDOPT: #"-main test_history -eva-partition-history 0"
   STDOPT: #"-main test_history -eva-partition-history 1"
   */

#include "__fc_builtin.h"

#define N 10

volatile int nondet;

void test_unroll()
{
  int a[N], b[N], c[2*N], d[2*N], e[N];

  // The inner loop needs to be unrolled to allow strong updates
  // The outer loops doesn't need to be unrolled

  //@ loop unroll N;
  for (int i = 0; i < N; i++) {
    //@ loop unroll 1;
    for (int j = 0; j < N; j++) {
      a[i] = 42;
    }
  }

  // This time the outer loop needs unrolling but not the inner loop

  //@ loop unroll 1;
  for (int i = 0; i < N; i++) {
    //@ loop unroll N;
    for (int j = 0; j < N; j++) {
      b[j] = 42;
    }
  }

  // At the end, we must have both arrays a and b to be fully initialized at 42

  // Small loops can be unrolled without giving an unroll amount.
  // The actual limit of the number of iterations can be overriden with
  // the option -eva-default-loop-unroll
  // Here -eva-default-loop-unroll is set to a value not high enough to
  // completely unroll the loop thus a warning should be emitted.
  //@ loop unroll;
  for (int i = 0 ; i < 2*N ; i++)
    c[i] = i % 2;

  // Longer loops won't be completely unrolled when not giving a parameter
  //@ loop unroll N;
  for (int i = 0 ; i < 2*N ; i++)
    d[i] = 0;

  // Variable unroll limits can be specified as long as they evaluate as
  // a singleton in each state
  //@ loop unroll N;
  for (int i = 0 ; i < N ; i++) {
    e[i] = 1;
    //@ loop unroll i-1;
    for (int j = i - 1 ; j > 0 ; j--) {
      e[j] += e[j-1];
    }
  }
}

int k;

void test_split()
{
  int i = Frama_C_interval(0,1);
  int j = Frama_C_interval(0,2);

  // The splits are done on i and j and undone in the same order
  // If global dynamic split is done on k, since it is equaly to i, merge i will
  // have no effects.

  Frama_C_show_each_before_first_split(i,j,k);
  //@ split i;
  k = i;
  Frama_C_show_each_before_second_split(i,j,k);
  //@ split j;
  Frama_C_show_each_before_first_merge(i,j,k);
  //@ merge i;
  Frama_C_show_each_before_second_merge(i,j,k);
  //@ merge j;
  Frama_C_show_each_end(i,j,k);
}

void test_dynamic_split()
{
  int a, b;
  //@ dynamic_split a;
  if (nondet) {
    a = Frama_C_interval(0, 2);
    b = a;
  }
  Frama_C_show_each_split_with_uninit(a, b);
  a = 0;
  Frama_C_show_each_no_split(a, b);
  a = Frama_C_interval(0, 2);
  b = a;
  //@ split a;
  a = 0;
  Frama_C_show_each_split(a, b);
  //@ merge a;
  Frama_C_show_each_no_split(a, b);
}

void test_dynamic_split_predicate()
{
  int x, y;
  //@ dynamic_split \initialized(&x);
  int c = nondet;
  if (c != 1) {
    x = 42;
  }
  y = 2;
  if (c != 1)
    x += y; // No alarm on x initialization with the dynamic partitioning.
  else {
    for (int i = 0; i < 32; i++)
      x = i;
  }
  y = x; // No alarm on x initialization with the dynamic partitioning.
}

void test_loop_split()
{
  int A[N];
  int i;

  // In this example we can split on the value of the loop index in order to
  // keep the relation between i and the value A[i] found in the array to be
  // equal to 42.
  // However, since the split is not dynamic, an history partitioning must be
  // added to distinguish between the two states that share i = 9 : those who
  // left the loop at the break point and those who left after the loop test.

  // Init a random array
  for (i = 0 ; i < N ; i ++)
  {
    A[i] = Frama_C_interval(0,100);
  }

  // Search for some value
  for (i = 0 ; i < N ; i++)
  {
    //@ split i;
    if (A[i] == 42)
      break;
  }

  if (i < N) {
    Frama_C_show_each(i, A[i]);
    //@ assert A[i] == 42;
  }
  else {
    Frama_C_show_each("Value 42 not found");
  }
}

/*@
   assigns \result, *p \from i;
   behavior error:
     assumes nondet == 0;
     assigns \result, *p \from i;
     ensures \result == -1;
     ensures \initialized(p) && *p == \old(i);
   behavior positive:
     assumes nondet > 0;
     assigns \result \from i;
     ensures \result >= 10;
   behavior negative:
     assumes nondet < 0;
     assigns \result \from i;
     ensures \result <= -10;
   disjoint behaviors;
   complete behaviors;
*/
int spec(int i, int* p);

int body(int i, int *p) {
  int i2 = i / 2;
  int absolute = i2 < 0 ? -i2 : i2;
  int state = nondet % 2;
  //@ split state;
  if (state < 0)
    return - 10 - absolute;
  if (state > 0)
    return 10 + absolute;
  *p = i;
  return -1;
}

/* Tests the application of multiple splits according to the return value of a
   call, to keep in the caller some state partitioning from the callee.
   The splits must be defined after the call, so the state partitioning from the
   callee must be kept until all splits are performed.
   Tests this whether the function body or a specification is used. */
void test_splits_post_call (void) {
  int x, y, error;
  int i = Frama_C_interval(-1000, 1000);
  int r = spec(i, &x);
  //@ split r < -1;
  //@ split r > -1;
  if (r == -1)
    error = x; // There should be no alarm.
  Frama_C_show_each_spec(r, x); // There should be three states.
  r = body(i, &y);
  //@ split r < -1;
  //@ split r > -1;
  if (r == -1)
    error = y; // There should be no alarm.
  Frama_C_show_each_body(r, y); // There should be three states.
}

void test_history()
{
  int i = Frama_C_interval(0,1);
  int j = 0, k = 1;

  if (i)
    j = 1;

  Frama_C_show_each(i, j);

  if (i)
    k = k / j;
}

void test_slevel()
{
  int a[N], b[N], c[N], d[N], e[4];
  //@slevel 10;
  for (int i = 0; i < N; i++) {
    a[i] = 42;
  }

  //@slevel default;
  for (int i = 0; i < N; i++) {
    b[i] = 42;
  }

  //@slevel 20;
  for (int i = 0; i < N; i++) {
    if (nondet)
      c[i] = 42;
    else
      c[i] = 33;
  }

  //@slevel 20;
  for (int i = 0; i < N; i++) {
    if (nondet)
      d[i] = 42;
    else
      d[i] = 33;
    //@slevel merge;
    ; // Otherwise previous annotation is ignored
  }

  //@slevel 0;
  ;
  //@slevel full;
  for (int i = 0; i < 4; i++) {
    if (nondet)
      e[i] = 42;
    else
      e[i] = 33;
  }
}

void main(void)
{
  test_slevel();
  test_unroll();
  test_split();
  test_dynamic_split();
  test_dynamic_split_predicate();
  test_splits_post_call();
}
