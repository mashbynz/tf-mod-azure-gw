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

# resource "azurerm_virtual_network_gateway" "default" {
#   name                = module.vgw_label.id
#   location            = var.region
#   resource_group_name = azurerm_public_ip.default.resource_group_name

#   type     = var.vpngw_type
#   vpn_type = var.vpngw_vpn_type

#   active_active = false
#   enable_bgp    = false
#   sku           = var.vpngw_sku

#   ip_configuration {
#     name                          = module.ipconfig_label.id
#     public_ip_address_id          = azurerm_public_ip.default.id
#     private_ip_address_allocation = var.vpngw_private_alloc
#     subnet_id                     = module.vnet.gateway_subnet_id
#   }

#   vpn_client_configuration {
#     address_space = var.vpngw_client_address

#   }
# }

# ExpressRoute Gateway

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

resource "azurerm_express_route_circuit_authorization" "LiquidAuth" {
  name                       = module.ergw_authorisation.id
  express_route_circuit_name = azurerm_express_route_circuit.default.name
  resource_group_name        = var.resource_group_name
}

# resource "azurerm_express_route_circuit_peering" "test" {
#   peering_type                  = "MicrosoftPeering" ##
#   express_route_circuit_name    = "${azurerm_express_route_circuit.test.name}"
#   resource_group_name           = "${azurerm_resource_group.test.name}"
#   peer_asn                      = 100
#   primary_peer_address_prefix   = "123.0.0.0/30"
#   secondary_peer_address_prefix = "123.0.0.4/30"
#   vlan_id                       = 300

#   microsoft_peering_config {
#     advertised_public_prefixes = ["123.1.0.0/24"]
#   }
# }


