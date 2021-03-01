data "template_file" "deploy" {
  template = file("ghost-server/cloudinit.yml")
}

resource "aws_instance" "ghost" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "t2.nano"
  vpc_security_group_ids = var.security_groups

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
}