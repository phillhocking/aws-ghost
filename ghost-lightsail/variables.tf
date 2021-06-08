variable "name" { type = string }
variable "aws_availability_zone" { type = string }
variable "domain_name" { type = string }
variable "key_pair_name" { type = string }
variable "cloudfront_ssl_acm_arn" { type = string }
variable "security_groups" { type = list(string) }
