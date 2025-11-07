variable "kv_secrets" {
  type = map(object({
    kv_secret_name      = string
    kv_secret_value     = string
    kv_name             = string
    resource_group_name = string
    tags                = optional(map(string), {})
  }))
}
