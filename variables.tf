variable "aws_access_id" {
}

variable "aws_secret_key" {
}

variable "aws_region" {
  default = "us-west-2"
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

variable "db_name" {
  default = "ghost"
}

variable "db_user" {
  default = "ghost"
}

variable "db_pass" {
  default = "XENXY9b45$xpZ2"
}

