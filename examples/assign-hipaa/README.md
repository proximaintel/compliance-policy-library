# Example: Assign HIPAA Policy Initiative

Deploys the HIPAA baseline policy initiative to a management group.

## Usage

```bash
terraform init
terraform plan -var="management_group_id=YOUR_MG" -var="log_analytics_workspace_id=YOUR_LA_ID"
terraform apply
```

## Prerequisites

- Policy Contributor role on the target management group
- Log Analytics workspace for audit logging
