variable "key_vaults" {
  type = map(object({
    key_vault_name      = string
    resource_group_name = string
    location            = string
    tags                = optional(map(string), {})
  }))
}
