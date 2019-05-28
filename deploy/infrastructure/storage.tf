resource "azurerm_storage_account" "pvstorage" {
  name                     = "${local.app}"
  resource_group_name      = "${azurerm_resource_group.resourcegroup.name}"
  location                 = "${azurerm_resource_group.resourcegroup.location}"
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind = "StorageV2"
  access_tier = "Hot"

  enable_blob_encryption = true
  enable_file_encryption = true
  enable_https_traffic_only = true

  tags = "${local.common_tags}"
}

resource "azurerm_storage_share" "mysql" {
  name                 = "mysqlshare"
  resource_group_name  = "${azurerm_resource_group.resourcegroup.name}"
  storage_account_name = "${azurerm_storage_account.pvstorage.name}"
  quota                = "${var.STORAGE_SHARE_QUOTA_MYSQL}"
}

resource "azurerm_storage_share" "provisioning" {
  name                 = "provisioningshare"
  resource_group_name  = "${azurerm_resource_group.resourcegroup.name}"
  storage_account_name = "${azurerm_storage_account.pvstorage.name}"
  quota                = "${var.STORAGE_SHARE_QUOTA_PROVISIONING}"
}