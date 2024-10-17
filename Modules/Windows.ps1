# Windows File Manager - Config

# To use the Elevate function with AddHomeGallery
Function AddGallery {
New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Desktop\NameSpace_41040327\{e88865ea-0e1c-4e20-9aa6-edcd0212c87c}" -Force -ErrorAction SilentlyContinue
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Desktop\NameSpace_41040327\{e88865ea-0e1c-4e20-9aa6-edcd0212c87c}" -Name "(Default)" -Value "{e88865ea-0e1c-4e20-9aa6-edcd0212c87c}" -Force -ErrorAction SilentlyContinue
}


Function RemoveGallery {
Remove-Item "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Desktop\NameSpace_41040327\{e88865ea-0e1c-4e20-9aa6-edcd0212c87c}" -Force -ErrorAction SilentlyContinue
}


Function AddHome {
Write-Output "Adding Home"
New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Desktop\NameSpace_36354489\{f874310e-b6b7-47dc-bc84-b9e6b38f5903}" -Force -ErrorAction SilentlyContinue
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Desktop\NameSpace_41040327\{e88865ea-0e1c-4e20-9aa6-edcd0212c87c}" -Name "(Default)" -Value "CLSID_MSGraphHomeFolder" -Force -ErrorAction SilentlyContinue
}


Function RemoveHome {
Remove-Item "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Desktop\NameSpace_36354489\{f874310e-b6b7-47dc-bc84-b9e6b38f5903}" -Force -ErrorAction SilentlyContinue
}

# Enable/Disable Recently Folders in Filemanager
Function DisableRecentFolders {
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "Start_TrackDocs" -Value 0 -Force -ErrorAction SilentlyContinue
}

Function EnableRecentFolders {
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "Start_TrackDocs" -Value 1 -Force -ErrorAction SilentlyContinue
}

Function LaunchToThisPC {
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "LaunchTo" -Value 1 -Force -ErrorAction SilentlyContinue
}

Function LaunchToHome {
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "LaunchTo" -Value 0 -Force -ErrorAction SilentlyContinue
}

Function StartLayout {
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "Start_Layout" -Value 1 -Force -ErrorAction SilentlyContinue
}

Function DisableShowRecent {
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer" -Name "ShowRecent" -Value 0 -Force -ErrorAction SilentlyContinue
}

Function DisableShowFrequent {
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer" -Name "ShowFrequent" -Value 0 -Force -ErrorAction SilentlyContinue
}

Function DisableShowRecommendations {
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer" -Name "ShowRecommendations" -Value 0 -Force -ErrorAction SilentlyContinue
}

# Expand the Windows 10 File Explorer ribbon
Function ExpandedWindows10FileExplorerRibbon {
	if (Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" -Name "{e2bf9676-5f8f-435c-97eb-11607a5bedf7}" -ErrorAction Ignore)
	{
		if (-not (Test-Path -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Ribbon))
		{
		New-Item -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Ribbon -Force
		}
		New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Ribbon -Name MinimizedStateTabletModeOff -PropertyType DWord -Value 0 -Force
	}
}

# Minimize the Windows 10 File Explorer ribbon
Function MinimizedWindows10FileExplorerRibbon {
	if (Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" -Name "{e2bf9676-5f8f-435c-97eb-11607a5bedf7}" -ErrorAction Ignore)
	{
		if (-not (Test-Path -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Ribbon))
		{
			New-Item -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Ribbon -Force
		}
		New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Ribbon -Name MinimizedStateTabletModeOff -PropertyType DWord -Value 1 -Force
	}
}

# Set the taskbar alignment to the left
Function LeftTaskbarAlignment {
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name TaskbarAl -Value 0 -Force
}

# Set the taskbar alignment to the center
Function CenterTaskbarAlignment {
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name TaskbarAl -Value 1 -Force -ErrorAction SilentlyContinue
}

# Hide the search icon on the taskbar
Function HideTaskbarSearch {
	New-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Search -Name SearchboxTaskbarMode -PropertyType DWord -Value 0 -Force
}

# Show the search icon on the taskbar
Function ShowTaskbarSearch {
	New-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Search -Name SearchboxTaskbarMode -PropertyType DWord -Value 2 -Force
}

# Hide recently used files in Quick access
Function HideQuickAccessRecentFiles {
	New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer -Name ShowRecent -PropertyType DWord -Value 0 -Force
}

# Show recently used files in Quick access
Function ShowQuickAccessRecentFiles {
	New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer -Name ShowRecent -PropertyType DWord -Value 1 -Force
}

# Hide Copilot button on the taskbar
Function HideCopilotButton {
	New-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name ShowCopilotButton -PropertyType DWord -Value 0 -Force
}

# Show Copilot button on the taskbar
Function ShowCopilotButton {
	New-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name ShowCopilotButton -PropertyType DWord -Value 1 -Force
}

# Hide the Task view button on the taskbar
Function HideTaskViewButton {
	New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name ShowTaskViewButton -PropertyType DWord -Value 0 -Force
}

# Show the Task View button on the taskbar
Function ShowTaskViewButton {
	New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name ShowTaskViewButton -PropertyType DWord -Value 1 -Force
}

# Hide the widgets icon on the taskbar
Function HideTaskbarWidgets {
	if (Get-AppxPackage -Name MicrosoftWindows.Client.WebExperience)
	{
		New-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name TaskbarDa -PropertyType DWord -Value 0 -Force
	}
}

# Show the widgets icon on the taskbar
Function ShowTaskbarWidgets {
	if (Get-AppxPackage -Name MicrosoftWindows.Client.WebExperience)
	{
		New-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name TaskbarDa -PropertyType DWord -Value 1 -Force
	}
}

# Notify me when a restart is required to finish updating
Function ShowRestartNotification {
	New-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings -Name RestartNotificationsAllowed2 -PropertyType DWord -Value 1 -Force
}

# Do not notify me when a restart is required to finish updating
Function HideRestartNotification {
	New-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings -Name RestartNotificationsAllowed2 -PropertyType DWord -Value 0 -Force
}

# Do not add the "- Shortcut" suffix to the file name of created shortcuts
Function DisableShortcutsSuffix {
	if (-not (Test-Path -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\NamingTemplates))
	{
		New-Item -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\NamingTemplates -Force
	}
	New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\NamingTemplates -Name ShortcutNameTemplate -PropertyType String -Value "%s.lnk" -Force
}

# Add the "- Shortcut" suffix to the file name of created shortcuts
Function EnableShortcutsSuffix {
	Remove-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\NamingTemplates -Name ShortcutNameTemplate -Force -ErrorAction Ignore
}

# Do not use a different input method for each app window
Function DisableAppsLanguageSwitch {
	Set-WinLanguageBarOption
}

# Let me use a different input method for each app window
Function EnableAppsLanguageSwitch {
	Set-WinLanguageBarOption -UseLegacySwitchMode
}

# When I grab a windows's title bar and shake it, don't minimize all other windows
Function DisableAeroShaking {
	New-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name DisallowShaking -PropertyType DWord -Value 1 -Force
}

# When I grab a windows's title bar and shake it, minimize all other windows
Function EnableAeroShaking {
	New-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name DisallowShaking -PropertyType DWord -Value 0 -Force
}

# Disable hibernation
Function DisableHibernation {
	POWERCFG /HIBERNATE OFF
}

# Enable hibernation
Function EnableHibernation {
	POWERCFG /HIBERNATE ON
}

# Disable the Windows 260 character path limit
Function DisableWin32LongPathLimit {
	New-ItemProperty -Path HKLM:\SYSTEM\CurrentControlSet\Control\FileSystem -Name LongPathsEnabled -PropertyType DWord -Value 1 -Force
}

# Enable the Windows 260 character path limit
Function EnableWin32LongPathLimit {
	New-ItemProperty -Path HKLM:\SYSTEM\CurrentControlSet\Control\FileSystem -Name LongPathsEnabled -PropertyType DWord -Value 0 -Force
}

# Restart as soon as possible to finish updating
Function EnableRestartDeviceAfterUpdate {
	New-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings -Name IsExpedited -PropertyType DWord -Value 1 -Force
}

# Don't restart as soon as possible to finish updating
Function DisableRestartDeviceAfterUpdate {
	New-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings -Name IsExpedited -PropertyType DWord -Value 0 -Force
}

# Set power plan on "High performance"
Function HighPowerPlan {
	POWERCFG /SETACTIVE SCHEME_MIN
}

# Set power plan on "Balanced"
Function BalancedPowerPlan {
	POWERCFG /SETACTIVE SCHEME_BALANCED
}

# Override for default input method: Norwegian
Function NorwegianInputMethod {
	Set-WinDefaultInputMethodOverride -InputTip "0809:00000414"
}

# Override for default input method: use language list
Function DefaultInputMethod {
	Remove-ItemProperty -Path "HKCU:\Control Panel\International\User Profile" -Name InputMethodOverride -Force -ErrorAction Ignore
}

# Save screenshots by pressing Win+PrtScr on the Desktop
Function DesktopWinPrtScrFolder {
	$DesktopFolder = Get-ItemPropertyValue -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" -Name Desktop
	New-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" -Name "{B7BEDE81-DF94-4682-A7D8-57A52620B86F}" -Type ExpandString -Value $DesktopFolder -Force
}

# Save screenshots by pressing Win+PrtScr in the Pictures folder
Function DefaultWinPrtScrFolder {
	Remove-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" -Name "{B7BEDE81-DF94-4682-A7D8-57A52620B86F}" -Force -ErrorAction Ignore
}

# Launch folder windows in a separate process
Function EnableFoldersLaunchSeparateProcess {
	New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name SeparateProcess -PropertyType DWord -Value 1 -Force
}

# Do not launch folder windows in a separate process
Function DisableFoldersLaunchSeparateProcess {
	New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name SeparateProcess -PropertyType DWord -Value 0 -Force
}

# Hide recently added apps in the Start menu
Function HideRecentlyAddedApps {
	if (-not (Test-Path -Path HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer))
	{
		New-Item -Path HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer -Force
	}
	New-ItemProperty -Path HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer -Name HideRecentlyAddedApps -PropertyType DWord -Value 1 -Force
}

# Show recently added apps in the Start menu
Function ShowRecentlyAddedApps {
	Remove-ItemProperty -Path HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer -Name HideRecentlyAddedApps -Force -ErrorAction Ignore
}

# Disable Cortana autostarting
Function DisableCortanaAutostart {
	if (Get-AppxPackage -Name Microsoft.549981C3F5F10)
	{
		if (-not (Test-Path -Path "Registry::HKEY_CLASSES_ROOT\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppModel\SystemAppData\Microsoft.549981C3F5F10_8wekyb3d8bbwe\CortanaStartupId"))
		{
			New-Item -Path "Registry::HKEY_CLASSES_ROOT\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppModel\SystemAppData\Microsoft.549981C3F5F10_8wekyb3d8bbwe\CortanaStartupId" -Force
		}
		New-ItemProperty -Path "Registry::HKEY_CLASSES_ROOT\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppModel\SystemAppData\Microsoft.549981C3F5F10_8wekyb3d8bbwe\CortanaStartupId" -Name State -PropertyType DWord -Value 1 -Force
	}
}

# Enable Cortana autostarting
Function EnableCortanaAutostart {
	if (Get-AppxPackage -Name Microsoft.549981C3F5F10)
	{
		if (-not (Test-Path -Path "Registry::HKEY_CLASSES_ROOT\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppModel\SystemAppData\Microsoft.549981C3F5F10_8wekyb3d8bbwe\CortanaStartupId"))
		{
			New-Item -Path "Registry::HKEY_CLASSES_ROOT\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppModel\SystemAppData\Microsoft.549981C3F5F10_8wekyb3d8bbwe\CortanaStartupId" -Force
		}
		New-ItemProperty -Path "Registry::HKEY_CLASSES_ROOT\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppModel\SystemAppData\Microsoft.549981C3F5F10_8wekyb3d8bbwe\CortanaStartupId" -Name State -PropertyType DWord -Value 2 -Force
	}
}

# Disable Teams autostarting
Function DisableTeamsAutostart {
	if (Get-AppxPackage -Name MicrosoftTeams)
	{
		if (-not (Test-Path -Path "HKCU:\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppModel\SystemAppData\MicrosoftTeams_8wekyb3d8bbwe\TeamsStartupTask"))
		{
			New-Item -Path "HKCU:\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppModel\SystemAppData\MicrosoftTeams_8wekyb3d8bbwe\TeamsStartupTask" -Force
		}
		New-ItemProperty -Path "HKCU:\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppModel\SystemAppData\MicrosoftTeams_8wekyb3d8bbwe\TeamsStartupTask" -Name State -PropertyType DWord -Value 1 -Force
	}
}

# Enable Teams autostarting
Function EnableTeamsAutostart {
	if (Get-AppxPackage -Name MicrosoftTeams)
	{
		if (-not (Test-Path -Path "HKCU:\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppModel\SystemAppData\MicrosoftTeams_8wekyb3d8bbwe\TeamsStartupTask"))
		{
			New-Item -Path "HKCU:\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppModel\SystemAppData\MicrosoftTeams_8wekyb3d8bbwe\TeamsStartupTask" -Force
		}
		New-ItemProperty -Path "HKCU:\Software\Classes\Local 	Settings\Software\Microsoft\Windows\CurrentVersion\AppModel\SystemAppData\MicrosoftTeams_8wekyb3d8bbwe\TeamsStartupTask" -Name State -PropertyType DWord -Value 2 -Force
	}
}

# Disable the Windows 10 context menu style
Function DisableWindows10ContextMenu {
	Remove-Item -Path "HKCU:\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}" -Recurse -Force -ErrorAction Ignore
}

# Enable the Windows 10 context menu style
Function EnableWindows10ContextMenu {
	if (-not (Test-Path -Path "HKCU:\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32"))
	{
		New-Item -Path "HKCU:\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" -ItemType Directory -Force
	}
	New-ItemProperty -Path "HKCU:\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" -Name "(default)" -PropertyType String -Value "" -Force
}

# Do not show sync provider notification within File Explorer
Function HideOneDriveFileExplorerAd {
	New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name ShowSyncProviderNotifications -PropertyType DWord -Value 0 -Force
}

# Show sync provider notification within File Explorer
Function ShowOneDriveFileExplorerAd {
	New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name ShowSyncProviderNotifications -PropertyType DWord -Value 1 -Force
}

# Show the "This PC" icon on Desktop
Function ShowThisPC {
	if (-not (Test-Path -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel))
	{
		New-Item -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel -Force
	}
	New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel -Name "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" -PropertyType DWord -Value 0 -Force
}

# Hide the "This PC" icon on Desktop
Function HideThisPC {
	Remove-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel -Name "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" -Force -ErrorAction Ignore
}

# Do not show websites from your browsing history in the Start menu
Function HideBrowsingHistory {
	if ((Get-CimInstance -ClassName CIM_OperatingSystem).BuildNumber -lt 23451)
	{
		return
	}
	New-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name Start_RecoPersonalizedSites -PropertyType DWord -Value 0 -Force
}

# Show websites from your browsing history in the Start menu
Function ShowBrowsingHistory {
	if ((Get-CimInstance -ClassName CIM_OperatingSystem).BuildNumber -lt 23451)
	{
		return
	}
	Remove-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name Start_RecoPersonalizedSites -Force -ErrorAction Ignore
}

# Disable Bing search in the Start Menu
Function DisableBingSearch {
	if (-not (Test-Path -Path HKCU:\SOFTWARE\Policies\Microsoft\Windows\Explorer))
	{
		New-Item -Path HKCU:\SOFTWARE\Policies\Microsoft\Windows\Explorer -Force
	}
	New-ItemProperty -Path HKCU:\SOFTWARE\Policies\Microsoft\Windows\Explorer -Name DisableSearchBoxSuggestions -PropertyType DWord -Value 1 -Force		
}

# Enable Bing search in the Start Menu
Function EnableBingSearch {
	Remove-ItemProperty -Path HKCU:\SOFTWARE\Policies\Microsoft\Windows\Explorer -Name DisableSearchBoxSuggestions -Force -ErrorAction Ignore	
}

# Enable Num Lock at startup
Function EnableNumLock {
	New-ItemProperty -Path "Registry::HKEY_USERS\.DEFAULT\Control Panel\Keyboard" -Name InitialKeyboardIndicators -PropertyType String -Value 2147483650 -Force
}

# Disable Num Lock at startup
Function DisableNumLock {
	New-ItemProperty -Path "Registry::HKEY_USERS\.DEFAULT\Control Panel\Keyboard" -Name InitialKeyboardIndicators -PropertyType String -Value 2147483648 -Force
}

# Uninstall Mail and Calendar
Function UninstallMailCalendar {
	winget uninstall "Mail and Calendar"	
}

# Install Mail and Calendar
Function InstallMailCalendar {
	winget install "Mail and Calendar" --source msstore --accept-package-agreements --accept-source-agreements
}

# Turn off pressing the Shift key 5 times to turn Sticky keys
Function DisableStickyShift {
	New-ItemProperty -Path "HKCU:\Control Panel\Accessibility\StickyKeys" -Name Flags -PropertyType String -Value 506 -Force
}

# Turn on pressing the Shift key 5 times to turn Sticky keys
Function EnableStickyShift {
	New-ItemProperty -Path "HKCU:\Control Panel\Accessibility\StickyKeys" -Name Flags -PropertyType String -Value 510 -Force
}

# Uninstall Microsoft News
Function UninstallMicrosoftNews {
	winget uninstall "Microsoft News"
}

# Uninstall Cortana
Function UninstallCortana {
	winget uninstall "Cortana"
}

# Set Norway as Country
Function SetNorway {
    Set-ItemProperty -Path "HKCU:\Control Panel\International" -Name Locale -Value "00000414" -Force
    Set-ItemProperty -Path "HKCU:\Control Panel\International" -Name LocaleName -Value "nb-NO" -Force
    Set-ItemProperty -Path "HKCU:\Control Panel\International" -Name s1159 -Value "a.m." -Force
    Set-ItemProperty -Path "HKCU:\Control Panel\International" -Name s2359 -Value "p.m." -Force
    Set-ItemProperty -Path "HKCU:\Control Panel\International" -Name sCurrency -Value "kr" -Force
    Set-ItemProperty -Path "HKCU:\Control Panel\International" -Name sDate -Value "." -Force
    Set-ItemProperty -Path "HKCU:\Control Panel\International" -Name sDecimal -Value "," -Force
    Set-ItemProperty -Path "HKCU:\Control Panel\International" -Name sGrouping -Value "3;0" -Force
    Set-ItemProperty -Path "HKCU:\Control Panel\International" -Name sLanguage -Value "NOR" -Force
    Set-ItemProperty -Path "HKCU:\Control Panel\International" -Name sList -Value ";" -Force
    Set-ItemProperty -Path "HKCU:\Control Panel\International" -Name sLongDate -Value "dddd d. MMMM yyyy" -Force
    Set-ItemProperty -Path "HKCU:\Control Panel\International" -Name sMonDecimalSep -Value "," -Force
    Set-ItemProperty -Path "HKCU:\Control Panel\International" -Name sMonGrouping -Value "3;0" -Force
    Set-ItemProperty -Path "HKCU:\Control Panel\International" -Name sMonThousandSep -Value " " -Force
    Set-ItemProperty -Path "HKCU:\Control Panel\International" -Name sNativeDigits -Value "0123456789" -Force
    Set-ItemProperty -Path "HKCU:\Control Panel\International" -Name sNegativeSign -Value "-" -Force
    Set-ItemProperty -Path "HKCU:\Control Panel\International" -Name sPositiveSign -Value "" -Force
    Set-ItemProperty -Path "HKCU:\Control Panel\International" -Name sShortDate -Value "dd.MM.yyyy" -Force
    Set-ItemProperty -Path "HKCU:\Control Panel\International" -Name sThousand -Value " " -Force
    Set-ItemProperty -Path "HKCU:\Control Panel\International" -Name sTime -Value ":" -Force
    Set-ItemProperty -Path "HKCU:\Control Panel\International" -Name sTimeFormat -Value "HH:mm:ss" -Force
    Set-ItemProperty -Path "HKCU:\Control Panel\International" -Name sShortTime -Value "HH:mm" -Force
    Set-ItemProperty -Path "HKCU:\Control Panel\International" -Name sYearMonth -Value "MMMM yyyy" -Force
    Set-ItemProperty -Path "HKCU:\Control Panel\International" -Name iCalendarType -Value 1 -Force
    Set-ItemProperty -Path "HKCU:\Control Panel\International" -Name iCountry -Value 47 -Force
    Set-ItemProperty -Path "HKCU:\Control Panel\International" -Name iCurrDigits -Value 2 -Force
    Set-ItemProperty -Path "HKCU:\Control Panel\International" -Name iCurrency -Value 2 -Force
    Set-ItemProperty -Path "HKCU:\Control Panel\International" -Name iDate -Value 1 -Force
    Set-ItemProperty -Path "HKCU:\Control Panel\International" -Name iDigits -Value 2 -Force
    Set-ItemProperty -Path "HKCU:\Control Panel\International" -Name NumShape -Value 1 -Force
    Set-ItemProperty -Path "HKCU:\Control Panel\International" -Name iFirstDayOfWeek -Value 0 -Force
    Set-ItemProperty -Path "HKCU:\Control Panel\International" -Name iFirstWeekOfYear -Value 2 -Force
    Set-ItemProperty -Path "HKCU:\Control Panel\International" -Name iLZero -Value 1 -Force
    Set-ItemProperty -Path "HKCU:\Control Panel\International" -Name iMeasure -Value 0 -Force
    Set-ItemProperty -Path "HKCU:\Control Panel\International" -Name iNegCurr -Value 9 -Force
    Set-ItemProperty -Path "HKCU:\Control Panel\International" -Name iNegNumber -Value 1 -Force
    Set-ItemProperty -Path "HKCU:\Control Panel\International" -Name iPaperSize -Value 9 -Force
    Set-ItemProperty -Path "HKCU:\Control Panel\International" -Name iTime -Value 1 -Force
    Set-ItemProperty -Path "HKCU:\Control Panel\International" -Name iTimePrefix -Value 0 -Force
    Set-ItemProperty -Path "HKCU:\Control Panel\International" -Name iTLZero -Value 1 -Force
    Set-ItemProperty -Path "HKCU:\Control Panel\International\Geo" -Name Name -Value NO -Force
    Set-ItemProperty -Path "HKCU:\Control Panel\International\Geo" -Name Nation -Value 177 -Force
}