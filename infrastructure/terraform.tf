terraform {
  backend "s3" {
    bucket = "test-590183840400-terraform-state"
    key    = "bolaji/sit/aws-infra/infrastructure/terraform.tfstate"
    region = "eu-west-1"
    acl    = "bucket-owner-full-control"
  }
}
