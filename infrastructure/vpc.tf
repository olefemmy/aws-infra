module "vpc" {
  source                  = "../module/aws-vpc"
  environment             = var.environment
  service_name            = var.service_name
  vpc_cidr_block          = var.vpc_cidr_block
  az_limit                = var.az_limit
  delete_default_sg_rules = 1
  enable_flow_log         = 1

  tags = {
    Service = "infrastructure"
  }
}
