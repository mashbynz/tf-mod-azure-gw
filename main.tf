# ExpressRoute Gateway

resource "azurerm_public_ip" "default" {
  count = var.enabled == true ? length(var.express_route_config.peering_location) : 0
  name  = "${element(keys(var.express_route_config.peering_location), count.index)}${var.sharedservices_name}${module.ergw_pip_label.delimiter}${element(module.ergw_pip_label.attributes, 0)}${length(keys(var.express_route_config.peering_location))}"
  # name                = "${format("%s%s%s%s%s", module.ergw_pip_label.id, var.delimiter, element(keys(var.express_route_config.peering_location), count.index), var.delimiter, element(module.ergw_pip_label.attributes, count.index))}"
  location            = element(values(var.express_route_config.location), count.index)
  resource_group_name = element(var.resource_group_name, count.index)
  allocation_method   = var.express_route_config.ergw_allocation_method
  sku                 = var.express_route_config.ergw_ip_sku
  tags                = module.ergw_pip_label.tags
}

resource "azurerm_virtual_network_gateway" "default" {
  count = var.enabled == true ? length(keys(var.express_route_config.peering_location)) : 0
  name  = "${element(keys(var.express_route_config.peering_location), count.index)}${var.sharedservices_name}${module.er_label.delimiter}${element(module.er_label.attributes, 0)}${length(keys(var.express_route_config.peering_location))}"
  # name                = "${module.er_label.id}${var.delimiter}${element(keys(var.express_route_config.peering_location), count.index)}${var.delimiter}${element(module.er_label.attributes, count.index)}"
  location            = element(values(var.express_route_config.location), count.index)
  resource_group_name = element(var.resource_group_name, count.index)

  type = var.express_route_config.ergw_type
  sku  = var.express_route_config.ergw_sku

  ip_configuration {
    name                          = module.ipconfig_label.id
    # name                          = "${element(keys(var.express_route_config.peering_location), count.index)}${var.sharedservices_name}"
    public_ip_address_id          = element(azurerm_public_ip.default.*.id, count.index)
    private_ip_address_allocation = var.express_route_config.ergw_private_allocation
    subnet_id                     = element(var.gateway_subnet_id, count.index)
  }
}

resource "azurerm_express_route_circuit" "default" {
  count = var.enabled == true ? length(var.express_route_config.peering_location) : 0
  name  = "${element(keys(var.express_route_config.peering_location), count.index)}${var.sharedservices_name}${module.ergw_label.delimiter}${element(module.ergw_label.attributes, 0)}${length(keys(var.express_route_config.peering_location))}"
  # name                  = "${module.ergw_label.id}${module.ergw_label.delimiter}${element(keys(var.express_route_config.peering_location), count.index)}${module.ergw_label.delimiter}${element(module.ergw_label.attributes, count.index)}"
  location              = element(values(var.express_route_config.location), count.index)
  resource_group_name   = element(var.resource_group_name, count.index)
  service_provider_name = element(values(var.express_route_config.provider_name), count.index)
  peering_location      = element(values(var.express_route_config.peering_location), count.index)
  bandwidth_in_mbps     = element(values(var.express_route_config.bandwidth_in_mbps), count.index)

  sku {
    tier   = var.express_route_config.tier
    family = var.express_route_config.family
  }

  allow_classic_operations = false

  tags = module.ergw_label.tags
}

# resource "azurerm_express_route_circuit_authorization" "default" {
#   count                      = var.enabled ? length(var.express_route_config.peering_location) : 0
#   name                       = module.ergw_authorisation.id
#   express_route_circuit_name = azurerm_express_route_circuit.default.*.name[count.index]
#   resource_group_name        = element(var.resource_group_name, count.index)
# }

# Callum
# resource "azurerm_express_route_circuit_peering" "default" {
#   peering_type                  = var.peering_type
#   express_route_circuit_name    = azurerm_express_route_circuit.default.name
#   resource_group_name           = var.resource_group_name
#   peer_asn                      = var.peer_asn
#   primary_peer_address_prefix   = var.primary_peer_address_prefix
#   secondary_peer_address_prefix = var.secondary_peer_address_prefix
#   vlan_id                       = var.vlan_id

#   microsoft_peering_config {w
#     advertised_public_prefixes = var.advertised_public_prefixes

# Registry Routing parameter required here https://github.com/terraform-providers/terraform-provider-azurerm/issues/1084

#   }
# }

# No Route Filters in Terraform https://github.com/terraform-providers/terraform-provider-azurerm/issues/1083


