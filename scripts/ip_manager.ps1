$base_url = "http://20.163.99.216:8080"
$base_url = "http://localhost:8000"

function sent_ip() {
    $url = "$base_url/api/update/"
    # get ip_address
    $ipAddress = Get-NetIPAddress | Where-Object {$_.PrefixOrigin -eq "Dhcp"} | Select-Object -ExpandProperty IPAddress
    $params = @{
        "dynamic_ip" = $ipAddress
        "user_name" = 'shke'
        "host_status" = $true
    }
    $response = Invoke-WebRequest -Uri $url -Method Get -Body $params
    return $response.Content
}

## todo 
<# '''
1. update host_status alive by user_name
    every 5 mins
    download latest json file
2. get ip by user_name from json file 

3. test django_crontab at ubuntu

4. trans pwsh script to bash script 

5. git commit to feat-build 
done
''' #>