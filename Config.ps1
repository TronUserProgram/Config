########################################################################################################################
# Import all PowerShell's
########################################################################################################################
# Get the path to the modules folder
$modulesFolder = Join-Path -Path $PSScriptRoot -ChildPath "modules"

# Check if the modules folder exists
if (Test-Path $modulesFolder -PathType Container) {
    # Get all PowerShell files inside the modules folder and its subfolders
    $powerShellFiles = Get-ChildItem -Path $modulesFolder -Recurse -Include "*.ps1" | Where-Object {!$_.PSIsContainer}

    # Loop through each PowerShell file and run it
    foreach ($file in $powerShellFiles) {
        Write-Host "Running $($file.FullName)"
        
        # Load the content of the current PowerShell file into the current session
        . $file.FullName

    }
    Write-Host "Modules Loaded " -ForegroundColor White -NoNewline
    Write-Host "Success" -ForegroundColor Green
    Write-Host "" -ForegroundColor Green
} else {
    Write-Host "Modules folder not found."
}
########################################################################################################################




########################################################################################################################
####### RUN CONFIG
########################################################################################################################
$RunDefault = {

# Maps Network Drives
    DriveMapping


}

$RunElevated = {

##########################################################
########################### UI ###########################
##########################################################

# Creates a RestorePoint before Changes are Done
    #CreateRestorePoint

# Show/Hide sync provider notification within File Explorer
    HideOneDriveFileExplorerAd
    #ShowOneDriveFileExplorerAd

# Show the "This PC" icon on Desktop
    ShowThisPC
    #HideThisPC

# Do not show websites from your browsing history in the Start menu
    HideBrowsingHistory
    #ShowBrowsingHistory

# Disable Bing search in the Start Menu
    DisableBingSearch
    #EnableBingSearch

# Enable Num Lock at startup
    EnableNumLock
    #DisableNumLock

# Uninstall/Install Mail and Calendar
    UninstallMailCalendar
    #InstallMailCalendar

# Turn off/on pressing the Shift key 5 times to turn Sticky keys
    DisableStickyShift
    #EnableStickyShift

# Uninstall Microsoft News
    UninstallMicrosoftNews

# Uninstall Cortana
    #UninstallCortana

# Changes Windows UI
    #ExpandedWindows10FileExplorerRibbon
    MinimizedWindows10FileExplorerRibbon

# Show/Hide Taskbar Search
    ShowTaskbarSearch
    #HideTaskbarSearch

# Show/Hide Quick Access Recent Files
    #ShowQuickAccessRecentFiles
    HideQuickAccessRecentFiles

# Show/Hide Copilot Button
    #ShowCopilotButton
    #HideCopilotButton

# Show/Hide Taskview Button
    #ShowTaskViewButton
    #HideTaskViewButton

# Show/Hide Taskbar Widgets
    #ShowTaskbarWidgets
    #HideTaskbarWidgets

# Notify me when a restart is required to finish updating
    #ShowRestartNotification
    #HideRestartNotification

# Do not add the "- Shortcut" suffix to the file name of created shortcuts
    DisableShortcutsSuffix
    #EnableShortcutsSuffix

# Do not use a different input method for each app window
    #DisableAppsLanguageSwitch
    #EnableAppsLanguageSwitch

# When I grab a windows's title bar and shake it, don't minimize all other windows
    #DisableAeroShaking
    #EnableAeroShaking

# Disable/Enable hibernation
    #DisableHibernation
    #EnableHibernation

# Disable/Enable the Windows 260 character path limit
    #DisableWin32LongPathLimit
    #EnableWin32LongPathLimit

# Restart as soon as possible to finish updating
    #EnableRestartDeviceAfterUpdate
    #DisableRestartDeviceAfterUpdate

# Set power plan on * performance"
    #HighPowerPlan
    #BalancedPowerPlan

# Override for default input method: Norwegian
    NorwegianInputMethod

# Override for default input method: use language list
    #DefaultInputMethod

# Save screenshots by pressing Win+PrtScr on the Desktop or Default in Pictures
    #DesktopWinPrtScrFolder
    #DefaultWinPrtScrFolder

# Launch folder windows in a separate process
    #EnableFoldersLaunchSeparateProcess
    #DisableFoldersLaunchSeparateProcess

# Hide recently added apps in the Start menu
    HideRecentlyAddedApps
    #ShowRecentlyAddedApps

# Disable/Enable Cortana autostarting
    #DisableCortanaAutostart
    #EnableCortanaAutostart

# Disable/Enable Teams autostarting
    #DisableTeamsAutostart
    #EnableTeamsAutostart

# Disable/Enable Windows Sandbox
    #DisableWindowsSandbox
    #EnableWindowsSandbox

# Changes Icons to Show Less Recommendations
    StartLayout

# Taskbar Alignment
    LeftTaskbarAlignment
	#CenterTaskbarAlignment

# Disables to Show Recent Files
    DisableShowRecent

# Disables to Show Frequent Used Folders
    DisableShowFrequent

# Disables to Show Recommendations Used Folders
    DisableShowRecommendations

# Enable/Disable Recently Folders in Filemanager
    DisableRecentFolders
    #EnableRecentFolders

# Add or Remove Gallery in File Explorer
    #AddGallery
    RemoveGallery

# Add or Remove Home in File Explorer
    #AddHome
    RemoveHome

# Disable/Enable the Windows 10 context menu style (Mouse Rightclick Options)
    #DisableWindows10ContextMenu
    EnableWindows10ContextMenu

# Launch File Explorer to This PC
    LaunchToThisPC
    #LaunchToHome

# Set Location Config for Norway
    SetNorway

##########################################################
###################### APPLICATIONS ######################
##########################################################

# Configure PowerShell for Work
    ConfigureWork

# Install WinGet
    InstallWinGet

# VLC
    #InstallVLC
    #UninstallVLC

# Steam
    #InstallSteam
    #UninstallSteam

# Discord
    #InstallDiscord
    #UninstallDiscord

# Outlook
    #InstallOutlook
    #UninstallOutlook

# OneNote
    InstallOneNote
    #UninstallOneNote

# Chrome
    InstallChrome
    #UninstallChrome

# Nvidia Experience
    #InstallNvidiaExperience 
    #UninstallNvidiaExperience

# OpenOffice
    #InstallOpenOffice
    #UninstallOpenOffice

# Citrix Workspace App
    InstallCitrixWorkspaceApp
    #UninstallCitrixWorkspaceApp

# StreamDeck
#    InstallStreamDeck
    #UninstallStreamDeck

# Teamviewer
    InstallTeamviewer
    #UninstallTeamviewer

# VMWare Horizon Client
    #InstallVMWareHorizon
    #UninstallVMWareHorizon

# AnyConnect VPN
    #InstallAnyConnectVPN
    #UninstallAnyConnectVPN

# Install Jottacloud
    #InstallJottacloud

# Install VeraCrypt
    #InstallVeraCrypt

# Install Python
    #InstallPython

# Install Git
    #InstallGit

# Visual Studio Code
    InstallVisualStudioCode
    #UninstallVisualStudioCode

}

########################################################################################################################
####### Execute Config
########################################################################################################################

Function Elevate {
    Param (
        [Parameter(Mandatory=$true)]
        [ScriptBlock]$ScriptBlock
    )

    # Check if the script is already running as Administrator
    If (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]"Administrator")) {
        # If not, restart the script with elevated privileges
        Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -Command $PSCommandPath" -Verb RunAs
        exit
    }

    # If running as Administrator, execute the provided script block
    $taskNames = $ScriptBlock -replace '#.*', '' -split '\r?\n' | Where-Object { $_ -match '\S' } | ForEach-Object { $_.Trim() }
    foreach ($taskName in $taskNames) {
        Write-Host "$taskName " -NoNewline
        Write-Host "OK" -ForegroundColor Green

        # Execute the current task
        Invoke-Expression $taskName
    }
}


Function Default {
    Param (
        [Parameter(Mandatory=$true)]
        [ScriptBlock]$ScriptBlock
    )

    # If running as Administrator, execute the provided script block
    $taskNames = $ScriptBlock -replace '#.*', '' -split '\r?\n' | Where-Object { $_ -match '\S' } | ForEach-Object { $_.Trim() }
    foreach ($taskName in $taskNames) {
        Write-Host "$taskName " -NoNewline
        Write-Host "OK" -ForegroundColor Green

        # Execute the current task
        Invoke-Expression $taskName
    }
}

# Create Restore Point
Function CreateRestorePoint {
  Write-Output "Creating Restore Point incase something bad happens"
  Enable-ComputerRestore -Drive "C:\"
  Checkpoint-Computer -Description "RestorePoint1" -RestorePointType "MODIFY_SETTINGS"
}


###### Trigger Run

If (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]"Administrator")) {
    # Checks if the Script is Elevated, And skips the below code, This is so it does not run certain things on another account
    Default -ScriptBlock $RunDefault
    } else {
    }

try {
Elevate -ScriptBlock $RunElevated
} catch {
Write-host "Elevated Cancelled or Failed" -ForegroundColor Red
}

Read-Host -Prompt "Press Enter to exit"