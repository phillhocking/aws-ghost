output "cloudfront-dns" { value = aws_cloudfront_distribution.ghost-lightsail.domain_name }
output "server-ip" { value = aws_lightsail_instance.ghost-dev.public_ip_address }

