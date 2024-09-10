#!/bin/bash

if [ $# != 4 ]; then
       echo "Parametrs can't be here"
elif [[ $1 != [1-6] || $2 != [1-6] || $3 != [1-6] || $4 != [1-6] ]];
 	then 
	echo "Error type of color"	
elif [[ $1 == $2 || $3 == $4 ]];
	then
	echo "Not recommended to use this colors. Try again"
else
	export backCol1=$1
	export txtCol1=$2
	export backCol2=$3
	export txtCol2=$4
	chmod +x color.sh
	chmod +x info.sh
	bash info.sh
fi	