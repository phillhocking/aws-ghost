terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.30.0"
    }
  }
}

provider "aws" {
  region     = var.aws_region
  access_key = var.aws_access_id
  secret_key = var.aws_secret_key
}

provider "aws" {
  alias      = "root"
  region     = var.aws_region
  access_key = var.aws_access_id
  secret_key = var.aws_secret_key
}

module "ghost-db" {
  source          = "./ghost-database"
  name            = "./ghost-db"
  db_name         = var.db_name
  db_user         = var.db_user
  db_pass         = var.db_pass
  security_groups = [aws_security_group.ghost-db.id]
  providers = {
    aws = aws.root
  }
}

# Set up the Ghost Server
module "ghost-blog" {
  source                 = "./ghost-server"
  name                   = "./ghost-server"
  domain_name            = var.domain_name
  db_host                = module.ghost-db.db-host
  db_name                = module.ghost-db.db-name
  db_user                = module.ghost-db.db-user
  db_pass                = module.ghost-db.db-pass
  key_pair_name          = var.key_pair_name
  security_groups        = [aws_security_group.ghost-server.id]
  cloudfront_ssl_acm_arn = var.cloudfront_ssl_acm_arn
  providers = {
    aws = aws.root
  }
}

resource "null_resource" "terraform-github-actions" {
  triggers = {
    value = "Terraform validation and lint check via Github Actions."
  }
}
