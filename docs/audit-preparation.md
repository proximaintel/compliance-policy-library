# Audit Preparation Guide

## How to Use This Library for Audit Evidence

### Before the Audit

1. **Deploy policies in audit mode** — generates compliance data without blocking
2. **Run compliance scan** — Azure Policy evaluates all resources
3. **Export compliance report** — Policy compliance state for all resources
4. **Configure Defender regulatory compliance** — maps to your framework
5. **Review Sentinel alerts** — evidence of active monitoring

### Evidence Collection

| Evidence Type | Source | Export Method |
|--------------|--------|--------------|
| Policy compliance state | Azure Policy | Portal export or REST API |
| Secure Score | Defender for Cloud | Dashboard screenshot or API |
| Regulatory compliance | Defender for Cloud | Built-in framework reports |
| Activity logs | Azure Monitor | Log Analytics query export |
| Sign-in logs | Entra ID | Log Analytics query export |
| Alert history | Sentinel | Incident export |

### Presenting to Auditors

1. Show the policy initiative — "these are our automated controls"
2. Show compliance percentage — "95% of resources are compliant"
3. Show remediation evidence — "non-compliant resources were fixed on [date]"
4. Show monitoring — "Sentinel detects and alerts on violations in real-time"
5. Show the audit trail — "all actions are logged for 365 days"

### Common Auditor Questions

| Question | Evidence |
|----------|----------|
| "How do you enforce encryption?" | Policy: require-encryption-at-rest (deny effect) |
| "How do you monitor access?" | Sentinel rules + Log Analytics retention |
| "How do you handle violations?" | Remediation runbooks + auto-remediation |
| "How do you prevent unauthorized changes?" | PIM + conditional access + activity logs |
| "How long do you retain logs?" | Log Analytics retention policy (365 days) |
