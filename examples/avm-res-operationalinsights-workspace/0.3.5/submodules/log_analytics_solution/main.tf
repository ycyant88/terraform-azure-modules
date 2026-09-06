module "avm-res-operationalinsights-workspace" {
  source                                       = "Azure/avm-res-operationalinsights-workspace/azurerm"
  version                                      = "0.3.5"
  log_analytics_solution_location              = var.log_analytics_solution_location
  log_analytics_solution_plan                  = var.log_analytics_solution_plan
  log_analytics_solution_resource_group_name   = var.log_analytics_solution_resource_group_name
  log_analytics_solution_solution_name         = var.log_analytics_solution_solution_name
  log_analytics_solution_tags                  = var.log_analytics_solution_tags
  log_analytics_solution_timeouts              = var.log_analytics_solution_timeouts
  log_analytics_solution_workspace_name        = var.log_analytics_solution_workspace_name
  log_analytics_solution_workspace_resource_id = var.log_analytics_solution_workspace_resource_id
}
