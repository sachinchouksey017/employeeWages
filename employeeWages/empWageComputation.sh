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
      echo "Employee is Absent "
   fi
}
isEmpPresent

#UC-2
function dailyEmpWages(){
   local isPresent=1
   local randomCheck=$(( RANDOM%2 ))
   if [ $randomCheck -eq $isPresent ]
   then
      empRatePerHrs=20;
      empHrs=8;
      salary=$(( empRatePerHrs*empHrs ));
   else
      salary=0;
   fi

}
dailyEmpWages
