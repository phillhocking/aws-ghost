variable "name" { type = string }
variable "domain_name" { type = string }

variable "db_host" { type = string }
variable "db_name" { type = string }
variable "db_user" { type = string }
variable "db_pass" { type = string }

variable "key_pair_name" { type = string }
variable "cloudfront_ssl_acm_arn" { type = string }

variable "security_groups" { type = list(string) }
