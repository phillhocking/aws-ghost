output "cloudfront-dns" { value = aws_cloudfront_distribution.ghost-blog.domain_name }
output "server-ip" { value = aws_instance.ghost.public_ip }
output "nginx-site-config" {
  value = data.template_file.nginx-site-config.rendered
}
