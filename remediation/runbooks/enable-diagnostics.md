# Runbook: Enable Diagnostic Settings

## Issue
Resource does not have diagnostic settings configured to send logs to Log Analytics.

## Impact
- HIPAA §164.312(b) violation
- No audit trail for resource access
- Blind spot in security monitoring

## Steps

1. Identify non-compliant resources from policy compliance report
2. For each resource, navigate to **Diagnostic settings**
3. Click **Add diagnostic setting**
4. Select all log categories
5. Select the centralized Log Analytics workspace as destination
6. Save

## Bulk Remediation
Use Azure Policy remediation task with DeployIfNotExists effect to auto-deploy diagnostic settings across all resources.

## Verification
Check Log Analytics workspace for incoming logs from the resource within 5-10 minutes.
