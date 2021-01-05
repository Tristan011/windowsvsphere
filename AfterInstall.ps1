Param (
	[Parameter(Mandatory=$True)]
    	[int16]
	$count
)

Rename-Computer -NewName "Company$count" -Force
Install-WindowsFeature –Name AD-Domain-Services –IncludeManagementTools
Install-ADDSForest -DomainName "Company$count.local" -CreateDnsDelegation:$false -DatabasePath "C:\Windows\NTDS" -DomainMode "7" -DomainNetbiosName "Company$count" -ForestMode "7" -InstallDns:$true -LogPath "C:\Windows\NTDS" -NoRebootOnCompletion:$True -SysvolPath "C:\Windows\SYSVOL" `-Force:$true