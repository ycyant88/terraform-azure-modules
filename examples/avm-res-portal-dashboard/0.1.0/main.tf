module "avm-res-portal-dashboard" {
  source                  = "Azure/avm-res-portal-dashboard/azurerm"
  version                 = "0.1.0"
  enable_telemetry        = var.enable_telemetry
  location                = var.location
  name                    = var.name
  resource_group_name     = var.resource_group_name
  tags                    = var.tags
  template_file_path      = var.template_file_path
  template_file_variables = var.template_file_variables
}
