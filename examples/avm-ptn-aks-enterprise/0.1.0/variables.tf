variable "agents_tags" {
  description = "(Optional) A mapping of tags to assign to the Node Pool."
  type        = map(string)
  default     = {}
}

variable "container_registry_name" {
  description = "(Optional) The name of the container registry to use for the AKS cluster."
  type        = string
  default     = null
}

variable "enable_telemetry" {
  description = "This variable controls whether or not telemetry is enabled for the module.\nFor more information see <https://aka.ms/avm/telemetryinfo>.\nIf it is set to false, then no telemetry will be collected.\n"
  type        = bool
  default     = true
}

variable "firewall_cidr" {
  description = "(Optional) The CIDR to use for the firewall IPs in the Kubernetes cluster."
  type        = string
  default     = "10.42.2.0/24"
}

variable "kubernetes_version" {
  description = "Specify which Kubernetes release to use. Specify only minor version, such as '1.28'."
  type        = string
  default     = null
}

variable "location" {
  description = "The Azure region where the resources should be deployed."
  type        = string
  default     = ""
}

variable "lock" {
  description = "  Controls the Resource Lock configuration for this resource. The following properties can be specified:\n\n  - kind - (Required) The type of lock. Possible values are \\\"CanNotDelete\\\" and \\\"ReadOnly\\\".\n  - name - (Optional) The name of the lock. If not specified, a name will be generated based on the kind value. Changing this forces the creation of a new resource.\n"
  type = object({
    kind = string
    name = optional(string, null)
  })
  default = null
}

variable "managed_identities" {
  description = "  Controls the Managed Identity configuration on this resource. The following properties can be specified:\n\n  - system_assigned - (Optional) Specifies if the System Assigned Managed Identity should be enabled.\n  - user_assigned_resource_ids - (Optional) Specifies a list of User Assigned Managed Identity resource IDs to be assigned to this resource.\n"
  type = object({
    system_assigned            = optional(bool, false)
    user_assigned_resource_ids = optional(set(string), [])
  })
  default = {}
}

variable "monitor_metrics" {
  description = "(Optional) Specifies a Prometheus add-on profile for the Kubernetes Cluster\nobject({\n  annotations_allowed = \"(Optional) Specifies a comma-separated list of Kubernetes annotation keys that will be used in the resource's labels metric.\"\n  labels_allowed      = \"(Optional) Specifies a Comma-separated list of additional Kubernetes label keys that will be used in the resource's labels metric.\"\n})\n"
  type = object({
    annotations_allowed = optional(string)
    labels_allowed      = optional(string)
  })
  default = null
}

variable "name" {
  description = "The name for the AKS resources created in the specified Azure Resource Group. This variable overwrites the 'prefix' var (The 'prefix' var will still be applied to the dns_prefix if it is set)"
  type        = string
  default     = ""
}

variable "node_cidr" {
  description = "(Optional) The CIDR to use for node IPs in the Kubernetes cluster."
  type        = string
  default     = "10.42.1.0/24"
}

variable "node_pools" {
  description = "A map of node pools that need to be created and attached on the Kubernetes cluster. The key of the map can be the name of the node pool, and the key must be static string. The value of the map is a node_pool block as defined below:\nmap(object({\n  name                 = (Required) The name of the Node Pool which should be created within the Kubernetes Cluster. Changing this forces a new resource to be created. A Windows Node Pool cannot have a name longer than 6 characters. A random suffix of 4 characters is always added to the name to avoid clashes during recreates.\n  vm_size              = (Required) The SKU which should be used for the Virtual Machines used in this Node Pool. Changing this forces a new resource to be created.\n  orchestrator_version = (Required) The version of Kubernetes which should be used for this Node Pool. Changing this forces a new resource to be created.\n  max_count            = (Optional) The maximum number of nodes which should exist within this Node Pool. Valid values are between 0 and 1000 and must be greater than or equal to min_count.\n  min_count            = (Optional) The minimum number of nodes which should exist within this Node Pool. Valid values are between 0 and 1000 and must be less than or equal to max_count.\n  os_sku               = (Optional) Specifies the OS SKU used by the agent pool. Possible values include: Ubuntu, CBLMariner, Mariner, Windows2019, Windows2022. If not specified, the default is Ubuntu if OSType=Linux or Windows2019 if OSType=Windows. And the default Windows OSSKU will be changed to Windows2022 after Windows2019 is deprecated. Changing this forces a new resource to be created.\n  mode                 = (Optional) Should this Node Pool be used for System or User resources? Possible values are System and User. Defaults to User.\n  os_disk_size_gb      = (Optional) The Agent Operating System disk size in GB. Changing this forces a new resource to be created.\n  tags                 = (Optional) A mapping of tags to assign to the resource. At this time there's a bug in the AKS API where Tags for a Node Pool are not stored in the correct case - you [may wish to use Terraform's ignore_changes functionality to ignore changes to the casing](https://www.terraform.io/language/meta-arguments/lifecycle#ignore_changess) until this is fixed in the AKS API.\n  zones                = (Optional) Specifies a list of Availability Zones in which this Kubernetes Cluster Node Pool should be located. Changing this forces a new Kubernetes Cluster Node Pool to be created.\n}))\n\nExample input:\nterraform\n  node_pools = {\n    workload = {\n      name                 = \"workload\"\n      vm_size              = \"Standard_D2d_v5\"\n      orchestrator_version = \"1.28\"\n      max_count            = 20\n      min_count            = 2\n      os_sku               = \"Ubuntu\"\n      mode                 = \"User\"\n    },\n    ingress = {\n      name                 = \"ingress\"\n      vm_size              = \"Standard_D2d_v5\"\n      orchestrator_version = \"1.28\"\n      max_count            = 4\n      min_count            = 2\n      os_sku               = \"Ubuntu\"\n      mode                 = \"User\"\n    }\n  }\n  \n"
  type = map(object({
    name                 = string
    vm_size              = string
    orchestrator_version = string
    # do not add nodecount because we enforce the use of auto-scaling
    max_count       = optional(number)
    min_count       = optional(number)
    os_sku          = optional(string)
    mode            = optional(string)
    os_disk_size_gb = optional(number, null)
    tags            = optional(map(string), {})
    zones           = optional(set(string))
  }))
  default = {}
}

variable "orchestrator_version" {
  description = "(Optional) Specify which Kubernetes release to use. Specify only minor version, such as '1.28'."
  type        = string
  default     = null
}

variable "pod_cidr" {
  description = "(Optional) The CIDR to use for pod IPs in the Kubernetes cluster. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "rbac_aad_admin_group_object_ids" {
  description = "Object ID of groups with admin access."
  type        = list(string)
  default     = null
}

variable "rbac_aad_azure_rbac_enabled" {
  description = "(Optional) Is Role Based Access Control based on Azure AD enabled?"
  type        = bool
  default     = null
}

variable "rbac_aad_tenant_id" {
  description = "(Optional) The Tenant ID used for Azure Active Directory Application. If this isn't specified the Tenant ID of the current Subscription is used."
  type        = string
  default     = null
}

variable "resource_group_name" {
  description = "The resource group where the resources will be deployed."
  type        = string
  default     = ""
}

variable "tags" {
  description = "(Optional) Tags of the resource."
  type        = map(string)
  default     = null
}

variable "user_assigned_identity_name" {
  description = "(Optional) The name of the User Assigned Managed Identity to create."
  type        = string
  default     = null
}

variable "user_assigned_managed_identity_resource_ids" {
  description = "(Optional) Specifies a list of User Assigned Managed Identity resource IDs to be assigned to this resource."
  type        = set(string)
  default     = []
}

variable "virtual_network_address_space" {
  description = "(Optional) The address space that is used by the virtual network."
  type        = string
  default     = "10.42.0.0/16"
}
