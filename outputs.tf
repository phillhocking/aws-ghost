output "cloudfront-dns" {
  value = module.ghost-lightsail.cloudfront-dns
}

output "server-ip" {
  value = module.ghost-lightsail.server-ip
}
