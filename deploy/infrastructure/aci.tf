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

    environment_variables {
      GF_DATABASE_TYPE      = "mysql"
      GF_DATABASE_HOST      = "127.0.0.1:3306"
      GF_DATABASE_NAME      = "grafana"
      GF_DATABASE_USER      = "root"
      GF_DATABASE_PASSWORD  = "P2__w0rd"
    }
  }

  container {
    name   = "db"
    image  = "mysql:5.7"
    cpu    = "0.5"
    memory = "1"

    environment_variables {
      MYSQL_DATABASE      = "grafana"
      MYSQL_ROOT_PASSWORD = "P2__w0rd"
    }
  }

  tags = "${local.common_tags}"
}