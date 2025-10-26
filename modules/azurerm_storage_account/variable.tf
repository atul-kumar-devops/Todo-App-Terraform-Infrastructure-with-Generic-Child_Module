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
# variable "storage_account_name" {}
# variable "location" {}
# variable "resource_group_name" {}
# variable "tags" {}
