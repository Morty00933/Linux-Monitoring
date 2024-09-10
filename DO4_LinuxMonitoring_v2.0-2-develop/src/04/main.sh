#!/bin/bash

source log_utils.sh  # Подключаем файл с утилитами для генерации логов

# Main script
for day in {1..5}; do
    generate_daily_logs "$day"
done

echo "Log generation completed."
