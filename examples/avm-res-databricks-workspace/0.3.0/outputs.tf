output "databricks_access_connector_ids" {
  value       = module.avm-res-databricks-workspace.databricks_access_connector_ids
  description = "Map of the id's of each Databricks Access Connector."
}

output "databricks_access_connector_principal_ids" {
  value       = module.avm-res-databricks-workspace.databricks_access_connector_principal_ids
  description = "Map of the principal_id's of each Databricks Access Connector."
}

output "databricks_id" {
  value       = module.avm-res-databricks-workspace.databricks_id
  description = "The ID of the Databricks Workspace in the Azure management plane."
}

output "databricks_virtual_network_peering_address_space_prefixes" {
  value       = module.avm-res-databricks-workspace.databricks_virtual_network_peering_address_space_prefixes
  description = "A list of address blocks reserved for this virtual network in CIDR notation."
}

output "databricks_virtual_network_peering_id" {
  value       = module.avm-res-databricks-workspace.databricks_virtual_network_peering_id
  description = "The IDs of the internal Virtual Networks used by the DataBricks Workspace."
}

output "databricks_virtual_network_peering_virtual_network_id" {
  value       = module.avm-res-databricks-workspace.databricks_virtual_network_peering_virtual_network_id
  description = "The ID of the internal Virtual Network used by the DataBricks Workspace."
}

output "databricks_workspace_disk_encryption_set_id" {
  value       = module.avm-res-databricks-workspace.databricks_workspace_disk_encryption_set_id
  description = "The ID of Managed Disk Encryption Set created by the Databricks Workspace."
}

output "databricks_workspace_id" {
  value       = module.avm-res-databricks-workspace.databricks_workspace_id
  description = "The unique identifier of the databricks workspace in Databricks control plane."
}

output "databricks_workspace_managed_disk_identity" {
  value       = module.avm-res-databricks-workspace.databricks_workspace_managed_disk_identity
  description = "  A managed_disk_identity block as documented below\n\n  - principal_id - The principal UUID for the internal databricks disks identity needed to provide access to the workspace for enabling Customer Managed Keys.\n  - tenant_id - The UUID of the tenant where the internal databricks disks identity was created.\n  - type - The type of the internal databricks disks identity.\n"
}

output "databricks_workspace_managed_resource_group_id" {
  value       = module.avm-res-databricks-workspace.databricks_workspace_managed_resource_group_id
  description = "The ID of the Managed Resource Group created by the Databricks Workspace."
}

output "databricks_workspace_storage_account_identity" {
  value       = module.avm-res-databricks-workspace.databricks_workspace_storage_account_identity
  description = "  A storage_account_identity block as documented below\n\n  - principal_id - The principal UUID for the internal databricks storage account needed to provide access to the workspace for enabling Customer Managed Keys.\n  - tenant_id - The UUID of the tenant where the internal databricks storage account was created.\n  - type - The type of the internal databricks storage account.\n"
}

output "databricks_workspace_url" {
  value       = module.avm-res-databricks-workspace.databricks_workspace_url
  description = "The workspace URL which is of the format 'adb-{workspaceId}.{random}.azuredatabricks.net'."
}

output "name" {
  value       = module.avm-res-databricks-workspace.name
  description = "The name of the Databricks Workspace."
}

output "private_endpoints" {
  value       = module.avm-res-databricks-workspace.private_endpoints
  description = "A map of private endpoints. The map key is the supplied input to var.private_endpoints. The map value is the entire azurerm_private_endpoint resource."
}

output "resource" {
  value       = module.avm-res-databricks-workspace.resource
  description = "This is the full output for the resource."
}

output "resource_id" {
  value       = module.avm-res-databricks-workspace.resource_id
  description = "The ID of the Databricks Workspace in the Azure management plane."
}
