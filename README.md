# A sample powershell script that can pull user login and logout logs from event viewer for a given computer name and a time range. 
You can modify the script to suit your needs. For example, you can change the computer name, the time range, the logon type, or the output file name.\
you can apply the filter on username by adding a Where-Object clause to the $result variable. For example, if you want to see the information for the user John, you can use this code

# Filter the result by username
$result = $result | Where-Object {$_.UserName -eq "John"}

# LogonType
In the result set LogonType is a property that indicates the kind of logon that occurred. For example, LogonType 2 means interactive logon, which means the user logged on locally to the computer. LogonType 3 means network logon, which means the user accessed a network resource such as a shared folder. You can see the full list of LogonType values and their meanings here. LogonType is useful for filtering the events based on the type of logon you are interested in. Hope this helps.
