resource "azurerm_kubernetes_cluster" "child_aks" {
  for_each = var.aks_cluster

  name                = each.value.aks_name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  dns_prefix          = each.value.dns_prefix

  default_node_pool {
    name       = each.value.default_node_pool.name //"default"
    node_count = each.value.default_node_pool.node_count
    vm_size    = each.value.default_node_pool.vm_size
  }

  identity {
    type = each.value.identity.type //"SystemAssigned"
  }

  tags = each.value.tags

  # tags = var.tags
}
