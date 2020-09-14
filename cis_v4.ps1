
Set-ExecutionPolicy -ExecutionPolicy unrestricted -force
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
echo "check the antivirus on the machine"
$a = "check the antivirus on the machine-> "
$b = Get-CimInstance -Namespace root/SecurityCenter2 -ClassName AntivirusProduct | findstr /i /c:"Defender"
$a += if ($b -match "Defender") {echo "Passed"} else {echo "Failed"}
write-output $a >> audit.txt
echo "Set current TimeZone"
$a = "Set current TimeZone-> "
$b = systeminfo | findstr  /C:”Time Zone”
$a += if ($b -match "Muscat") {echo "Passed"} else {echo "Failed"}
write-output $a >> audit.txt
echo "Limit local account use of blank passwords" 
$a = "Limit local account use of blank passwords-> "
$b = reg query HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\LSA | findstr /i "limit"
$a += if ($b -match "0x1" ) {echo "Passed"} else {echo "Failed"}
write-output $a >> audit.txt
echo "prevent users from installing printer drivers" 
$a = "prevent users from installing printer drivers-> "
$b = reg query "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Print\Providers\LanMan Print Services\Servers" | findstr /i "AddPrinterDriver"
$a += if ($b -match "0x1" ) {echo "Passed"} else {echo "Failed"}
write-output $a >> audit.txt
echo "Configure Interactive logon: Message title for users attempting to log on" 
$a = "Interactive logon: Message title for users attempting to log on-> "
$b = reg query "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System" | findstr /i "legalnoticeCaption"
$a += if ($b -match "Warning") {echo "Passed"} else {echo "Failed"}
write-output $a >> audit.txt
echo "Set Interactive logon: Do not display last user name to Enabled" 
$a = "Set Interactive logon: Do not display last user name to Enabled-> "
$b = reg query "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System" | findstr /i "DontDisplay"
$a += if ($b -match "0x1" ) {echo "Passed"} else {echo "Failed"}
write-output $a >> audit.txt
echo "Set MSS: (ScreenSaverGracePeriod) The time in seconds before the screen saver grace period expires" 
$a = "Set MSS: (ScreenSaverGracePeriod) The time in seconds before the screen saver grace period expires-> "
$b = reg query "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\Winlogon"  | findstr /i "ScreenSaverGracePeriod"
$a += if ($b -match "5") {echo "Failed"} else {echo "Passed"}
write-output $a >> audit.txt
echo "Set Network access: Do not allow anonymous enumeration of SAM accounts and shares to Enabled" 
$a = "Set Network access: Do not allow anonymous enumeration of SAM accounts and shares to Enabled-> "
$b = reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa"  | findstr /i "restrictanonymous"
$a += if ($b -match "0x1") {echo "Failed"} else {echo "Passed"}
write-output $a >> audit.txt
echo "Set Network access: Do not allow anonymous enumeration of SAM accounts to Enabled" 
$a = "Set Network access: Do not allow anonymous enumeration of SAM accounts to Enabled-> "
$b = reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa"  | findstr /i "restrictanonymoussam"
$a += if ($b -match "0x1") {echo "Failed"} else {echo "Passed"}
write-output $a >> audit.txt
echo "Set Network access: Let Everyone permissions apply to anonymous users to Disabled" 
$a = "Set Network access: Let Everyone permissions apply to anonymous users to Disabled-> "
$b = reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa"  | findstr /i "Everyone"
$a += if ($b -match "0x0") {echo "Failed"} else {echo "Passed"}
write-output $a >> audit.txt
echo "Set Network access: Allow anonymous SID/Name translation to Disabled" 
$a = "Set Network access: Allow anonymous SID/Name translation to Disabled-> "
$b = reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Eventlog\Security"  | findstr /i "WarningLevel"
$a += if ($b -match "9") {echo "Failed"} else {echo "Passed"}
write-output $a >> audit.txt
echo "Set Network access: Remotely accessible registry paths and sub-paths" 
$a = "Set Network access: Remotely accessible registry paths and sub-paths-> "
$b = reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa"  | findstr /i "Everyone"
$a += if ($b -match "0x0") {echo "Failed"} else {echo "Passed"}
write-output $a >> audit.txt

echo "Set Network access: Restrict anonymous access to Named Pipes and Shares to Enabled"
$a = "Set Network access: Restrict anonymous access to Named Pipes and Shares to Enabled-> "
$b = reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa"  | findstr /i " restrictnullsessaccess"
$a += if ($b -match "0x0") {echo "Failed"} else {echo "Passed"}
write-output $a >> audit.txt
echo "Set MSS: (WarningLevel) Percentage threshold for the security event log at which the system will generate a warning to 0.9 or less" 
$a = "Set MSS: (WarningLevel) Percentage threshold for the security event log at which the system will generate a warning to 0.9 or less-> "
$b = reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Eventlog\Security"  | findstr /i "WarningLevel"
$a += if ($b -match "9") {echo "Failed"} else {echo "Passed"}
write-output $a >> audit.txt
echo "Set MSS: (DisableIPSourceRouting IPv6) IP source routing protection level" 
$a = "Set MSS: (DisableIPSourceRouting IPv6) IP source routing protection level-> "
$b = reg query "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\Winlogon"  | findstr /i "autoadmin"
$a += if ($b -match "0") {echo "Failed"} else {echo "Passed"}
write-output $a >> audit.txt
echo "Set MSS: (AutoAdminLogon) Enable Automatic Logon to Disabled" 
$a = "Set MSS: (AutoAdminLogon) Enable Automatic Logon to Disabled-> "
$b = reg query "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\Winlogon"  | findstr /i "autoadmin"
$a += if ($b -match "0") {echo "Failed"} else {echo "Passed"}
write-output $a >> audit.txt
echo "Set Interactive logon: Machine account lockout threshold to 10 or fewer invalid logon attempts" 
$a = "Set Interactive logon: Machine account lockout threshold to 10 or fewer invalid logon attempts-> "
$b = reg query "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\WinLogon"  | findstr /i "ForceUnlock"
$a += if ($b -match "0x0" ) {echo "Passed"} else {echo "Failed"}
write-output $a >> audit.txt
echo "Set Audit: Shut down system immediately if unable to log security audits to Disabled" 
$a = "Set Audit: Shut down system immediately if unable to log security audits to Disabled-> "
$b = reg query HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\LSA | findstr /i "crashonauditfail"
$a += if ($b -match "0x0" ) {echo "Passed"} else {echo "Failed"}
write-output $a >> audit.txt
echo "Set Audit Policy: Account Management: Security Group Management to Success and Failure" 
$a = "Set Audit Policy: Account Management: Security Group Management to Success and Failure-> "
$b = auditpol /get /category:* | findstr /i /c:"Security Group Management"
$a += if ($b -match "Success and Failure") {echo "Passed"} else {echo "Failed"}
write-output $a >> audit.txt
echo "Set Audit Policy: Account Management: User Account Management to Success and Failure" 
$a = "Set Audit Policy: Account Management: User Account Management to Success and Failure-> "
$b = auditpol /get /category:* | findstr /i /c:"User Account Management"
$a += if ($b -match "Success and Failure") {echo "Passed"} else {echo "Failed"}
write-output $a >> audit.txt
echo "Set Audit Policy: Logon-Logoff: Logoff to Success" 
$a = "Set Audit Policy: Logon-Logoff: Logoff to Success-> "
$b = auditpol /get /category:* | findstr /i /c:"Logoff"
$a += if ($b -match "Success") {echo "Passed"} else {echo "Failed"}
write-output $a >> audit.txt
echo "Set Audit Policy: Logon-Logoff: Logon to Success and Failure" 
$a = "Set Audit Policy: Logon-Logoff: Logon to Success and Failure-> "
$b = auditpol /get /category:* | findstr /i /c:"Logon"
$a += if ($b -match "Success and Failure") {echo "Passed"} else {echo "Failed"}
write-output $a >> audit.txt
echo "Set Audit Policy: Logon-Logoff: Other Logon/Logoff Events to No Auditing" 
$a = "Set Audit Policy: Logon-Logoff: Other Logon/Logoff Events to No Auditing-> "
$b = auditpol /get /category:* | findstr /i /c:"Other Logon/Logoff Events"
$a += if ($b -match "No Auditing") {echo "Passed"} else {echo "Failed"}
write-output $a >> audit.txt
echo "Set Audit Policy: Logon-Logoff: Special Logon to Success" 
$a = "Set Audit Policy: Logon-Logoff: Special Logon to Success-> "
$b = auditpol /get /category:* | findstr /i /c:"Special Logon"
$a += if ($b -match "Success") {echo "Passed"} else {echo "Failed"}
write-output $a >> audit.txt
echo "Set Audit Policy: Logon-Logoff: Special Logon to Success" 
$a = "Set Audit Policy: Logon-Logoff: Special Logon to Success-> "
$b = auditpol /get /category:* | findstr /i /c:"Special Logon"
$a += if ($b -match "Success") {echo "Passed"} else {echo "Failed"}
write-output $a >> audit.txt
echo "Set Audit Policy: Object Access: Removable Storage to No Auditing" 
$a = "Set Audit Policy: Object Access: Removable Storage to No Auditing-> "
$b = auditpol /get /category:* | findstr /i /c:"Removable Storage"
$a += if ($b -match "No Auditing") {echo "Passed"} else {echo "Failed"}
write-output $a >> audit.txt
echo "Set Audit Policy: Object Access: SAM to No Auditing" 
$a = "Set Audit Policy: Object Access: SAM to No Auditing-> "
$b = auditpol /get /category:* | findstr /i /c:"SAM"
$a += if ($b -match "No Auditing") {echo "Passed"} else {echo "Failed"}
write-output $a >> audit.txt
echo "Set Audit Policy: Policy Change: Audit Policy Change to Success and Failure" 
$a = "Set Audit Policy: Policy Change: Audit Policy Change to Success and Failure-> "
$b = auditpol /get /category:* | findstr /i /c:"Audit Policy Change"
$a += if ($b -match "Success and Failure") {echo "Passed"} else {echo "Failed"}
write-output $a >> audit.txt
echo "List of installed softwares" 
$b = Get-WmiObject -Class Win32_Product  | select Name, Version
write-output $b >> installed_softwares.txt
echo "List of running services" 
$b = Get-Service | Where-Object {$_.Status -eq "Running"}
write-output $b >> running_services.txt
echo "System Information"
$b = Get-ComputerInfo | select WindowsProductName, WindowsVersion, OsHardwareAbstractionLayer
write-output $b >> system_info.txt 
$b = Get-ComputerInfo -Property Windows*
write-output $b >> system_info.txt 
$b = auditpol /get /category:*
write-output $b >> system_info.txt 
$b = Get-LocalUser | Select *
write-output $b >> system_info.txt 
$b = Get-LocalGroupMember -name users
write-output $b >> system_info.txt 
#$b = Get-DnsClientServerAddress | Select-Object –ExpandProperty ServerAddresses
#write-output $b >> system_info.txt 
$b = $env:computername
write-output $b >> system_info.txt 
















































