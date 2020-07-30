/*********************************************
 * OPL 12.10.0.0 Model
 * Author: Andreas Beham
 * Creation Date: 28.07.2020 at 09:24:50
 *********************************************/

using CP;

range T = 1..3;

dvar interval start;
dvar interval A[T];
dvar interval end;

cumulFunction util = sum(t in T) (pulse(A[t], 1));
 
minimize endOf(end);

subject to {
  forall (t in T)(endAtStart(start, A[t]));
  forall (t in T)(endBeforeStart(A[t], end));
  forall (t in T)(lengthOf(A[t]) >= 1);
  
  util <= 2;
  
  // even adding the following constraints, CP solver does not recognize infeasibility
  forall (t in T, k in T: t < k) startAtStart(A[t], A[k]);
}