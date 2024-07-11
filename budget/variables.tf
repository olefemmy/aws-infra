##################################################################################################################
#                                                                                                                #
# Variables define the parameterization of Terraform configurations. Variables can be overridden via the CLI.    #
#                                                                                                                #
# Further reading: https://www.terraform.io/docs/configuration/variables.html                                    #
#                                                                                                                #
##################################################################################################################
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

variable "environment" {
  description = "Environment name"
  default     = "test"
}

variable "service_name" {
  description = "Name of project or service that this VPC infrastructure relates to."
  default     = "management"
}
