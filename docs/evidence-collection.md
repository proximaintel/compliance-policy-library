# Automated Evidence Collection

## Policy Compliance Export

```bash
# Export compliance state for all resources
az policy state list \
  --management-group "YOUR_MG_ID" \
  --filter "complianceState eq 'NonCompliant'" \
  --output json > evidence/non-compliant-resources.json

# Summary by policy
az policy state summarize \
  --management-group "YOUR_MG_ID" \
  --output json > evidence/compliance-summary.json
```

## Defender for Cloud Export

```bash
# Secure Score
az security secure-score list --output json > evidence/secure-score.json

# Regulatory compliance
az security regulatory-compliance-standards list --output json > evidence/regulatory-compliance.json
```

## Scheduled Evidence Collection

Configure an Azure Automation runbook or GitHub Action to export compliance evidence weekly:

1. Export policy compliance state
2. Export Secure Score
3. Export Sentinel incident summary
4. Store in a tamper-proof storage account (immutable blob storage)
5. Retain for audit period (typically 12 months)

## Compliance Dashboard

Deploy the [compliance-posture workbook](../sentinel/workbooks/compliance-posture.json) for real-time visibility. Share with auditors as read-only during the audit period.
