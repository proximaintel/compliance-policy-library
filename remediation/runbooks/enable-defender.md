# Runbook: Enable Microsoft Defender for Cloud

## Issue
Subscription does not have Defender for Cloud plans enabled.

## Impact
- FedRAMP SI-4 violation
- No threat detection or vulnerability assessment
- No Secure Score tracking

## Steps

1. Navigate to **Microsoft Defender for Cloud** → **Environment settings**
2. Select the subscription
3. Enable all Defender plans:
   - Defender for Servers
   - Defender for Storage
   - Defender for SQL
   - Defender for Containers
   - Defender for Key Vault
   - Defender for App Service
4. Enable auto-provisioning for agents
5. Configure email notifications for high-severity alerts

## Cost Note
Defender plans have per-resource pricing. Estimate cost before enabling on large subscriptions. Typical: $15-25/server/month.
