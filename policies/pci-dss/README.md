# PCI DSS v4.0 Policy Set

Policies mapped to PCI DSS v4.0 requirements for cardholder data protection.

## Policies

| Policy | Requirement | Effect |
|--------|-------------|--------|
| require-network-segmentation | Req 1 | Audit |
| require-encryption-in-transit | Req 4 | Deny |
| require-key-rotation | Req 3 | Audit |
| deny-public-ip-on-vms | Req 1 | Deny |
| require-log-retention-365 | Req 10 | Audit |

## Deployment

```bash
az policy set-definition create \
  --name "proxima-pci-dss-v4" \
  --definitions @initiative.json \
  --description "PCI DSS v4.0 baseline by Proxima Intelligence"
```
