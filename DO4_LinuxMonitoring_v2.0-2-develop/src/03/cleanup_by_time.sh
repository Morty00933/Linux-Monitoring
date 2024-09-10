#!/bin/bash
echo "Insert start time: YYYY-mm-DD HH:MM"
read -r startDate
echo "Insert end time: YYYY-mm-DD HH:MM"
read -r endDate
deleted=$(sudo find / -newermt "$startDate" ! -newermt "$endDate" 2>/dev/null | sort -r)
awk '{print $1}' "../02/logs_file.txt" > "$PATH_TO_SCRIPT/tmp_logs.txt"
while read -r j; do
    echo "$j" >> "$PATH_TO_SCRIPT/tmp_logs.txt"
done < "$PATH_TO_SCRIPT/tmp_logs.txt"
count=$(grep -f "$PATH_TO_SCRIPT/tmp_logs.txt" <<< "$deleted" | wc -l)
for ((m = 1; m <= count; m++)); do
    grep -f "$PATH_TO_SCRIPT/tmp_logs.txt" <<< "$deleted" | head -n "$m" | tail -n 1 >> "$PATH_TO_SCRIPT/deleted_files.txt"
done
delete
rm -f "$PATH_TO_SCRIPT/tmp_logs.txt"
