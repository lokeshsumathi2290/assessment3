output "S3_bucket_name" {
  value       = "${module.s3.s3_bucket}"
}

output "Cloudfront_domain_name" {
  value       = "${module.cloudfront.cloudfront_domain_name}"
}
