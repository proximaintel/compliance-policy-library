# Remediate Storage Accounts With Public Blob Access
# WARNING: This will break anonymous access. Verify dependencies first.

param(
    [Parameter(Mandatory=$true)]
    [string]$SubscriptionId,
    [switch]$WhatIf
)

Set-AzContext -SubscriptionId $SubscriptionId

$storageAccounts = Get-AzStorageAccount | Where-Object {
    $_.AllowBlobPublicAccess -eq $true
}

if ($storageAccounts.Count -eq 0) {
    Write-Host "All storage accounts already deny public access." -ForegroundColor Green
    return
}

foreach ($sa in $storageAccounts) {
    if ($WhatIf) {
        Write-Host "[WhatIf] Would disable public access on: $($sa.StorageAccountName)" -ForegroundColor Yellow
    } else {
        Set-AzStorageAccount -ResourceGroupName $sa.ResourceGroupName -Name $sa.StorageAccountName -AllowBlobPublicAccess $false
        Write-Host "Disabled public access on: $($sa.StorageAccountName)" -ForegroundColor Green
    }
}
