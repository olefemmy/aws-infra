locals {
  service_name = "infrastructure"
  environment  = var.environment
}

locals {
  bucket_name = "${data.aws_iam_account_alias.current.account_alias}-${var.service_name}-lb-access-logs"
}
