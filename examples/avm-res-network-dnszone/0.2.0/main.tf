module "avm-res-network-dnszone" {
  source              = "Azure/avm-res-network-dnszone/azurerm"
  version             = "0.2.0"
  a_records           = var.a_records
  aaaa_records        = var.aaaa_records
  caa_records         = var.caa_records
  cname_records       = var.cname_records
  enable_telemetry    = var.enable_telemetry
  mx_records          = var.mx_records
  name                = var.name
  ns_records          = var.ns_records
  ptr_records         = var.ptr_records
  resource_group_name = var.resource_group_name
  srv_records         = var.srv_records
  tags                = var.tags
  txt_records         = var.txt_records
}
