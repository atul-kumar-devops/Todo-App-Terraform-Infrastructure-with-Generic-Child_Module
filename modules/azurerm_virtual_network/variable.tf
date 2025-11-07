variable "virtual_networks" {
  type = map(object({
    virtual_network_name = string
    location             = string
    resource_group_name  = string
    address_space        = list(string)
    dns_servers          = optional(list(string))
    ddos_protection_plan = optional(map(object({
      id     = string
      enable = string
    })), {})
    encryption_defined = optional(map(string))
    tags               = optional(map(string), {})
  }))
}
