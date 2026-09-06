module "avm-res-containerservice-managedcluster" {
  source                 = "Azure/avm-res-containerservice-managedcluster/azurerm"
  version                = "0.8.3"
  adoption_policy        = var.adoption_policy
  annotations            = var.annotations
  default_network_policy = var.default_network_policy
  default_resource_quota = var.default_resource_quota
  delete_policy          = var.delete_policy
  ignore_body_changes    = var.ignore_body_changes
  labels                 = var.labels
  location               = var.location
  name                   = var.name
  parent_id              = var.parent_id
  resource_types         = var.resource_types
  retry                  = var.retry
  tags                   = var.tags
  timeouts               = var.timeouts
}
