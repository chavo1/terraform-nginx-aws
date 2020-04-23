resource "aws_instance" "nginx" {
  ami           = "ami-07ebfd5b3428b6f4d"
  instance_type = "t2.micro"
  key_name      = aws_key_pair.chavo.id
  subnet_id     = "subnet-ef814da2"

  root_block_device {
    volume_size = "40"
    volume_type = "gp2"
  }

  tags = {
    Name  = "chavo-nginx"
  }

  connection {
    user        = "ubuntu"
    private_key = file("~/.ssh/id_rsa")
    host        = self.public_ip
  }

  provisioner "file" {
    source      = "scripts/provision.sh"
    destination = "/tmp/provision.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo bash /tmp/provision.sh",
    ]
  }
}
