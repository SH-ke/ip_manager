#!/bin/bash

### HOW TO USE

# add this script to ~/.bashrc, and source .bashrc
# source /path/to/ip_manager.sh
# export -f ip_update
# export -f ip_read

base_url="http://20.163.99.216:8080"
# base_url="http://localhost:8000"
# download json file in this path
JsonFilePath="~"
user_name="shke"

ip_update() {
    url="$base_url/api/update/"
    # get ip_address
    ipAddress=$(hostname -I | awk '{print $1}')

    params=(
        "dynamic_ip=$ipAddress"
        "user_name=$user_name"
        "host_status=true"
    )
    response=$(curl -s -X GET "$url" -d "${params[*]}")

    # get the latest json file
    url="$base_url/download/ip/"
    output="$JsonFilePath/data.bak.json"
    curl -s -X GET "$url" -o "$output"

    echo "$response"
}

ip_read() {
    local userName="$1"

    json=$(cat "$JsonFilePath/data.bak.json" | jq '.')
    dynamicIp=$(echo "$json" | jq --arg un "$userName" '.[] | select(.user_name == $un) | .dynamic_ip')

    echo "$dynamicIp"
}

ip_update
ip_read "$user_name"
## todo 
# 1. update host_status alive by user_name
#     every 5 mins
#     download latest json file
# 2. test django_crontab at ubuntu
# 3. trans pwsh script to bash script 
# 4. file method export, upload 
# 5. README.md, LICENSE, 

