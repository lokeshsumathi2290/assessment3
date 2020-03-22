output "S3_bucket_name" {
  value       = "${module.master.S3_bucket_name}"
}

output "Cloudfront_domain_name" {
  value       = "${module.master.Cloudfront_domain_name}"
}

output "Hosted_domain_name" {
  value       = trimprefix("${aws_acm_certificate.cert.domain_name}", "*.")
}
