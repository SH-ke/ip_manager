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
$user_name = 'template'

function ip_update() {
    $url = "$base_url/api/update/"
    # get ip_address
    # Get-NetIPAddress | Sort-Object -Property InterfaceIndex | Format-Table
    $ipAddress = Get-NetIPAddress | Where-Object {$_.PrefixOrigin -eq "Dhcp" -and $_.AddressState -eq "Preferred"} | Select-Object -ExpandProperty IPAddress

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

# 自动任务
<#
您可以使用以下命令来查看计划任务的详细信息：
```powershell
Get-ScheduledTask -TaskName "IP Manager Auto-Task" | Select-Object TaskName, TaskPath, State, LastRunTime, NextRunTime
```
这将显示任务名称，任务路径，状态，上次运行时间和下次运行时间。如果您想查看计划任务的所有详细信息，请使用以下命令：
```powershell
Get-ScheduledTask -TaskName "IP Manager Auto-Task" | fl *
```
这将显示计划任务的所有详细信息。
#>
function Create_IP_Task {
    $Trigger = New-ScheduledTaskTrigger -Once -At (Get-Date) -RepetitionInterval (New-TimeSpan -Minutes 5) -RepetitionDuration (New-TimeSpan -Days 365)
    $Action = New-ScheduledTaskAction -Execute 'powershell.exe' -Argument '-ExecutionPolicy Bypass -Command "& {ip_update}"'
    Register-ScheduledTask -TaskName "IP Manager Auto-Task" -Trigger $Trigger -Action $Action
}

## functions : 
# every 5 mins
# update host_status alive by user_name
# download the latest json file 