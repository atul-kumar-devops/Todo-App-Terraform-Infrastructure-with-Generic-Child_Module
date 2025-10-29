variable "resource_group" {
  type = map(object({
    resource_group_name = string
    location            = string
  }))
}

variable "storage_account" {
  type = map(object({
    storage_account_name     = string
    location                 = string
    resource_group_name      = string
    account_replication_type = string //"LRS"
    account_tier             = string //"Standard"
    tags                     = optional(map(string))
  }))
}

# variable "azure_container_registry" {
#   type = map(object(
#     {
#       acr_name            = string
#       resource_group_name = string
#       location            = string
#       sku                 = string //"Premium"
#       admin_enabled       = bool   //false
#       tags                = optional(map(string))
#     }
#   ))
# }

# variable "azure_kuberetes_cluster" {
#   type = map(object({
#     aks_name            = string
#     resource_group_name = string
#     location            = string
#     dns_prefix          = optional(string)
#     default_node_pool = object({
#       name       = string
#       node_count = number
#       vm_size    = string
#     })
#     identity = optional(object({
#       type = string
#       }), {
#       type = "SystemAssigned"
#     })
#     tags = optional(map(string))
#   }))
# }

# variable "sql_server" {
#   type = map(object({
#     sql_server_name              = string
#     resource_group_name          = string
#     location                     = string
#     version                      = string //"12.0"
#     administrator_login          = string
#     administrator_login_password = string
#     minimum_tls_version          = string //"1.2"
#     tags                         = optional(map(string))
#   }))
# }

# variable "sql_database" {
#   type = map(object({
#     sql_database_name = string
#     server_id         = string
#     collation         = string //"SQL_Latin1_General_CP1_CI_AS"
#     license_type      = string //"LicenseIncluded"
#     max_size_gb       = string
#     sku_name          = string //"S0"
#     enclave_type      = string //"VBS"
#     tags              = optional(map(string))
#   }))
# }
