variable "network_security_groups" {
  type = map(object({
    nsg_name            = string
    location            = string
    resource_group_name = string
    nsg_rules = list(object(
      {
        security_rule_name         = string
        priority                   = number
        direction                  = string
        access                     = string
        protocol                   = string
        source_port_range          = string
        destination_port_range     = string
        source_address_prefix      = string
        destination_address_prefix = string
      }
    ))
    tags = optional(map(string))
  }))
}
