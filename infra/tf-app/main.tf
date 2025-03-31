resource "azurerm_resource_group" "app_rg" {
  name     = "phar0053-a12-rg"
  location = "Canada Central"
}

resource "azurerm_virtual_network" "vnet" {
  name                = "phar0053-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.app_rg.location
  resource_group_name = azurerm_resource_group.app_rg.name
}

resource "azurerm_subnet" "subnet" {
  name                 = "phar0053-subnet"
  resource_group_name  = azurerm_resource_group.app_rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

