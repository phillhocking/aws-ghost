resource "aws_lightsail_instance" "ghost-dev" {
  name              = var.name
  availability_zone = var.aws_availability_zone
  blueprint_id      = "ghost_bitnami"
  bundle_id         = "nano_2_0"
  key_pair_name     = var.key_pair_name
  tags = {
    env = "dev"
  }
}

resource "aws_lightsail_static_ip" "dev_static_ip" {
  name = "dev_static_ip" 
}

resource "aws_lightsail_static_ip_attachment" "static_ip_attach" {
  static_ip_name = aws_lightsail_static_ip.dev_static_ip.id
  instance_name  = aws_lightsail_instance.ghost-dev.id
}

## Creates a new Route53 Public Hosted Zone. Comment out for existing zone.
resource "aws_route53_zone" "lightsail_dev_zone" {
name = var.domain_name 
}

resource "aws_route53_record" "red_no_www" {
  zone_id = aws_route53_zone.lightsail_dev_zone.zone_id 
  name    = aws_route53_zone.lightsail_dev_zone.name    
  type    = "A"
  ttl     = "300"
  records = [aws_lightsail_static_ip.dev_static_ip.ip_address]
}
