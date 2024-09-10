#!/bin/bash

# Function to sort entries by response code
sort_entries_by_response_code() {
    local log_files="$1"
    echo "Sorting entries by response code:"
    cat $log_files | awk '{print $NF, $0}' | sort -n -k1 | cut -d' ' -f2-
}

# Function to display unique IPs
display_unique_ips() {
    local log_files="$1"
    echo "Unique IPs:"
    cat $log_files | awk '{print $1}' | sort -u
}

# Function to display requests with errors (4xx or 5xx)
display_requests_with_errors() {
    local log_files="$1"
    echo "Requests with errors (4xx or 5xx):"
    cat $log_files | awk '$(NF-1) ~ /^[45]/ {print}'
}

# Function to display unique IPs with errors
display_unique_ips_with_errors() {
    local log_files="$1"
    echo "Unique IPs with errors:"
    cat $log_files | awk '$(NF-1) ~ /^[45]/ {print $1}' | sort -u
}
