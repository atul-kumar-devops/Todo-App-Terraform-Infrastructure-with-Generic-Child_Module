variable "sql_server" {
  type = map(object({
    sql_server_name              = string
    resource_group_name          = string
    location                     = string
    version                      = string //"12.0"
    administrator_login          = string
    administrator_login_password = string
    minimum_tls_version          = string //"1.2"
    tags                         = optional(map(string))
  }))
}

# variable "sql_server_name" {}
# variable "resource_group_name" {}
# variable "location" {}
# variable "admin_username" {}
# variable "admin_password" {}
# variable "tags" {}
