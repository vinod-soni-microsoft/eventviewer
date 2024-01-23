# A sample powershell script that can pull user login and logout logs from event viewer for a given computer name and a time range. 
You can modify the script to suit your needs. For example, you can change the computer name, the time range, the logon type, or the output file name.\
you can apply the filter on username by adding a Where-Object clause to the $result variable. For example, if you want to see the information for the user John, you can use this code

# Filter the result by username
$result = $result | Where-Object {$_.UserName -eq "John"}
