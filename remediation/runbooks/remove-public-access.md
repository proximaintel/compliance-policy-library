# Runbook: Remove Public Blob Access

## Issue
Storage account allows public blob/container access.

## Impact
- HIPAA §164.312(e)(1) violation
- PCI DSS Requirement 1 violation
- Data exposed to internet without authentication

## Steps

1. Identify the non-compliant storage account
2. Navigate to **Configuration** in Azure Portal
3. Set **Allow Blob public access** to **Disabled**
4. Review all containers — ensure no applications depend on anonymous access
5. Update applications to use SAS tokens or managed identity
6. Verify in Defender for Cloud

## Automated Remediation
See [remediate-public-access.ps1](../automation/remediate-public-access.ps1)

## Warning
Disabling public access will break any application using anonymous blob URLs. Verify dependencies before applying.
