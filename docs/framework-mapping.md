# Framework-to-Policy Mapping

| Control | HIPAA | FedRAMP | PCI DSS | NIST 800-53 | CIS Azure |
|---------|-------|---------|---------|-------------|-----------|
| Encryption at rest | require-encryption-at-rest | — | — | require-cmk-encryption | — |
| Encryption in transit | require-tls-12 | — | require-encryption-in-transit | — | require-secure-transfer |
| Audit logging | require-audit-logging | — | require-log-retention-365 | — | — |
| Public access denied | deny-public-storage | — | deny-public-ip-on-vms | — | deny-rdp-from-internet |
| Private networking | require-private-endpoints | require-nsg-on-subnets | require-network-segmentation | — | — |
| Region restriction | — | allowed-regions | — | — | — |
| Resource type control | — | deny-unapproved-resource-types | — | deny-classic-resources | — |
| Security monitoring | — | require-defender-for-cloud | — | require-vulnerability-assessment | require-network-watcher |
| Key management | — | require-key-vault-soft-delete | require-key-rotation | — | — |
| Backup | — | — | — | require-backup | — |
| Disk encryption | — | — | — | — | require-disk-encryption |
| SQL access control | — | — | — | — | deny-unrestricted-sql-access |
| Identity (MFA) | — | — | — | require-mfa | — |
