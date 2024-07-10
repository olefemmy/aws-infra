variable "aws_account_id" {
  description = "AWS account id of the account that will be deployed to"
  type        = string
  default     = "590183840400"
}

variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "eu-west-1"
}

variable "aws_access_key_id" {
  description = "AWS ACCESS KEY"
  type        = string
}

variable "aws_secret_access_key" {
  description = "AWS SECRET KEY"
  type        = string
}
