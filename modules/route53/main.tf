resource "aws_route53_zone" "primary" {
  name = var.hosted_domain_name
}
