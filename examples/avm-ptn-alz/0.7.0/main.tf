module "avm-ptn-alz" {
  source                       = "Azure/avm-ptn-alz/azurerm"
  version                      = "0.7.0"
  architecture_name            = var.architecture_name
  delays                       = var.delays
  enable_telemetry             = var.enable_telemetry
  location                     = var.location
  parent_resource_id           = var.parent_resource_id
  policy_assignments_to_modify = var.policy_assignments_to_modify
  timeouts                     = var.timeouts
}
