output "auto_heal_rules" {
  value       = module.avm-res-web-site.auto_heal_rules
  description = "ARM-format auto heal rules."
}

output "has_identity" {
  value       = module.avm-res-web-site.has_identity
  description = "Whether an identity block should be configured."
}

output "identity_block" {
  value       = module.avm-res-web-site.identity_block
  description = "ARM-format identity block."
}

output "ip_security_restrictions" {
  value       = module.avm-res-web-site.ip_security_restrictions
  description = "ARM-format IP security restrictions."
}

output "java_container" {
  value       = module.avm-res-web-site.java_container
  description = "Java container value."
}

output "java_container_version" {
  value       = module.avm-res-web-site.java_container_version
  description = "Java container version."
}

output "java_version" {
  value       = module.avm-res-web-site.java_version
  description = "Java version."
}

output "linux_fx_version" {
  value       = module.avm-res-web-site.linux_fx_version
  description = "Computed linuxFxVersion string."
}

output "net_framework_version" {
  value       = module.avm-res-web-site.net_framework_version
  description = "Computed .NET framework version."
}

output "node_version" {
  value       = module.avm-res-web-site.node_version
  description = "Node.js version."
}

output "php_version" {
  value       = module.avm-res-web-site.php_version
  description = "PHP version."
}

output "powershell_version" {
  value       = module.avm-res-web-site.powershell_version
  description = "PowerShell version."
}

output "python_version" {
  value       = module.avm-res-web-site.python_version
  description = "Python version."
}

output "scm_ip_security_restrictions" {
  value       = module.avm-res-web-site.scm_ip_security_restrictions
  description = "ARM-format SCM IP security restrictions."
}

output "windows_fx_version" {
  value       = module.avm-res-web-site.windows_fx_version
  description = "Computed windowsFxVersion string."
}
