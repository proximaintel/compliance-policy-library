# Runbook: Enable Storage Account Encryption

## Issue
Storage account does not have infrastructure encryption enabled.

## Impact
- HIPAA §164.312(a)(2)(iv) violation
- Data at rest not double-encrypted

## Steps

1. Identify the non-compliant storage account from the policy compliance report
2. Navigate to the storage account in Azure Portal
3. Go to **Encryption** settings
4. Enable **Infrastructure encryption**
5. Verify the change in Defender for Cloud compliance dashboard

## Automated Remediation
See [remediate-storage-encryption.ps1](../automation/remediate-storage-encryption.ps1)

## Note
Infrastructure encryption cannot be enabled on existing storage accounts — a new account must be created and data migrated. Plan accordingly.
