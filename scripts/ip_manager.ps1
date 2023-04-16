$base_url = "127.0.0.1:8080"

# Function to create a new IP address entry using a POST request
function create_ip_address {
    $url = "$base_url/ip_addresses/create/"
    $data = @{
        dynamic_ip = $env:REMOTE_ADDR
        host_status = 1
        user_name = "johndoe"
        # latest_update = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    }
    $json = $data | ConvertTo-Json
    $headers = @{
        "Content-Type" = "application/json"
    }
    $response = curl -X POST -H $headers -d $json $url
    return $response
}

## todo 
'''
1. update host_status alive by user_name
    every 5 mins
    download latest json file
2. get ip by user_name from json file 

3. test django_crontab at ubuntu

4. trans pwsh script to bash script 

5. git commit to feat-build 
'''