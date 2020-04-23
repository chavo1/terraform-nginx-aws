# Configure the Cloudflare provider
provider "cloudflare" {
  email   = var.email
  api_key = var.api_key
}
# Create a record
resource "cloudflare_record" "nginx" {
  zone_id = var.zone_id
  name    = var.nginx_name
  value   = aws_instance.nginx.public_ip
  type    = "A"
  proxied = false
}
