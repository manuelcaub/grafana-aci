resource "azurerm_resource_group" "resourcegroup" {
  name     = "${local.app}"
  location = "${var.AZURE_REGION}"
}