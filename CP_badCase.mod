/*********************************************
 * OPL 12.10.0.0 Model
 * Author: Andreas Beham
 * Creation Date: 28.07.2020 at 09:24:50
 *********************************************/

using CP;

dvar interval activityA;
dvar interval activityA1;
dvar interval activityA2;
dvar interval end;

cumulFunction util = pulse(activityA1, 1) + pulse(activityA2, 1);
 
minimize endOf(end);

subject to {
  endAtStart(activityA, activityA1);
  endAtStart(activityA, activityA2);
  endBeforeStart(activityA1, end);
  endBeforeStart(activityA2, end);
  
  lengthOf(activityA) >= 1;
  lengthOf(activityA1) >= 1;
  lengthOf(activityA2) >= 1;
  
  util <= 1;
  
  // adding the following constraint, CP identifies the infeasibility quickly
  //startOf(activityA1) == startOf(activityA2);
}