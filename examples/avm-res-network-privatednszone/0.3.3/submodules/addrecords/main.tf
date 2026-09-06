module "avm-res-network-privatednszone" {
  source              = "Azure/avm-res-network-privatednszone/azurerm"
  version             = "0.3.3"
  a_records           = var.a_records
  aaaa_records        = var.aaaa_records
  cname_records       = var.cname_records
  mx_records          = var.mx_records
  ptr_records         = var.ptr_records
  resource_group_name = var.resource_group_name
  srv_records         = var.srv_records
  txt_records         = var.txt_records
  zone_name           = var.zone_name
}
