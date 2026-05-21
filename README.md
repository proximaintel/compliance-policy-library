# Compliance Policy Library

[![License](https://img.shields.io/badge/License-Apache_2.0-blue.svg)](LICENSE)

**Azure Policy definitions, Sentinel analytics rules, and remediation runbooks for regulated industries.**

Built by [Proxima Intelligence](https://proximaintel.com) — Enterprise Cloud & AI Consulting.

---

## Overview

Regulated enterprises need compliance-as-code — not manual checklists. This library provides production-ready Azure Policy definitions mapped to major compliance frameworks, Sentinel analytics rules for threat detection, and remediation runbooks for common violations.

Deploy an entire compliance baseline in minutes, not months.

## Supported Frameworks

| Framework | Policies | Controls Covered | Status |
|-----------|:--------:|:----------------:|--------|
| [HIPAA / HITECH](policies/hipaa/) | 5 | §164.312 | ✓ |
| [FedRAMP Moderate](policies/fedramp-moderate/) | 5 | AC, SC, AU, CM | ✓ |
| [PCI DSS v4.0](policies/pci-dss/) | 5 | Req 1, 3, 4, 7, 10 | ✓ |
| [NIST 800-53 Rev 5](policies/nist-800-53/) | 5 | IA, SC, SI, CP | ✓ |
| [CIS Azure Benchmark v2.0](policies/cis-azure/) | 5 | Sections 3-7 | ✓ |

**Total: 25 policy definitions across 5 frameworks**

## Repository Structure

```
├── policies/              # Azure Policy definitions by framework
│   ├── hipaa/
│   ├── fedramp-moderate/
│   ├── pci-dss/
│   ├── nist-800-53/
│   └── cis-azure/
├── sentinel/              # Analytics rules and workbooks
│   ├── analytics-rules/
│   └── workbooks/
├── remediation/           # Runbooks and automation scripts
│   ├── runbooks/
│   └── automation/
├── docs/                  # Deployment guide, framework mapping, audit prep
└── examples/              # Terraform examples for policy assignment
```

## Quick Start

### Deploy HIPAA initiative via Azure CLI

```bash
# Create policy definitions
az policy definition create \
  --name "require-encryption-at-rest" \
  --rules policies/hipaa/definitions/require-encryption-at-rest.json

# Assign initiative to management group
az policy set-definition create \
  --name "hipaa-baseline" \
  --definitions policies/hipaa/initiative.json

az policy assignment create \
  --name "hipaa-baseline-assignment" \
  --policy-set-definition "hipaa-baseline" \
  --scope "/providers/Microsoft.Management/managementGroups/YOUR_MG"
```

### Deploy via Terraform

See [examples/assign-hipaa](examples/assign-hipaa/) or [examples/assign-fedramp](examples/assign-fedramp/).

## Sentinel Rules

| Rule | Detection |
|------|-----------|
| [Brute Force Detection](sentinel/analytics-rules/brute-force-detection.json) | Multiple failed sign-ins from single IP |
| [Impossible Travel](sentinel/analytics-rules/impossible-travel.json) | Sign-ins from geographically impossible locations |
| [Privilege Escalation](sentinel/analytics-rules/privilege-escalation.json) | Unexpected role assignments or PIM activations |
| [Data Exfiltration](sentinel/analytics-rules/data-exfiltration.json) | Unusual data download patterns |
| [Policy Violation Alert](sentinel/analytics-rules/policy-violation-alert.json) | Non-compliant resource creation attempts |

## Remediation

| Runbook | Issue |
|---------|-------|
| [Enable Encryption](remediation/runbooks/enable-encryption.md) | Storage accounts without encryption |
| [Remove Public Access](remediation/runbooks/remove-public-access.md) | Public blob/container access |
| [Enable Diagnostics](remediation/runbooks/enable-diagnostics.md) | Resources without diagnostic settings |
| [Rotate Keys](remediation/runbooks/rotate-keys.md) | Key Vault keys past rotation date |
| [Enable Defender](remediation/runbooks/enable-defender.md) | Subscriptions without Defender plans |

## Documentation

- [Framework Mapping](docs/framework-mapping.md) — control-to-policy mapping table
- [Deployment Guide](docs/deployment-guide.md) — step-by-step assignment instructions
- [Audit Preparation](docs/audit-preparation.md) — how to use this library for audit evidence
- [Evidence Collection](docs/evidence-collection.md) — automated compliance reporting

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

## About Proxima Intelligence

[Proxima Intelligence](https://proximaintel.com) delivers compliance automation through two accelerators:
- [Zero Trust Baseline](https://proximaintel.com/accelerators/zero-trust-baseline) — identity, network, endpoint, data protection
- [Compliance Automation Pack](https://proximaintel.com/accelerators/compliance-automation) — policy-as-code for HIPAA, FedRAMP, PCI, and more

Senior architects on every engagement. No bait-and-switch.

---

*© Proxima Intelligence LLC. Licensed under Apache 2.0.*
