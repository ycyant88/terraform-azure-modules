variable "total_av64_quota_required" {
  description = "The total number of av64 host nodes required for the test SDDC deployment."
  type        = number
  default     = 0
}

variable "total_quota_required" {
  description = "The total number of host nodes required for the test SDDC deployment."
  type        = number
  default     = 3
}
