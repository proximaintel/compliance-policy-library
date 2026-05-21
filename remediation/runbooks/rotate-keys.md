# Runbook: Rotate Key Vault Keys

## Issue
Key Vault keys have exceeded their rotation period.

## Impact
- PCI DSS Requirement 3 violation
- Increased risk from long-lived cryptographic material

## Steps

1. Identify keys past rotation date from Key Vault compliance report
2. Navigate to Key Vault → **Keys**
3. Select the key → **Rotation policy**
4. Configure auto-rotation (recommended: 90 days for data keys, 365 for master keys)
5. Manually rotate the current key version
6. Verify dependent services still function with new key version

## Warning
Key rotation may require application restarts or cache invalidation. Coordinate with application teams.
