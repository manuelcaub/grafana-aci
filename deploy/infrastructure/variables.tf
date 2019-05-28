variable "PROJECT" {
  description = "The prefix applied to all resource names."
}

variable "ENVIRONMENT" {
  description = "The environment name."
}

variable "AZURE_SUBSCRIPTION_ID" {
  description = "The Azure subscription ID."
}

variable "AZURE_CLIENT_ID" {
  description = "The Azure Service Principal app ID."
}

variable "AZURE_CLIENT_SECRET" {
  description = "The Azure Service Principal password."
}

variable "AZURE_TENANT_ID" {
  description = "The Azure Tenant ID."
}

variable "AZURE_REGION" {
  description = "The Azure region to create things in."
  default     = "West Europe"
}

variable "STORAGE_SHARE_QUOTA_MYSQL" {
  description = "The storage file share quota for MySQL"
  default     = 5
}

variable "STORAGE_SHARE_QUOTA_PROVISIONING" {
  description = "The storage file share quota for provisioning Grafana"
  default     = 5
}