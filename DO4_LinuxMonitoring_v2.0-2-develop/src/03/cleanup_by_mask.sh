#!/bin/bash
echo "Enter the mask: abcd_DDMMYY"
read -r mask_name
date_name=$(echo "$mask_name" | awk -F "_" '{print $2}')
mask_name=$(echo "$mask_name" | awk -F "_" '{print $1}')
length_name=${#mask_name}
NAME="([^\s]*\/)"
for ((v = 1; v <= length_name; v++)); do
    arr[$v]=
    arr[$v]=$(expr substr "$mask_name" "$v" 1 2>/dev/null)
    NAME+="${arr[$v]}+"
done
NAME+="_$date_name/"
v=1
count=$(sudo find / -type d | grep -E "*$NAME*" | wc -l)
for ((v = 1; v <= count; v++)); do
    sudo find / -type d | grep -E "*$NAME*" | head -n "$v" | tail -n 1 >> "$PATH_TO_SCRIPT/deleted_files.txt"
done
delete
