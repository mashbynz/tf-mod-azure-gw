
module "vnet" {
  source = "git::https://github.com/mashbynz/tf-mod-azure-vnet.git?ref=master"
}


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

resource "azurerm_public_ip" "default" {
  name     = module.vgw_pip_label.id
  location = var.region
  #   resource_group_name = "prod-sharedservices-rg"
  resource_group_name = module.vnet.ss_rg_name
  allocation_method   = var.vpngw_allocation_method
}

# resource "azurerm_virtual_network_gateway" "default" {
#   name                = module.vpn_gateway_label.id
#   location            = var.region
#   resource_group_name = azurerm_public_ip.default.resource_group_name

#   type     = "Vpn"
#   vpn_type = "RouteBased"

#   active_active = false
#   enable_bgp    = false
#   sku           = "Basic"

#   ip_configuration {
#     name                          = "vnetGatewayConfig"
#     public_ip_address_id          = "${azurerm_public_ip.test.id}"
#     private_ip_address_allocation = "Dynamic"
#     subnet_id                     = "${azurerm_subnet.test.id}"
#   }

#   vpn_client_configuration {
#     address_space = ["10.2.0.0/24"]

#   }
# }

# ExpressRoute Gateway



