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

#UC-3
function partTimeEmpWages(){
   local isPartTime=1;
   local isFullTime=2;
   local empRatePerHrs=20;
   local randomCheck=$(( RANDOM%3 ))
   if [ $randomCheck -eq $isFullTime ]
   then
      empHrs=8;
   elif [ $randomCheck -eq $isPartTime ]
   then
      empHrs=4;
   else
      empHrs=0;
   fi
      salary=$(( empRatePerHrs*empHrs ));
}
partTimeEmpWages

#UC-4
function partTimeEmpWagesCaseStatement(){
   local isPartTime=1;
   local isFullTime=2;
   local empRatePerHrs=20;
   local randomCheck=$(( RANDOM%3 ))
   
   case $randomCheck in
      $isFullTime)
        empHrs=8;
      ;;
      $isPartTime)
        empHrs=4;
      ;; 
      *)
        empHrs=0;
      ;;
   esac
      salary=$(( empRatePerHrs*empHrs ));
}
partTimeEmpWagesCaseStatement

