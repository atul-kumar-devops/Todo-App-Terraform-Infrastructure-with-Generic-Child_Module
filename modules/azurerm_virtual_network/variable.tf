# resource "azurrm_virtual_network" "child_virtual_network" {
#   for_each            = var.virtual_network
#   name                = each.value.virtual_network_name
#   location            = each.value.location
#   resource_group_name = each.value.resource_group_name
#   address_space       = each.value.address_space //Exactly one of address_space or ip_address_pool must be specified.
#   // Optional Arguements
#   dns_servers = try(each.value.dns_servers, null)
#   dynamic "subnet" {
#     for_each = each.vaule.subnets
#     content {
#       name             = subnet.value.name
#       address_prefixes = subnet.value.address_prefixes
#     }
#   }

# }
