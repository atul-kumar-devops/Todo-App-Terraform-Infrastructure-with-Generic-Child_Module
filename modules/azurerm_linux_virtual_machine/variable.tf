variable "linux_vms" {
  type = map(object({
    nic_name               = string
    linux_vm_name          = string
    resource_group_name    = string
    virtual_network_name   = string
    location               = string
    size                   = string
    source_image_reference = map(string)
    subnet_name            = string
    pip_name               = string
    nsg_name               = string
    key_vault_name         = string
    tags                   = optional(map(string), {})
  }))
}
