module "avm-res-app-managedenvironment" {
  source                    = "Azure/avm-res-app-managedenvironment/azurerm"
  version                   = "0.5.0"
  domain_control_validation = var.domain_control_validation
  enable_telemetry          = var.enable_telemetry
  location                  = var.location
  name                      = var.name
  parent_id                 = var.parent_id
  subject_name              = var.subject_name
  tags                      = var.tags
}
