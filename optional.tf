variable "name" {
  description = "Name of the resource group module. If null, will default to product."
  default     = null
  type        = string
}

variable "description" {
  description = "Description of the resource group module."
  default     = null
  type        = string
}

variable "query" {
  description = "Query to use for the resource group. If null, will default to all supported resources for the product."
  default     = null
  type        = string
}
