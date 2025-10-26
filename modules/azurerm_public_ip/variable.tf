variable "pip_name" {
  description = "Public IP Name"
  type        = string
}
variable "resource_group_name" {
  description = "Resource Group Name"
  type        = string
}

variable "location" {
  description = "Location Where Public IP will be created"
  type        = string
}
variable "sku" {
  description = "Public IP SKU"
  type        = string
}
variable "tags" {
  description = "A map of Tags to assign to the resource"
  type        = map(string)
  default     = {}
}
