locals {
  route53_records = ["172.17.208.109", "172.17.208.186"]
}

resource "aws_route53_zone" "zone" {
  name = var.zone_name

  lifecycle {
    ignore_changes = [vpc]
  }

  vpc {
    vpc_id = module.vpc.vpc_id
  }
}

# Create a DNS record for the AWS Directory Service
# in the DPM auth VPC. The DNS servers are Microsoft Server rather than
# Route53, so we cannot associate

resource "aws_route53_record" "directory_service_dns_records" {
  name    = "ldap"
  type    = "A"
  zone_id = aws_route53_zone.zone.id
  ttl     = "300"
  records = local.route53_records
}

