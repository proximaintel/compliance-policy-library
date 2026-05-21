# Deployment Guide

## Prerequisites

- Azure CLI installed and authenticated
- Contributor or Policy Contributor role on target management group
- Log Analytics workspace ID (for audit logging policies)

## Option 1: Azure CLI

### Create policy definitions

```bash
# Example: Deploy HIPAA policies
for file in policies/hipaa/definitions/*.json; do
  name=$(basename "$file" .json)
  az policy definition create \
    --name "proxima-$name" \
    --rules "$file" \
    --management-group "YOUR_MG_ID"
done
```

### Create and assign initiative

```bash
az policy set-definition create \
  --name "proxima-hipaa-baseline" \
  --definitions @policies/hipaa/initiative.json \
  --management-group "YOUR_MG_ID"

az policy assignment create \
  --name "hipaa-baseline" \
  --policy-set-definition "proxima-hipaa-baseline" \
  --scope "/providers/Microsoft.Management/managementGroups/YOUR_MG_ID"
```

## Option 2: Terraform

See [examples/assign-hipaa](../examples/assign-hipaa/) for a complete Terraform example.

## Option 3: Azure Portal

1. Navigate to **Policy** → **Definitions**
2. Import each JSON definition
3. Create an initiative grouping the definitions
4. Assign to management group or subscription

## Recommended Approach

1. Deploy in **Audit** mode first
2. Review non-compliant resources (1-2 weeks)
3. Remediate critical violations
4. Switch to **Deny** mode for new deployments
5. Enable auto-remediation where safe
