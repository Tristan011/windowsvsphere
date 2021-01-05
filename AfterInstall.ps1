Param (
	[Parameter(Mandatory=$True)]
    	[int16]
	$count
)

$PlainPassword = "Pass123!"
$SecurePassword = $PlainPassword | ConvertTo-SecureString -AsPlainText -Force

Install-WindowsFeature –Name AD-Domain-Services –IncludeManagementTools
Install-ADDSForest -DomainName "Company$count.local" -SafeModeAdministratorPassword $SecurePassword -CreateDnsDelegation:$false -DatabasePath "C:\Windows\NTDS" -DomainMode "7" -DomainNetbiosName "Company$count" -ForestMode "7" -InstallDns:$true -LogPath "C:\Windows\NTDS" -NoRebootOnCompletion:$True -SysvolPath "C:\Windows\SYSVOL" -Force:$true