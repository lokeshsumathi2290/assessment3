# Assessment3
Terraform module to distribute static content

## Getting Started
These instructions will help you create all required resources in AWS for distribution of static contents.

### Prerequisites
* Terraform version v0.12.23 or above
* AWS ACM certificate ARN
    * The domain name in this cert will be used to create the hosted zone and will be pointed to Cloudfront distribution
    * The domain name will be added as alias to Cloudfront distribution
* AWS credentials with enough access to read, write and destroy S3, Route53, Cloudfront and ACM services.
```
cat .aws/credentials

[default]
aws_access_key_id = XXXXXXXXXXXXX
aws_secret_access_key = XXXXXXXXXXXXXXXXXXXXXXXX
```
### Apply terraform modules
* After cloning the repo navigate here
```
cd assessment3/environments/demo
```

* Fill in the required values in file "assessment3/environments/demo/vars.tf"
```
variable "acm_arn" {
  default = "arn:aws:acm:us-east-1:XXXXXXXXXXXXX:certificate/XXXXXXXXXXXXXXXXXXXXXXXX"
}

variable "region" {
  default = "eu-west-1"
}
```
* Initialize terraform
```
terraform init
```

* Import ACM certificate state
```
terraform import aws_acm_certificate.cert arn:aws:acm:us-east-1:XXXXXXXXXXXXX:certificate/XXXXXXXXXXXXXXXXXXXXXXXX
```

* Dry run
```
terraform plan
```

* Apply changes
```
terraform apply
```

* To remove changes
```
terraform destroy
```
