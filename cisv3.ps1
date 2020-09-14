



echo "Set Minimum password length to 14 or more character(s)" 
$a = "Set Minimum password length to 14 or more character(s)-> "
$b = net accounts | findstr /i /c:"Minimum password length"
$a += if ($b -match "14") {echo "Passed"} else {echo "Failed"}
write-output $a >> audit.txt

echo "Set Password must meet complexity requirements to Enabled" 
$a = "Set Password must meet complexity requirements to Enabled-> "
$b = net accounts | findstr /i /C:"password history"
$a += if ($b -match "24") {echo "Passed"} else {echo "Failed"}
write-output $a >> audit.txt

echo "Set Maximum password age to 60 or fewer days" 
$a = "Set Maximum password age to 60 or fewer days-> "
$b = net accounts | findstr /i /c:"Maximum password age"
$a += if ($b -match "60") {echo "Passed"} else {echo "Failed"}
write-output $a >> audit.txt

echo "Set Account lockout threshold to 5 invalid logon attempt(s)" 
$a = "Set Account lockout threshold to 5 invalid logon attempt(s)-> "
$b = net accounts | findstr /i /c:"lockout threshold"
$a += if ($b -match "5") {echo "Passed"} else {echo "Failed"}
write-output $a >> audit.txt

echo "Set Account lockout duration to 15 or more minute(s)" 
$a = "Set Account lockout duration to 15 or more minute(s)-> "
$b = net accounts | findstr /i /c:"lockout duration"
$a += if ($b -match "15") {echo "Passed"} else {echo "Failed"}
write-output $a >> audit.txt

echo "Set Reset account lockout counter after to 15 minute(s)" 
$a = "Set Reset account lockout counter after to 15 minute(s)-> "
$b = net accounts | findstr /i /c:"lockout duration"
$a += if ($b -match "30") {echo "Passed"} else {echo "Failed"}
write-output $a >> audit.txt


echo "Set Enforce password history to 24 or more password(s)" 
$a = "Set Enforce password history to 24 or more password(s)-> "
$b = net accounts | findstr /i /C:"password history"
$a += if ($b -match "24") {echo "Passed"} else {echo "Failed"}
write-output $a >> audit.txt

echo "Set Minimum password age to 1 or more day(s)" 
$a = "Set Minimum password age to 1 or more day(s)-> "
$b = net accounts | findstr /i /c:"Minimum password age"
$a += if ($b -match "1") {echo "Passed"} else {echo "Failed"}
write-output $a >> audit.txt

echo "Set Audit Policy: Account Logon: Credential Validation to Success and Failure" 
$a = "Set Audit Policy: Account Logon: Credential Validation to Success and Failure-> "
$b = auditpol /get /category:* | findstr /i "cread"
$a += if ($b -match "Success and Failure") {echo "Passed"} else {echo "Failed"}
write-output $a >> audit.txt



echo "Configure Accounts: Rename administrator account" 
$a = "Configure Accounts: Rename administrator account-> "
$b = net user | findstr /i "administrator"
$a += if ($b -match "Administrator" ) {echo "Failed"} else {echo "Passed"}
write-output $a >> audit.txt

echo "Configure Accounts: Rename guest account" 
$a = "onfigure Accounts: Rename guest account-> "
$b = net user | findstr /i "guest"
$a += if ($b -match "Guest" ) {echo "Failed"} else {echo "Passed"}
write-output $a >> audit.txt

echo "Set Accounts: Limit local account use of blank passwords to console logon only to Enabled" 
$a = "Set Accounts: Limit local account use of blank passwords to console logon only to Enabled-> "
$b = reg query HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\LSA | findstr /i "limit"
$a += if ($b -match "0x1" ) {echo "Passed"} else {echo "Failed"}
write-output $a >> audit.txt

echo "Set Interactive logon: Do not display last user name to Enabled" 
$a = "Set Interactive logon: Do not display last user name to Enabled-> "
$b = reg query "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System" | findstr /i "DontDisplay"
$a += if ($b -match "0x1" ) {echo "Passed"} else {echo "Failed"}
write-output $a >> audit.txt












