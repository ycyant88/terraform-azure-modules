module "avm-res-network-privatednszone" {
  source                = "Azure/avm-res-network-privatednszone/azurerm"
  version               = "0.1.2"
  a_records             = var.a_records
  aaaa_records          = var.aaaa_records
  cname_records         = var.cname_records
  domain_name           = var.domain_name
  enable_telemetry      = var.enable_telemetry
  mx_records            = var.mx_records
  ptr_records           = var.ptr_records
  resource_group_name   = var.resource_group_name
  soa_record            = var.soa_record
  srv_records           = var.srv_records
  tags                  = var.tags
  telem_tags            = var.telem_tags
  txt_records           = var.txt_records
  virtual_network_links = var.virtual_network_links
}
