#!/bin/bash
PATH_TO_SCRIPT=$(dirname "$0")"/"

function delete {
    while read -r z; do
        if [ -d "$z" ]; then
            sudo rm -rf "$z"
        elif [ -f "$z" ]; then
            local x=$(dirname "$z")
            sudo rm -rf "$x"
        fi
    done < "$PATH_TO_SCRIPT/deleted_files.txt"
}

if [[ $# != 1 ]]; then
    echo "Enter the clean type: 1 - on path in logs file, 2 - one time in logs file, 3 - on mask"
    read -r param
else
    param=$1
fi

if [[ ! -f "../02/logs_file.txt" ]]; then
    echo "../02/logs_file.txt: No such file or directory"
else
    touch "$PATH_TO_SCRIPT/deleted_files.txt"
    name_log=$(awk '{print $1}' "../02/logs_file.txt" | awk '{print $NF}' | awk -F "." '{print $1}')
    case $param in
        1)
            awk '{print $1}' "../02/logs_file.txt" > "$PATH_TO_SCRIPT/deleted_files.txt"
            delete
            ;;
        2)
            ./cleanup_by_time.sh
            exit 0  # Завершаем выполнение после вызова вспомогательного скрипта
            ;;
        3)
            ./cleanup_by_mask.sh
            exit 0  # Завершаем выполнение после вызова вспомогательного скрипта
            ;;
        *)
            echo "ERROR! Invalid clean type."
            ;;
    esac
fi
