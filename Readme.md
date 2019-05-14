# Create a Grafana with persistent data using Azure Container Instances

## Deployment

To deploy this template simply add a backend.cfg file and a terraform.tfvars as follows:

``` ini
# backend.cfg
storage_account_name="replace_with_storage_account_name"
container_name="replace_with_container_name"
access_key="replace_with_storage_access_key"
```

``` ini
# terraform.tfvars
PROJECT="your_project_name"
ENVIRONMENT="your_environment_name"
AZURE_SUBSCRIPTION_ID="your_subscription_id"
AZURE_CLIENT_ID="your_client_id"
AZURE_CLIENT_SECRET="your_client_secret"
AZURE_TENANT_ID="your_tenant_id"
```

Finally, initialize terraform and apply the infrastructure

``` bash
terraform init -backend-config=backend.cfg
terraform apply
```