output "cloudfront-dns" { value = aws_cloudfront_distribution.ghost-lightsail.domain_name }
output "backend-server-info" { value = aws_lightsail_static_ip.dev_static_ip }

