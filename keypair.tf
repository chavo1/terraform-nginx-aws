# Public to allow logging-in to EC2 instances.
resource "aws_key_pair" "chavo" {
  key_name   = "chavo_nginx"
  public_key = file("~/.ssh/id_rsa.pub")
}
