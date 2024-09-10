#!/bin/bash

source log_utils.sh  # Подключаем файл с утилитами

# Main script
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <option>"
    echo "Options: 1 - Sort entries by response code"
    echo "         2 - Display unique IPs"
    echo "         3 - Display requests with errors (4xx or 5xx)"
    echo "         4 - Display unique IPs with errors"
    exit 1
fi

option="$1"
log_files=$(ls nginx_log_*.log)

case $option in
    1)
        sort_entries_by_response_code "$log_files"
        ;;
    2)
        display_unique_ips "$log_files"
        ;;
    3)
        display_requests_with_errors "$log_files"
        ;;
    4)
        display_unique_ips_with_errors "$log_files"
        ;;
    *)
        echo "Invalid option. Use 1, 2, 3, or 4."
        exit 1
        ;;
esac
