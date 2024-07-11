data "aws_iam_policy_document" "load_balancer_access_logs" {
  statement {
    actions = ["s3:PutObject"]

    principals {
      type        = "AWS"
      identifiers = [data.aws_elb_service_account.current.id]
    }

    principals {
      type        = "Service"
      identifiers = ["delivery.logs.amazonaws.com"]
    }

    resources = formatlist(
      "arn:aws:s3:::${local.bucket_name}/%s/AWSLogs/${data.aws_caller_identity.current.account_id}/*",
      var.management_services,
    )
  }
}

