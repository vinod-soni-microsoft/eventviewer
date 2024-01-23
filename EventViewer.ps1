# Specify the computer name and the time range
$computer = "[Target ServerName]"
$after = (Get-Date).AddDays(-7)

# Get the logon and logoff events from the security log
$events = Get-WinEvent -LogName Security -ComputerName $computer -FilterXPath "*[System[(EventID=4624 or EventID=4634) and TimeCreated[@SystemTime>='$($after.ToUniversalTime().ToString('o'))']]]"

# Create a custom object with the relevant properties
$result = $events | ForEach-Object {
    $xml = [xml]$_.ToXml()
    [PSCustomObject]@{
        Time = $_.TimeCreated
        EventID = $_.Id
        UserName = $xml.Event.EventData.Data[5].'#text'
        LogonType = $xml.Event.EventData.Data[8].'#text'
        SourceIP = $xml.Event.EventData.Data[18].'#text'
    }
}

# Filter the result by username
$result = $result | Where-Object {$_.UserName -eq "[username]"}


# Export the result to a csv file
$result | Export-Csv -NoTypeInformation -Path "C:\users\vinodsoni\Logon_Logoff.csv"