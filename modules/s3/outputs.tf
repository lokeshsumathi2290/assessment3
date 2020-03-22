output "s3_bucket" {
  value       = "${aws_s3_bucket.that.bucket}"
}

output "bucket_regional_domain_name" {
  value       = "${aws_s3_bucket.that.bucket_regional_domain_name}"
}

output "s3_bucket_log" {
  value       = "${aws_s3_bucket.distribution.bucket}"
}
