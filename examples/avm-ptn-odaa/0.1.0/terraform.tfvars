cloud_exadata_infrastructure = ""

cloud_exadata_vm_cluster = ""

enable_telemetry = true

location = ""

odaa_vnet_peerings = ""

resource_group_name = ""

tags = null

virtual_networks = { "primaryvnet" : { "address_space" : ["10.0.0.0/16"], "name" : "vnet-odaa", "subnet" : [{ "address_prefixes" : ["10.0.0.0/24"], "delegate_to_oracle" : true, "name" : "client" }, { "address_prefixes" : ["10.0.1.0/24"], "delegate_to_oracle" : false, "name" : "backup" }] } }
