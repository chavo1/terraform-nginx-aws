output "public_ip_nginx" {
  value = aws_instance.nginx.*.public_ip
}
output "public_dns_nginx" {
  value = aws_instance.nginx.*.public_dns
}
output "hostname_nginx" {
  value = cloudflare_record.nginx.*.hostname
}
