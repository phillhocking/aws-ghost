output "cloudfront-dns" {
  value = module.ghost-blog.cloudfront-dns
}

output "server-ip" {
  value = module.ghost-blog.server-ip
}

output "debug" {
  value = module.ghost-blog.nginx-site-config
}
