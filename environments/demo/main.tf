provider "aws" {
  region = var.region
}

module "master" {
   source                 = "../../modules/master"

   env                    = "demo"
   hosted_domain_name     = trimprefix("${aws_acm_certificate.cert.domain_name}", "*.")
   acm_arn                = var.acm_arn

}

provider "aws" {
  alias  = "east"
  region = "us-east-1"
}

resource "aws_acm_certificate" "cert" {
  provider = aws.east
}
