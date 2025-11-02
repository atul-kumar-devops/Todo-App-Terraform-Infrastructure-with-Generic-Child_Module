variable "storage_account" {

  type = map(object({
    storage_account_name     = string
    location                 = string
    resource_group_name      = string
    account_replication_type = string //"LRS"
    account_tier             = string //"Standard"
    
    account_kind             = optional(string, "StorageV2")

    custom_domain = optional(map(object({
      name          = string
      use_subdomain = optional(string, false)
    })), {})

    network_rules = optional(map(object({
      default_action = string
      bypass         = optional(string)
      ip_rules       = optional(list(string))
    })), {})

    identity = optional(map(object({
      type         = string
      identity_ids = optional(list(string))
    })), {})

    tags = optional(map(string), {})

  }))

}
# variable "storage_account_name" {}
# variable "location" {}
# variable "resource_group_name" {}
# variable "tags" {}
