# Remediate Storage Accounts Without Infrastructure Encryption
# Note: Infrastructure encryption cannot be added to existing accounts.
# This script identifies non-compliant accounts for migration planning.

param(
    [Parameter(Mandatory=$true)]
    [string]$SubscriptionId
)

Set-AzContext -SubscriptionId $SubscriptionId

$storageAccounts = Get-AzStorageAccount | Where-Object {
    $_.Encryption.RequireInfrastructureEncryption -ne $true
}

if ($storageAccounts.Count -eq 0) {
    Write-Host "All storage accounts are compliant." -ForegroundColor Green
    return
}

Write-Host "Non-compliant storage accounts:" -ForegroundColor Yellow
$storageAccounts | ForEach-Object {
    Write-Host "  - $($_.StorageAccountName) (RG: $($_.ResourceGroupName))" -ForegroundColor Red
}

Write-Host "`nAction required: Create new storage accounts with infrastructure encryption and migrate data."
