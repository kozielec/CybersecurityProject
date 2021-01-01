#!/bin/bash
Favstate=('Hawaii' 'Nebraska' 'california' 'DC' 'texas')
for state in ${Favstate[@]}:
do 
 if [ $state == 'Hawaii' ]; 
 then
 echo "Hawaii is the best!"
else
echo "I'm not fond of Hawaii"
fi
done

#for loop that checks for state "Hawaii' in list of states if the hawaii is th$
for state in ${states[@]}
do

  if [ $state == 'Hawaii' ];
  then
    echo "Hawaii is the best!"
  else
    echo "I'm not a fan of Hawaii."
  fi

