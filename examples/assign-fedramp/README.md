# Example: Assign FedRAMP Moderate Policy Initiative

Deploys the FedRAMP Moderate baseline policy initiative to a management group.

## Usage

```bash
terraform init
terraform plan -var="management_group_id=YOUR_MG" -var='allowed_regions=["usgovvirginia","usgovarizona"]'
terraform apply
```

## Prerequisites

- Policy Contributor role on the target management group
- For Azure Government: use Gov region names
