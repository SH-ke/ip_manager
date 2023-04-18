### HOW TO USE

# add this script into $$PROFILE.CurrentUserAllHosts
# . D:\your\path\here\ip_manager.ps1
# MIND THE dot space path
# change the Necessary Variables to your configuration
# use command `ip_update` to create or update dynamic ip
# use command `ip_read` to get ip by user_name

### examples:
# ip_update
# {"success": true, "message": "IP address created successfully."}

# ip_read 'shke'
# 10.120.174.111

# ip_read 'shke' | ForEach-Object { ping $_ }
# 正在 Ping 10.120.174.111 具有 32 字节的数据:
# 来自 10.120.174.111 的回复: 字节=32 时间<1ms TTL=128
# 来自 10.120.174.111 的回复: 字节=32 时间<1ms TTL=128
# 来自 10.120.174.111 的回复: 字节=32 时间<1ms TTL=128
# 来自 10.120.174.111 的回复: 字节=32 时间<1ms TTL=128

# 10.120.174.111 的 Ping 统计信息:
#     数据包: 已发送 = 4，已接收 = 4，丢失 = 0 (0% 丢失)，
# 往返行程的估计时间(以毫秒为单位):
#     最短 = 0ms，最长 = 0ms，平均 = 0ms


# Necessary Variables
$base_url = "http://20.163.99.216:8080"
# $base_url = "http://localhost:8000"
# download json file in this path
$JsonFilePath = '~'
$user_name = 'shke'

function ip_update() {
    $url = "$base_url/api/update/"
    # get ip_address
    $ipAddress = Get-NetIPAddress | Where-Object {$_.PrefixOrigin -eq "Dhcp"} | Select-Object -ExpandProperty IPAddress

    $params = @{
        "dynamic_ip" = $ipAddress
        "user_name" = $user_name
        "host_status" = $true
    }
    $response = Invoke-WebRequest -Uri $url -Method Get -Body $params

    # get the latest json file
    $url = "$base_url/download/ip/"
    $output = "$JsonFilePath/data.bak.json"
    Invoke-WebRequest -Uri $url -OutFile $output

    return $response.Content
}

function ip_read {
    param(
        [string]$UserName
    )

    $json = Get-Content -Raw -Path "$JsonFilePath/data.bak.json" | ConvertFrom-Json
    $dynamicIp = ($json | Where-Object { $_.user_name -eq $UserName }).dynamic_ip
    # Write-Output $dynamicIp
    return $dynamicIp
}

## functions : 
# every 5 mins
# update host_status alive by user_name
# download the latest json file 