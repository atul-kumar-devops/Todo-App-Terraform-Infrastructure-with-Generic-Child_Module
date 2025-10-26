variable "sql_database" {
  type = map(object({
    sql_database_name = string
    server_id         = string
    collation         = string //"SQL_Latin1_General_CP1_CI_AS"
    license_type      = string //"LicenseIncluded"
    max_size_gb       = string
    sku_name          = string //"S0"
    enclave_type      = string //"VBS"
    tags              = optional(map(string))
  }))
}

# variable "sql_database_name" {}
# variable "server_id" {}
# variable "tags" {}
# variable "max_size_gb" {}
