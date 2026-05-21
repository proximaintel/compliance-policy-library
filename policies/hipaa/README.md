# HIPAA / HITECH Policy Set

Policies mapped to HIPAA Security Rule §164.312 technical safeguards.

## Policies

| Policy | Control | Effect |
|--------|---------|--------|
| require-encryption-at-rest | §164.312(a)(2)(iv) | Audit |
| require-tls-12 | §164.312(e)(1) | Deny |
| require-audit-logging | §164.312(b) | DeployIfNotExists |
| deny-public-storage | §164.312(e)(1) | Deny |
| require-private-endpoints | §164.312(e)(1) | Audit |

## Deployment

```bash
az policy set-definition create \
  --name "proxima-hipaa-baseline" \
  --definitions @initiative.json \
  --description "HIPAA technical safeguards baseline by Proxima Intelligence"
```
