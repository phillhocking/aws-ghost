locals {
  server_domain_name = var.domain_name
}

resource "aws_instance" "ghost" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "t4g.nano"
  vpc_security_group_ids = var.security_groups
  key_name               = var.key_pair_name

  tags = {
    Name = "ghost-server-dev"
  }

  lifecycle {
    ignore_changes = [ami]
  }

  root_block_device {
    volume_type           = "gp2"
    volume_size           = "50"
    delete_on_termination = false
  }
  
  user_data_base64       = base64encode(templatefile("${path.module}/cloudinit.yml",
    {
      config = {
        ghost-config-rendered = templatefile("${path.module}/configs/config.production.json.tpl", {
  
          vars = {
            mysql-host    = var.db_host
            mysql-db-name = var.db_name
            mysql-user    = var.db_user
            mysql-pass    = var.db_pass
            domain-name   = local.server_domain_name
          }
        }
      )    
        nginx-site-config = templatefile("${path.module}/configs/nginx-site.tpl", {

          vars = {
            domain-name = local.server_domain_name
            }
          }
        )
        service-config-rendered = file("${path.module}/configs/ghost.service.tpl")
        }
      }
    )
  )  
}