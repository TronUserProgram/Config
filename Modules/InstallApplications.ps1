##### Install Applications

# Install WinGet
Function InstallWinget {
$progressPreference = 'silentlyContinue'
Write-Information "Downloading WinGet and its dependencies..."
Invoke-WebRequest -Uri https://aka.ms/getwinget -OutFile Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle
Invoke-WebRequest -Uri https://aka.ms/Microsoft.VCLibs.x64.14.00.Desktop.appx -OutFile Microsoft.VCLibs.x64.14.00.Desktop.appx
Invoke-WebRequest -Uri https://github.com/microsoft/microsoft-ui-xaml/releases/download/v2.8.6/Microsoft.UI.Xaml.2.8.x64.appx -OutFile Microsoft.UI.Xaml.2.8.x64.appx
Add-AppxPackage Microsoft.VCLibs.x64.14.00.Desktop.appx
Add-AppxPackage Microsoft.UI.Xaml.2.8.x64.appx
Add-AppxPackage Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle
}

# Install Winget
Function InstallWinget_Alternative {
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

# Install VLC
Function InstallVLC {
	winget install -e --id VideoLAN.VLC --force --silent --accept-package-agreements
}

# Uninstall VLC
Function UninstallVLC {
	winget uninstall -e --id VideoLAN.VLC
}

# Install Steam
Function InstallSteam {
	winget install -e --id Valve.Steam --force --silent --accept-package-agreements
}

# Uninstall Steam
Function UninstallSteam {
	winget uninstall -e --id Valve.Steam
}

# Install Discord
Function InstallDiscord {
	winget install -e --id Discord.Discord --force --silent  --accept-package-agreements
}

# Uninstall Discord
Function UninstallDiscord {
	winget uninstall -e --id Discord.Discord
}

# Install Outlook
Function InstallOutlook {
	winget install -i -e --id=9NRX63209R7B --source=msstore --force --silent --accept-package-agreements
}

# Uninstall Outlook
Function UninstallOutlook {
	winget uninstall -i -e --id=9NRX63209R7B
}

# Install Chrome
Function InstallChrome {
	winget install -e --id Google.Chrome --force --silent --accept-package-agreements
}

# Uninstall Chrome
Function UninstallChrome {
	winget uninstall -e --id Google.Chrome
}

# Install Nvidia Experience
Function InstallNvidiaExperience {
	winget install -e --id Nvidia.GeForceExperience --force --silent --accept-package-agreements
}

# Uninstall Nvidia Experience
Function UninstallNvidiaExperience {
	winget uninstall -e --id Nvidia.GeForceExperience
}

# Install OpenOffice
Function InstallOpenOffice {
	winget install -e --id Apache.OpenOffice --force --accept-package-agreements
}

# Uninstall OpenOffice
Function UninstallOpenOffice {
	winget uninstall -e --id Apache.OpenOffice
}

# Install Citrix Workspace App
Function InstallCitrixWorkspaceApp {
	winget install -e --id XPFCG3278HX4X9 --force  --accept-package-agreements
}

# Uninstall Citrix Workspace App
Function UninstallCitrixWorkspaceApp {
	winget uninstall -e --id XPFCG3278HX4X9
}

# Install StreamDeck
Function InstallStreamDeck {
	winget install -e --id Elgato.StreamDeck --force --silent --accept-package-agreements
}

# Uninstall StreamDeck
Function UninstallStreamDeck {
	winget uninstall -e --id Elgato.StreamDeck
}

# Install Teamviewer
Function InstallTeamviewer {
	winget install -e --id TeamViewer.TeamViewer --force --silent --accept-package-agreements
}

# Uninstall Teamviewer
Function UninstallTeamviewer {
	winget uninstall -e --id TeamViewer.TeamViewer
}

# Install VMWare Horizon Client
Function InstallVMWareHorizon {
	winget install -e --id VMware.HorizonClient --force --accept-package-agreements
}

# Uninstall VMWare Horizon Client
Function UninstallVMWareHorizon {
	winget uninstall -e --id VMware.HorizonClient
}

# Install AnyConnect VPN
Function InstallAnyConnectVPN {
	winget install -e --id 9WZDNCRDJ8LH --force --accept-package-agreements
}

# Uninstall AnyConnect VPN
Function UninstallAnyConnectVPN {
	winget uninstall -e --id 9WZDNCRDJ8LH
}

# Install OneNote
Function InstallOneNote {
	winget install -e --id XPFFZHVGQWWLHB --force --silent --accept-package-agreements --disable-interactivity
}

# Uninstall OneNote
Function UninstallOneNote {
	winget uninstall -e --id XPFFZHVGQWWLHB
}

# Install Python
Function InstallPython {
	winget install -e --id 9NCVDN91XZQP --force --accept-package-agreements
	winget install -e --id 9PJPW5LDXLZ5 --force --accept-package-agreements
}

# Install Git
Function InstallGit {
	winget install -e --id git.git --force --accept-package-agreements
}

# Install Microsoft Office
Function InstallMicrosoftOffice {
	winget install -e --id Microsoft.Office --force --accept-package-agreements
}

# Install Visual Studio Code
Function InstallVisualStudioCode {
	winget install -e --id XP9KHM4BK9FZ7Q --force --accept-package-agreements
}

# Uninstall Visual Studio Code
Function UninstallVisualStudioCode {
	winget uninstall -e --id XP9KHM4BK9FZ7Q
}

# Install VeraCrypt
Function InstallVeraCrypt {
    $SoftwareFile = "Veracrypt*.exe"
    # Get the path to the directory containing the script
    $softwareFolder = Join-Path -Path $PSScriptRoot -ChildPath "Software"
    # Combine the script directory with the relative path to the executable
    $exePath = Join-Path -Path $softwareFolder -ChildPath "$SoftwareFile"
    # Check if the executable exists
    if (Test-Path -Path $exePath -PathType Leaf) {
        # Start the process
        Start-Process -FilePath $exePath -ArgumentList "/S" -Wait
    } else {
        Write-Host "$SoftwareFile not found in the expected location."
    }
}

# Install Jottacloud
Function InstallJottacloud {
    $SoftwareFile = "Jottacloud*.exe"
    # Get the path to the directory containing the script
    $softwareFolder = Join-Path -Path $PSScriptRoot -ChildPath "Software"
    # Combine the script directory with the relative path to the executable
    $exePath = Join-Path -Path $softwareFolder -ChildPath "$SoftwareFile"
    # Check if the executable exists
    if (Test-Path -Path $exePath -PathType Leaf) {
        # Start the process
        Start-Process -FilePath $exePath -ArgumentList "/S" -Wait
    } else {
        Write-Host "$SoftwareFile not found in the expected location."
    }
}


# Disable Windows Sandbox
Function DisableWindowsSandbox {
	if (Get-WindowsEdition -Online | Where-Object -FilterScript {$_.Edition -eq "Professional" -or $_.Edition -like "Enterprise*"})
	{
		# Checking whether x86 virtualization is enabled in the firmware
		if ((Get-CimInstance -ClassName CIM_Processor).VirtualizationFirmwareEnabled -eq $true)
		{
			Disable-WindowsOptionalFeature -FeatureName Containers-DisposableClientVM -Online -NoRestart
		}
		else
		{
			try
			{
				# Determining whether Hyper-V is enabled
				if ((Get-CimInstance -ClassName CIM_ComputerSystem).HypervisorPresent -eq $true)
				{
					Disable-WindowsOptionalFeature -FeatureName Containers-DisposableClientVM -Online -NoRestart
				}
			}
			catch [System.Exception]
			{
				Write-Error -Message $Localization.EnableHardwareVT -ErrorAction SilentlyContinue
			}
		}
	}
}

# Enable Windows Sandbox
Function EnableWindowsSandbox {
	if (Get-WindowsEdition -Online | Where-Object -FilterScript {$_.Edition -eq "Professional" -or $_.Edition -like "Enterprise*"})
	{
		# Checking whether x86 virtualization is enabled in the firmware
		if ((Get-CimInstance -ClassName CIM_Processor).VirtualizationFirmwareEnabled -eq $true)
		{
			Enable-WindowsOptionalFeature -FeatureName Containers-DisposableClientVM -All -Online -NoRestart
		}
		else
		{
			try
			{
				# Determining whether Hyper-V is enabled
				if ((Get-CimInstance -ClassName CIM_ComputerSystem).HypervisorPresent -eq $true)
				{
					Enable-WindowsOptionalFeature -FeatureName Containers-DisposableClientVM -All -Online -NoRestart
				}
			}
			catch [System.Exception]
			{
				Write-Error -Message $Localization.EnableHardwareVT -ErrorAction SilentlyContinue
			}
		}
	}
}