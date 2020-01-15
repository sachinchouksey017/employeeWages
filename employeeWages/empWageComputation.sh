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

#UC-5
function EmpWagesMonth(){
   local isPartTime=1;
   local isFullTime=2;
   local empRatePerHrs=20;
   local workingDay=20;
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
      salary=$(( empRatePerHrs*empHrs*workingDay ));
      echo "salary for month is $salary"
}
EmpWagesMonth

#UC-6
function workingDayReached(){
   local isPartTime=1;
   local isFullTime=2;
   local empRatePerHrs=20;
   local workingDay=0;
   local workingHrs=0;
   local totalWorkingDay=20;
   local totalWorkingHrs=100;

   while [[ $workingDay -le $totalWorkingDay && $workingHrs -le $totalWorkingHrs ]]
   do 
      randomCheck=$(( RANDOM%3 ))

      case $randomCheck in
         $isFullTime)
           empHrs=8;
           workingHrs=$(( workingHrs + empHrs ));
           ((workingDay++))
         ;;
         $isPartTime)
           empHrs=4;
           workingHrs=$(( workingHrs + empHrs ));
           ((workingDay++))
         ;;
         *)
           empHrs=0;
         ;;
      esac
   done
   if [ $workingDay -eq $totalWorkingDay ]
   then
      salary=$(( empRatePerHrs*8*workingDay ));
   else
      salary=$(( empRatePerHrs*totalWorkingHrs ));
   fi
      echo "salary for month is $salary"

}
workingDayReached

#UC-7
function getEmpHrs (){
   local isPartTime=1;
   local isFullTime=2;
   randomCheck=$(( RANDOM%3 ))

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
    echo $empHrs;
}


function workingDayFunction(){
   local empRatePerHrs=20;
   local workingDay=0;
   local workingHrs=0;
   local totalWorkingDay=20;
   local totalWorkingHrs=100;

   while [[ $workingDay -le $totalWorkingDay && $workingHrs -le $totalWorkingHrs ]]
   do 
     empHrs=$(getEmpHrs)
     if [ $empHrs -gt 0 ]
     then
        ((workinDay++))
     fi
      workingHrs=$(( workingHrs + empHrs ));
   done
   if [ $workingDay -eq $totalWorkingDay ]
   then
      salary=$(( empRatePerHrs*8*workingDay ));
   else
      salary=$(( empRatePerHrs*totalWorkingHrs ));
   fi
      echo "salary for month is $salary"

}
workingDayFunction

#UC-8
function storeDailyWages(){
   local empRatePerHrs=20;
   local totalWorkingDay=20;
   local workingDay=0;
   local totalSalary=0;
   local salaryArray=[];
   local totalSalaryArray=[]
   local counter=0
   while [[ $workingDay -lt $totalWorkingDay  ]]
   do 
     empHrs=$(getEmpHrs)
     salary=$(( empRatePerHrs*empHrs ));
     totalSalary=$(( totalSalary + salary ))
     salaryArray[$counter]=$salary
     totalSalaryArray[((counter++))]=$totalSalary
     if [ $empHrs -gt 0 ]
     then
        ((workingDay++))
     fi
   done
   echo "daily wages of user is " ${salaryArray[@]}
   echo ""
   echo "total wages of user is " ${totalSalaryArray[@]}
}
storeDailyWages
function displayDictonary(){
   for key in ${!salaryDictonary[@]}
   do
      echo "date is $key and salary is ${salaryDictonary[$key]}"
   done

}

#UC-9
function storeDailyWagesWithDay(){
   local empRatePerHrs=20;
   local totalWorkingDay=20;
   local workingDay=0;
   local totalSalary=0;
   declare -A salaryDictonary;
   declare -A totalSalaryDictonary;
   local counter=0;
   while [[ $workingDay -lt $totalWorkingDay  ]]
   do 
     empHrs=$(getEmpHrs)
     salary=$(( empRatePerHrs*empHrs ));
     totalSalary=$(( totalSalary + salary ))
     now=$(date +%d/%m/%y -d "$DATE + $counter day")
     salaryDictonary[$now]=$salary;
     totalSalaryDictonary[$now]=$totalSalary
     ((counter++))
     if [ $empHrs -gt 0 ]
     then
        ((workingDay++))
     fi
   done
   echo "daily wages of user is " ${salaryDictonary[@]}
   echo ""
   echo "total wages of user is " ${totalSalaryDictonary[@]}
   displayDictonary
}
storeDailyWagesWithDay


