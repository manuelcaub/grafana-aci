locals {
  project     = "${lower(var.PROJECT)}"
  environment = "${lower(var.ENVIRONMENT)}"
  app         = "${local.project}${local.environment}"

  common_tags = {
    environment  = "${local.environment}"
    project      = "${local.project}"
    app          = "${local.app}"
  }
}