# Install Winget
Function DriveMapping {
	# Check if winget is installed
	try {
    # Define the path to the batch file
        $batchFilePath = Join-Path -Path $PSScriptRoot -ChildPath "DriveMapping\DriveAdd.bat"
        Start-Process -FilePath $batchFilePath -Wait
	}
    catch {
        Write-Host "Failed" -ForegroundColor Red
    }
}
