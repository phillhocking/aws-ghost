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

# Ghost Config
variable "domain_name" {
  default = "phillhocking.com"
}

variable "bastion_cidr" {
}