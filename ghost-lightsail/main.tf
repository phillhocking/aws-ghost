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

## Points to your existing Route 53 public hosted zone. Comment this block if you are creating a new Public Hosted Zone
#data "aws_route53_zone" "hosted_zone" {
#  name = "${var.domain_name}." 
#}

resource "aws_route53_record" "red_no_www" {
  zone_id = aws_route53_zone.lightsail_dev_zone.zone_id        ## Delete prepending "data." if you are creating a new hosted zone
  name    = "${aws_route53_zone.lightsail_dev_zone.name}."     ## Delete prepending "data." if you are creating a new hosted zone
  type    = "A"

  alias {
    name                    = aws_cloudfront_distribution.ghost-lightsail.domain_name
    zone_id                 = aws_cloudfront_distribution.ghost-lightsail.hosted_zone_id 
    evaluate_target_health  = false
  }
}
