<!-- BEGIN_TF_DOCS -->
# terraform-azurerm-avm-res-edge-site

Module to deploy site manager for azure arc.

<!-- markdownlint-disable MD033 -->
## Requirements

The following requirements are needed by this module:

- <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) (~> 1.7)

- <a name="requirement_azapi"></a> [azapi](#requirement\_azapi) (~> 2.0)

- <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) (~>4.0)

- <a name="requirement_modtm"></a> [modtm](#requirement\_modtm) (~> 0.3)

- <a name="requirement_random"></a> [random](#requirement\_random) (~>3.0)

## Resources

The following resources are used by this module:

- [azapi_resource.address](https://registry.terraform.io/providers/azure/azapi/latest/docs/resources/resource) (resource)
- [azapi_resource.site](https://registry.terraform.io/providers/azure/azapi/latest/docs/resources/resource) (resource)
- [azurerm_management_lock.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/management_lock) (resource)
- [azurerm_role_assignment.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) (resource)
- [modtm_telemetry.telemetry](https://registry.terraform.io/providers/Azure/modtm/latest/docs/resources/telemetry) (resource)
- [random_uuid.telemetry](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/uuid) (resource)
- [azurerm_client_config.telemetry](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/client_config) (data source)
- [modtm_module_source.telemetry](https://registry.terraform.io/providers/Azure/modtm/latest/docs/data-sources/module_source) (data source)

<!-- markdownlint-disable MD013 -->
## Required Inputs

The following input variables are required:

### <a name="input_address_resource_name"></a> [address\_resource\_name](#input\_address\_resource\_name)

Description: A resource name for the address.

Type: `string`

### <a name="input_country"></a> [country](#input\_country)

Description: The order country of the site.

Type: `string`

### <a name="input_location"></a> [location](#input\_location)

Description: Azure region where the resource should be deployed.

Type: `string`

### <a name="input_resource_group_id"></a> [resource\_group\_id](#input\_resource\_group\_id)

Description: The resource group id where the resources will be deployed.

Type: `string`

### <a name="input_site_display_name"></a> [site\_display\_name](#input\_site\_display\_name)

Description: A display name for the site.

Type: `string`

### <a name="input_site_resource_name"></a> [site\_resource\_name](#input\_site\_resource\_name)

Description: A resource name for the site.

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_city"></a> [city](#input\_city)

Description: The city of the site.

Type: `string`

Default: `""`

### <a name="input_company_name"></a> [company\_name](#input\_company\_name)

Description: The company name of the site.

Type: `string`

Default: `""`

### <a name="input_contact_name"></a> [contact\_name](#input\_contact\_name)

Description: The contact name of the site.

Type: `string`

Default: `" "`

### <a name="input_customer_managed_key"></a> [customer\_managed\_key](#input\_customer\_managed\_key)

Description: A map describing customer-managed keys to associate with the resource. This includes the following properties:
- `key_vault_resource_id` - The resource ID of the Key Vault where the key is stored.
- `key_name` - The name of the key.
- `key_version` - (Optional) The version of the key. If not specified, the latest version is used.
- `user_assigned_identity` - (Optional) An object representing a user-assigned identity with the following properties:
  - `resource_id` - The resource ID of the user-assigned identity.

Type:

```hcl
object({
    key_vault_resource_id = string
    key_name              = string
    key_version           = optional(string, null)
    user_assigned_identity = optional(object({
      resource_id = string
    }), null)
  })
```

Default: `null`

### <a name="input_email_list"></a> [email\_list](#input\_email\_list)

Description: A list of email addresses for the site.

Type: `list(string)`

Default: `[]`

### <a name="input_enable_telemetry"></a> [enable\_telemetry](#input\_enable\_telemetry)

Description: This variable controls whether or not telemetry is enabled for the module.  
For more information see <https://aka.ms/avm/telemetryinfo>.  
If it is set to false, then no telemetry will be collected.

Type: `bool`

Default: `true`

### <a name="input_lock"></a> [lock](#input\_lock)

Description: Controls the Resource Lock configuration for this resource. The following properties can be specified:

- `kind` - (Required) The type of lock. Possible values are `\"CanNotDelete\"` and `\"ReadOnly\"`.
- `name` - (Optional) The name of the lock. If not specified, a name will be generated based on the `kind` value. Changing this forces the creation of a new resource.

Type:

```hcl
object({
    kind = string
    name = optional(string, null)
  })
```

Default: `null`

### <a name="input_mobile"></a> [mobile](#input\_mobile)

Description: The mobile phone number of the site.

Type: `string`

Default: `""`

### <a name="input_phone"></a> [phone](#input\_phone)

Description: The phone number of the site.

Type: `string`

Default: `""`

### <a name="input_phone_extension"></a> [phone\_extension](#input\_phone\_extension)

Description: The phone extension of the site.

Type: `string`

Default: `""`

### <a name="input_postal_code"></a> [postal\_code](#input\_postal\_code)

Description: The postal code of the site.

Type: `string`

Default: `""`

### <a name="input_role_assignments"></a> [role\_assignments](#input\_role\_assignments)

Description: A map of role assignments to create on this resource. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.

- `role_definition_id_or_name` - The ID or name of the role definition to assign to the principal.
- `principal_id` - The ID of the principal to assign the role to.
- `description` - The description of the role assignment.
- `skip_service_principal_aad_check` - If set to true, skips the Azure Active Directory check for the service principal in the tenant. Defaults to false.
- `condition` - The condition which will be used to scope the role assignment.
- `condition_version` - The version of the condition syntax. Valid values are '2.0'.

> Note: only set `skip_service_principal_aad_check` to true if you are assigning a role to a service principal.

Type:

```hcl
map(object({
    role_definition_id_or_name             = string
    principal_id                           = string
    description                            = optional(string, null)
    skip_service_principal_aad_check       = optional(bool, false)
    condition                              = optional(string, null)
    condition_version                      = optional(string, null)
    delegated_managed_identity_resource_id = optional(string, null)
    principal_type                         = optional(string, null)
  }))
```

Default: `{}`

### <a name="input_state_or_province"></a> [state\_or\_province](#input\_state\_or\_province)

Description: The state or province of the site.

Type: `string`

Default: `""`

### <a name="input_street_address_1"></a> [street\_address\_1](#input\_street\_address\_1)

Description: The first line of the street address of the site.

Type: `string`

Default: `""`

### <a name="input_street_address_2"></a> [street\_address\_2](#input\_street\_address\_2)

Description: The second line of the street address of the site.

Type: `string`

Default: `""`

### <a name="input_street_address_3"></a> [street\_address\_3](#input\_street\_address\_3)

Description: The third line of the street address of the site.

Type: `string`

Default: `""`

### <a name="input_tags"></a> [tags](#input\_tags)

Description: (Optional) Tags of the resource.

Type: `map(string)`

Default: `null`

### <a name="input_zip_extended_code"></a> [zip\_extended\_code](#input\_zip\_extended\_code)

Description: The extended ZIP code of the site.

Type: `string`

Default: `""`

## Outputs

The following outputs are exported:

### <a name="output_resource"></a> [resource](#output\_resource)

Description: This is the full output for the resource.

### <a name="output_resource_id"></a> [resource\_id](#output\_resource\_id)

Description: This is the resource id for the site resource.

## Modules

No modules.

<!-- markdownlint-disable-next-line MD041 -->
## Data Collection

The software may collect information about you and your use of the software and send it to Microsoft. Microsoft may use this information to provide services and improve our products and services. You may turn off the telemetry as described in the repository. There are also some features in the software that may enable you and Microsoft to collect data from users of your applications. If you use these features, you must comply with applicable law, including providing appropriate notices to users of your applications together with a copy of Microsoft’s privacy statement. Our privacy statement is located at <https://go.microsoft.com/fwlink/?LinkID=824704>. You can learn more about data collection and use in the help documentation and our privacy statement. Your use of the software operates as your consent to these practices.
<!-- END_TF_DOCS -->
