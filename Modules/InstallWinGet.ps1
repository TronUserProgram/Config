# Install Winget
Function InstallWinGet {
	# Check if winget is installed
	if (Test-Path ~\AppData\Local\Microsoft\WindowsApps\winget.exe){
		Write-Output "Winget Already Installed."
	}  
	else{
		# Installing winget from the Microsoft Store
		Write-Output "Winget not found, installing it now."
		Start-Process "ms-appinstaller:?source=https://aka.ms/getwinget"
		$nid = (Get-Process AppInstaller).Id
		Wait-Process -Id $nid
		Write-Output "Winget Installed"    
	}
	
}