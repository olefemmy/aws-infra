resource "aws_s3_bucket" "s3_access_logs" {
  bucket = "${data.aws_iam_account_alias.current.account_alias}-${var.service_name}-s3-access-logs"
}

resource "aws_s3_bucket_versioning" "s3_access_logs" {
  bucket = aws_s3_bucket.s3_access_logs.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "s3_access_logs" {
  bucket = aws_s3_bucket.s3_access_logs.id

  rule {
    id = "s3_access_logs"

    transition {
      days          = "30"
      storage_class = "INTELLIGENT_TIERING"
    }

    noncurrent_version_expiration {
      noncurrent_days = 1
    }
    status = "Enabled"
  }
}

resource "aws_s3_bucket_logging" "s3_access_logs" {
  bucket = aws_s3_bucket.s3_access_logs.id

  target_bucket = "${data.aws_iam_account_alias.current.account_alias}-${var.service_name}-s3-access-logs"
  target_prefix = "${data.aws_iam_account_alias.current.account_alias}-${var.service_name}-s3-access-logs/"
}

resource "aws_s3_bucket_acl" "s3_access_logs" {
  bucket     = aws_s3_bucket.s3_access_logs.id
  acl        = "log-delivery-write"
  depends_on = [aws_s3_bucket_ownership_controls.s3_access_logs_ownership_controls_config_bucket]
}

resource "aws_s3_bucket" "load_balancer_access_logs" {
  bucket = local.bucket_name

  tags = {
    Environment = var.service_name
  }
}

resource "aws_s3_bucket_ownership_controls" "s3_access_logs_ownership_controls_config_bucket" {
  bucket = aws_s3_bucket.s3_access_logs.id

  rule {
    object_ownership = "ObjectWriter"
  }
}

resource "aws_s3_bucket_versioning" "load_balancer_access_logs" {
  bucket = aws_s3_bucket.load_balancer_access_logs.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "load_balancer_access_logs" {
  bucket = aws_s3_bucket.load_balancer_access_logs.id

  rule {
    id = "load_balancer_access_logs"

    transition {
      days          = "30"
      storage_class = "INTELLIGENT_TIERING"
    }

    noncurrent_version_expiration {

      noncurrent_days = 1
    }
    status = "Enabled"
  }
}

resource "aws_s3_bucket_logging" "load_balancer_access_logs" {
  bucket = aws_s3_bucket.load_balancer_access_logs.id

  target_bucket = aws_s3_bucket.s3_access_logs.id
  target_prefix = "${local.bucket_name}/"
}

resource "aws_s3_bucket_acl" "load_balancer_access_logs" {
  bucket     = aws_s3_bucket.load_balancer_access_logs.id
  acl        = "private"
  depends_on = [aws_s3_bucket_ownership_controls.lb_access_logs_ownership_controls_config_bucket]
}

resource "aws_s3_bucket_policy" "load_balancer_access_logs" {
  bucket = aws_s3_bucket.load_balancer_access_logs.id
  policy = data.aws_iam_policy_document.load_balancer_access_logs.json
}

resource "aws_s3_bucket_ownership_controls" "lb_access_logs_ownership_controls_config_bucket" {
  bucket = aws_s3_bucket.load_balancer_access_logs.id

  rule {
    object_ownership = "ObjectWriter"
  }
}
