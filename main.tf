# module "vnet" {
#   source = "git::https://github.com/mashbynz/tf-mod-azure-vnet.git?ref=master"
# }


# VPN Gateway

# resource "azurerm_resource_group" "test" {
#   name     = "test"
#   location = "West US"
# }

# resource "azurerm_virtual_network" "test" {
#   name                = "test"
#   location            = "${azurerm_resource_group.test.location}"
#   resource_group_name = "${azurerm_resource_group.test.name}"
#   address_space       = ["10.0.0.0/16"]
# }

# resource "azurerm_subnet" "test" {
#   name                 = "GatewaySubnet"
#   resource_group_name  = "${azurerm_resource_group.test.name}"
#   virtual_network_name = "${azurerm_virtual_network.test.name}"
#   address_prefix       = "10.0.1.0/24"
# }

# resource "azurerm_public_ip" "default" {
#   name                = module.vgw_pip_label.id
#   location            = var.region
#   resource_group_name = module.vnet.rg_name
#   allocation_method   = var.vpngw_allocation_method
# }

# ExpressRoute Gateway

resource "azurerm_public_ip" "default" {
  name                = module.ergw_pip_label.id
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = var.ergw_allocation_method
  sku                 = var.ergw_ip_sku
  tags                = module.ergw_pip_label.tags
}

resource "azurerm_virtual_network_gateway" "default" {
  name                = module.er_label.id
  location            = var.location
  resource_group_name = var.resource_group_name

  type = var.ergw_type

  sku = var.ergw_sku

  ip_configuration {
    name                          = module.ipconfig_label.id
    public_ip_address_id          = azurerm_public_ip.default.id
    private_ip_address_allocation = var.ergw_private_alloc
    subnet_id                     = var.gateway_subnet_id
  }
}

resource "azurerm_express_route_circuit" "default" {
  name                  = module.ergw_label.id
  resource_group_name   = var.resource_group_name
  location              = var.location
  service_provider_name = var.service_provider_name
  peering_location      = var.peering_location
  bandwidth_in_mbps     = var.bandwidth_in_mbps

  sku {
    tier   = var.tier
    family = var.family
  }

  allow_classic_operations = false

  tags = module.ergw_label.tags
}

# resource "azurerm_express_route_circuit_authorization" "LiquidAuth" {
#   name                       = module.ergw_authorisation.id
#   express_route_circuit_name = azurerm_express_route_circuit.default.name
#   resource_group_name        = var.resource_group_name
# }

resource "azurerm_express_route_circuit_peering" "default" {
  peering_type                  = var.peering_type
  express_route_circuit_name    = azurerm_express_route_circuit.default.name
  resource_group_name           = var.resource_group_name
  peer_asn                      = var.peer_asn
  primary_peer_address_prefix   = var.primary_peer_address_prefix
  secondary_peer_address_prefix = var.secondary_peer_address_prefix
  vlan_id                       = var.vlan_id

  microsoft_peering_config {
    advertised_public_prefixes = var.advertised_public_prefixes
  }
}


