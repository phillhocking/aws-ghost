resource "aws_security_group" "ghost-server" {
  name        = "ghost-server"
  description = "Allow SSH inbound from var.bastion_cidr, all HTTP inbound, and all outbound traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.bastion_cidr]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "ghost-db" {
  name        = "ghost-db"
  description = "Allow SSH inbound, all HTTP inbound, and all outbound traffic"

  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.ghost-server.id]
  }
}

