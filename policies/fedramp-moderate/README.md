# FedRAMP Moderate Policy Set

Policies mapped to NIST 800-53 controls required for FedRAMP Moderate authorization.

## Policies

| Policy | Control | Effect |
|--------|---------|--------|
| allowed-regions | SC-7, PE-18 | Deny |
| require-nsg-on-subnets | SC-7 | Audit |
| deny-unapproved-resource-types | CM-7 | Deny |
| require-defender-for-cloud | SI-4 | Audit |
| require-key-vault-soft-delete | CP-9 | Deny |

## Deployment

```bash
az policy set-definition create \
  --name "proxima-fedramp-moderate" \
  --definitions @initiative.json \
  --description "FedRAMP Moderate baseline by Proxima Intelligence"
```
