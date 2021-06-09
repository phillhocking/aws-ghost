variable "aws_access_id" {
}

variable "aws_secret_key" {
}

variable "aws_region" {
  default = "us-west-2"
}

variable "aws_availability_zone" {
  default = "us-west-2b"
}
variable "key_pair_name" {
  default = "terraform"
}

# This ACM certificate MUST be in us-east-1
variable "cloudfront_ssl_acm_arn" {
}

# This value should be the A record you set for the Cloudfront CDN origin to resolve without 
# trying to use Terraform to hack together a hostname from the IP address, enabling
# VPC peering, or relying upon only us-east-1 having the `aws_lightsail_domain` 
# resource as AWS has this limited by region
# 
# Obviously this is hacky and a chicken-egg problem that I don't know how to solve - pull 
# requests are welcome.

variable "glue_record" {
}

# Domain for deployment
variable "domain_name" {
  default = "phillhocking.com"
}

# Bastion/jumpbox CIDR range with /32 expected for the default security group
variable "bastion_cidr" {
}