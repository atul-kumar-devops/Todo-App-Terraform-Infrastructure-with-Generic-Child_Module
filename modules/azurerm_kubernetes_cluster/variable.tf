variable "aks_cluster" {
  type = map(object({
    aks_name            = string
    resource_group_name = string
    location            = string
    dns_prefix          = optional(string)
    default_node_pool = object({
      name       = string
      node_count = number
      vm_size    = string
    })
    identity = optional(object({
      type = string
      }), {
      type = "SystemAssigned"
    })
    tags = optional(map(string))
  }))
}

# variable "aks_name" {}
# variable "resource_group_name" {}
# variable "location" {}
# variable "dns_prefix" {}
# variable "node_count" {}
# variable "vm_size" {
#     default = "Standard_D2as_v5"
# }
# variable "tags" {}
