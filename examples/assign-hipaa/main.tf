terraform {
  required_version = ">= 1.5"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.80"
    }
  }
}

provider "azurerm" {
  features {}
}

variable "management_group_id" {
  description = "The ID of the management group to assign the policy initiative"
  type        = string
}

variable "log_analytics_workspace_id" {
  description = "The resource ID of the Log Analytics workspace for audit logging"
  type        = string
}

resource "azurerm_policy_set_definition" "hipaa" {
  name                = "proxima-hipaa-baseline"
  policy_type         = "Custom"
  display_name        = "HIPAA Baseline - Proxima Intelligence"
  description         = "HIPAA technical safeguards baseline for regulated healthcare workloads"
  management_group_id = var.management_group_id

  policy_definition_reference {
    policy_definition_id = azurerm_policy_definition.require_encryption.id
  }

  policy_definition_reference {
    policy_definition_id = azurerm_policy_definition.require_tls.id
  }

  policy_definition_reference {
    policy_definition_id = azurerm_policy_definition.deny_public_storage.id
  }
}

resource "azurerm_policy_assignment" "hipaa" {
  name                 = "hipaa-baseline"
  policy_definition_id = azurerm_policy_set_definition.hipaa.id
  scope                = "/providers/Microsoft.Management/managementGroups/${var.management_group_id}"
  display_name         = "HIPAA Baseline Assignment"
  description          = "Enforces HIPAA technical safeguards across the management group"
}
