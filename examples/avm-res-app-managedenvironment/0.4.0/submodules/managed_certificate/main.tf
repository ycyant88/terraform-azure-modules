module "avm-res-app-managedenvironment" {
  source                    = "Azure/avm-res-app-managedenvironment/azurerm"
  version                   = "0.4.0"
  domain_control_validation = var.domain_control_validation
  location                  = var.location
  managed_environment       = var.managed_environment
  name                      = var.name
  subject_name              = var.subject_name
  tags                      = var.tags
  timeouts                  = var.timeouts
}
