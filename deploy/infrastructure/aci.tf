resource "azurerm_container_group" "containergroup" {
  name                = "${local.app}"
  location            = "${azurerm_resource_group.resourcegroup.location}"
  resource_group_name = "${azurerm_resource_group.resourcegroup.name}"
  ip_address_type     = "public"
  dns_name_label      = "${local.app}"
  os_type             = "Linux"

  container {
    name   = "grafana"
    image  = "grafana/grafana:5.4.3"
    cpu    = "0.5"
    memory = "1"

    ports {
      port     = 3000
      protocol = "TCP"
    }
  }

  tags = "${local.common_tags}"
}