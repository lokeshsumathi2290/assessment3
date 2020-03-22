module "s3" {
   source                 = "../../modules/s3"

   env                    = "${var.env}"
}

module "route53" {
  source                 = "../../modules/route53"

  hosted_domain_name     = "${var.hosted_domain_name}"
}

module "cloudfront" {
   source                 = "../../modules/cloudfront"

   domain_name            = "${module.s3.bucket_regional_domain_name}"
   origin_id              = "S3-${module.s3.s3_bucket}"
   log_bucket             = "${module.s3.s3_bucket_log}"
   env                    = "${var.env}"
   hosted_domain_name     = "${var.hosted_domain_name}"
   acm_arn                = "${var.acm_arn}"
}

// Add dns entry for cloudfront endpoint
resource "aws_route53_record" "a" {
  zone_id = module.route53.zone_id
  name    = var.hosted_domain_name
  type    = "A"

  alias {
    name                   = module.cloudfront.cloudfront_domain_name
    zone_id                = module.cloudfront.cloudfront_hosted_zone_id
    evaluate_target_health = false
  }
}
