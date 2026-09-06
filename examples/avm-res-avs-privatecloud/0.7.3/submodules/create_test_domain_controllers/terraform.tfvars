admin_group_name = "vcenterAdmins"

bastion_name = null

bastion_pip_name = null

bastion_subnet_resource_id = null

create_bastion = false

dc_dsc_script_url = "https://raw.githubusercontent.com/Azure/terraform-azurerm-avm-res-avs-privatecloud/main/modules/create_test_domain_controllers/templates/dc_windows_dsc.ps1"

dc_dsc_script_url_secondary = "https://raw.githubusercontent.com/Azure/terraform-azurerm-avm-res-avs-privatecloud/main/modules/create_test_domain_controllers/templates/dc_secondary_windows_dsc.ps1"

dc_subnet_resource_id = ""

dc_vm_name = ""

dc_vm_name_secondary = ""

dc_vm_sku = "Standard_D2_v4"

domain_distinguished_name = "DC=test,DC=local"

domain_fqdn = "test.local"

domain_netbios_name = "test"

key_vault_resource_id = ""

ldap_user = "ldapuser"

private_ip_address = ""

resource_group_location = ""

resource_group_name = ""

tags = null

test_admin_user = "testAdmin"

virtual_network_resource_id = ""
