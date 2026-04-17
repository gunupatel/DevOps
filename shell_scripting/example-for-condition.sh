#!/bin/bash
# conditional id else elif
read -p "Enter marks: " marks 
if [ $marks -ge 90 ]; 
then 
echo "Grade A" 
elif [ $marks -ge 70 ]; 
then 
echo "Grade B" 
elif [ $marks -ge 50 ]; 
then 
echo "Grade C"
else 
echo "Fail" 
fi
