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

variable "vpc_cidr_block" {
  description = "The CIDR block which has been allocated to this VPC"
  default     = "172.16.0.0/16"
}

variable "auto_accept" {
  description = "Should we auto accept conenctions?"
  default     = "true"
}

variable "az_limit" {
  description = "The number of availability zones to use"
  default     = 3
}

variable "zone_name" {
  description = "The name of the internal zone"
  default     = "digital.internal"
}

variable "force_destroy" {
  description = "Should we destroy the zone when the VPC is destroyed"
  default     = true
}

variable "local_peer" {
  description = "Is the peer local (same account)?"
  default     = true
}

variable "management_services" {
  description = "The list of management services that will be writing their logs to this bucket"
  type        = list(string)

  default = [
    "athena",
    "jenkins",
    "jenkins-nlb",
    "jenkins-agent",
    "jenkins-ecs",
    "jenkins-fargate",
    "sonarqube",
  ]
}
