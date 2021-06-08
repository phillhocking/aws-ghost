terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.44.0"
    }
  }
}

provider "aws" {
  region     = var.aws_region
  access_key = var.aws_access_id
  secret_key = var.aws_secret_key
}

module "ghost-lightsail" {
  source                 = "./ghost-lightsail"
  name                   = "ghost-lightsail-dev"
  aws_availability_zone  = var.aws_availability_zone
  domain_name            = var.domain_name
  key_pair_name          = var.key_pair_name
  security_groups        = [aws_security_group.ghost-lightsail.id]
  cloudfront_ssl_acm_arn = var.cloudfront_ssl_acm_arn
}

resource "null_resource" "terraform-github-actions" {
  triggers = {
    value = "Terraform validation and lint check via Github Actions."
  }
}
