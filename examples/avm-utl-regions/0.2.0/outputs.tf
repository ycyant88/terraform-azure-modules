output "regions" {
  value       = module.avm-utl-regions.regions
  description = "A list of region objects subject to the filters supplied by input variables. Each region object contains the following attributes:\n\n- name - The name of the region.\n- display_name - The display name of the region.\n- paired_region_name - The name of the region paired with this region. May be null if the region has no pair.\n- geography - The geography of the region.\n- geography_group - The geography group of the region.\n- zones - A list of the availability zones in the region. Will be empty if the region does not support zones.\n"
}

output "regions_by_display_name" {
  value       = module.avm-utl-regions.regions_by_display_name
  description = "A map of region display names to region objects subject to the filters supplied by input variables. See regions output for more details."
}

output "regions_by_geography" {
  value       = module.avm-utl-regions.regions_by_geography
  description = "A map of geographies to a list of region objects subject to the filters supplied by input variables. See regions output for more details."
}

output "regions_by_geography_group" {
  value       = module.avm-utl-regions.regions_by_geography_group
  description = "A map of geography groups to a list of region objects subject to the filters supplied by input variables. See regions output for more details."
}

output "regions_by_name" {
  value       = module.avm-utl-regions.regions_by_name
  description = "A map of region display names to region objects subject to the filters supplied by input variables. See regions output for more details."
}

output "regions_by_name_or_display_name" {
  value       = module.avm-utl-regions.regions_by_name_or_display_name
  description = "A map of regions by either display names or name, to region objects subject to the filters supplied by input variables. See regions output for more details."
}

output "valid_region_display_names" {
  value       = module.avm-utl-regions.valid_region_display_names
  description = "A set of valid region display names subject to the filters supplied by input variables."
}

output "valid_region_names" {
  value       = module.avm-utl-regions.valid_region_names
  description = "A set of valid region names subject to the filters supplied by input variables."
}

output "valid_region_names_or_display_names" {
  value       = module.avm-utl-regions.valid_region_names_or_display_names
  description = "A set of valid region names or display names subject to the filters supplied by input variables."
}
