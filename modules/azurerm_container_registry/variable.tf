variable "acr" {
  type = map(object(
    {
      acr_name            = string
      resource_group_name = string
      location            = string
      sku                 = string //"Premium"
      admin_enabled       = bool   //false
      tags                = optional(map(string))
    }
  ))
}

# variable "acr_name" {}
# variable "resource_group_name" {}
# variable "location" {}
# variable "tags" {}
