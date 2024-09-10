#!/bin/bash

white_bk="\033[107m"
red_bk="\033[101m"
green_bk="\033[102m"
blue_bk="\033[104m"
purple_bk="\033[105m"
black_bk="\033[40m"

white_t="\033[97m"
red_t="\033[91m"
black_t="\033[30m"
blue_t="\033[94m"
purple_t="\033[95m"
black_t="\033[30m"
green_t="\033[92m"

function back() {
	col=$1
if [[ $col == 1 ]];
	then
	echo $white_bk
elif [[ $col == 2 ]];
	then
	echo $red_bk
elif [[ $col == 3 ]];
	then
	echo $green_bk
elif [[ $col == 4 ]];
	then
	echo $blue_bk
elif [[ $col == 5 ]];
	then
	echo $purple_bk
elif [[ $col == 6 ]];
	then
	echo $black_bk
fi
}

function text() {
	col1=$1
if [[ $col1 == 1 ]];
	then
	echo $white_t
elif [[ $col1 == 2 ]];
	then
	echo $red_t
elif [[ $col1 == 3 ]];
	then
	echo $green_t
elif [[ $col1 == 4 ]];
	then
	echo $blue_t
elif [[ $col1 == 5 ]];
	then
	echo $purple_t
elif [[ $col1 == 6 ]];
	then
	echo $black_t
fi

}

echo -e $(back $backCol1)$(text $txtCol1)$1$(back $backCol2)$(text $txtCol2)$2"\e[0m"