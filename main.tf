
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



