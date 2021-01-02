  #!/bin/bash

Izka=('/etc/shadow' '/etc/passwd' '/etc/gshadow' '/etc/groups')
for location in ${Izka[@]}
	do
echo $location
	if [ $location == '/etc/shadow' ] || [ $location == '/etc/passwd' ]
	then
	echo "the directory exist"
echo $(ls -al $location)
	else
	echo "directory not found"
fi
done
