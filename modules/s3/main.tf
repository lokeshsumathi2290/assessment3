provider "random" {}

resource "random_string" "random" {
  length = 16
  special = false
  min_lower = 16
}

resource "aws_s3_bucket" "that" {
  bucket = "${var.env}-${random_string.random.result}"
  acl    = "private"

  tags = {
    Name        = "Static Content"
    Environment = "${var.env}"
  }
}

resource "aws_s3_bucket_object" "object" {
  bucket = aws_s3_bucket.that.bucket
  key    = "index.html"
  content = "Hello world"
  content_type = "text/plain"
  acl = "public-read"
}

resource "aws_s3_bucket" "distribution" {
  bucket = "cloudfront-distribution-log-${random_string.random.result}"
  acl    = "private"

  tags = {
    Name        = "Cloudfront distribution logs"
    Environment = "${var.env}"
  }
}
