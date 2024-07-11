resource "aws_s3_bucket_public_access_block" "load_balancer_access_logs" {
  bucket = aws_s3_bucket.load_balancer_access_logs.id

  block_public_acls   = true
  block_public_policy = true
}

