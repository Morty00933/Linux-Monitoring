#!/bin/bash

# Array of response codes
response_codes=("200" "201" "400" "401" "403" "404" "500" "501" "502" "503")

# Array of HTTP methods
http_methods=("GET" "POST" "PUT" "PATCH" "DELETE")

# Array of user agents
user_agents=("Mozilla" "Google Chrome" "Opera" "Safari" "Internet Explorer" "Microsoft Edge" "Crawler and bot" "Library and net tool")

# Generate a random IP address
generate_ip() {
    echo "$(($RANDOM%256)).$(($RANDOM%256)).$(($RANDOM%256)).$(($RANDOM%256))"
}

# Generate a random date in format [dd/Mon/yyyy:HH:mm:ss +ZZZZ]
generate_date() {
    day=$(($RANDOM%30 + 1))  # Random day in a month
    hour=$(($RANDOM%24))     # Random hour
    minute=$(($RANDOM%60))   # Random minute
    second=$(($RANDOM%60))   # Random second
    echo "$day/Aug/2023:$hour:$minute:$second +0300"
}

# Generate a random URL path
generate_url() {
    paths=("/home" "/about" "/contact" "/products" "/blog")
    echo "${paths[$(($RANDOM%${#paths[@]}))]}"
}

# Generate a random log entry
generate_log_entry() {
    ip=$(generate_ip)
    response_code=${response_codes[$(($RANDOM%${#response_codes[@]}))]}
    method=${http_methods[$(($RANDOM%${#http_methods[@]}))]}
    date=$(generate_date)
    url=$(generate_url)
    agent=${user_agents[$(($RANDOM%${#user_agents[@]}))]}
    
    echo "$ip - - [$date] \"$method $url HTTP/1.1\" $response_code - \"$agent\""
}

# Generate logs for a day
generate_daily_logs() {
    local day="$1"
    if [ "$day" -lt 1 ] || [ "$day" -gt 5 ]; then
        echo "Invalid day value."
        exit 1
    fi

    num_entries=$(($RANDOM%901 + 100))  # Random number of entries between 100 and 1000
    for ((i=0; i<num_entries; i++)); do
        entry=$(generate_log_entry)
        echo "$entry" >> "nginx_log_${day}.log"
    done
    echo "Generated $num_entries log entries for day $day"
}
