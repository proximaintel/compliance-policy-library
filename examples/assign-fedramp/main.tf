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

variable "allowed_regions" {
  description = "List of allowed Azure regions for resource deployment"
  type        = list(string)
  default     = ["eastus", "eastus2", "westus2"]
}

resource "azurerm_policy_set_definition" "fedramp" {
  name                = "proxima-fedramp-moderate"
  policy_type         = "Custom"
  display_name        = "FedRAMP Moderate Baseline - Proxima Intelligence"
  description         = "FedRAMP Moderate controls for government workloads"
  management_group_id = var.management_group_id

  policy_definition_reference {
    policy_definition_id = azurerm_policy_definition.allowed_regions.id
    parameter_values     = jsonencode({ allowedRegions = { value = var.allowed_regions } })
  }

  policy_definition_reference {
    policy_definition_id = azurerm_policy_definition.require_nsg.id
  }

  policy_definition_reference {
    policy_definition_id = azurerm_policy_definition.require_defender.id
  }
}

resource "azurerm_policy_assignment" "fedramp" {
  name                 = "fedramp-moderate"
  policy_definition_id = azurerm_policy_set_definition.fedramp.id
  scope                = "/providers/Microsoft.Management/managementGroups/${var.management_group_id}"
  display_name         = "FedRAMP Moderate Assignment"
  description          = "Enforces FedRAMP Moderate controls across the management group"
}
