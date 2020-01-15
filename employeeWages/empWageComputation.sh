#!/bin/bash -x

echo "Welcome to Employee Wage Computation program"

#UC-1
function isEmpPresent(){
   local isPresent=1
   local randomCheck=$(( RANDOM%2 ))
   if [ $randomCheck -eq $isPresent ]
   then
      echo "Employee is Present "
   else
      echo "Employee is Absent will come tommorow "
   fi
}
isEmpPresent
