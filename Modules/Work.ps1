##### Configure Work

# Configure Work
Function ConfigureWork {
try {
    Clear-host
    Write-host "Installing AzureAD"
    Install-Module AzureADPreview -AllowClobber -Force -Scope CurrentUser -Repository PSGallery
    Write-host "Installing ExchangeOnline"
    Install-Module ExchangeOnlineManagement -AllowClobber -Force -Scope CurrentUser
    Write-host "Installing MSOnline"
    Install-Module MSOnline -AllowClobber -Force -Scope CurrentUser
} catch {
    Write-host "Failed Install"
}

try {
    Clear-host
    Write-host "Importing AzureAD"
    Import-Module AzureAdPreview -Force -Verbose
    Write-host "Importing ExchangeOnline"
    Import-Module ExchangeOnlineManagement -Force -Verbose
    Write-host "Importing MSOnline"
    Import-Module MSOnline -Force -Verbose
} catch {
    Write-host "Failed Import"
}
}