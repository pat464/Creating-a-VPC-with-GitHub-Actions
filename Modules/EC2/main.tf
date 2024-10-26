resource "aws_instance" "web" {
  count = length(var.ec2_names)
  ami           = data.aws_ami.amazon-2.id
  instance_type = "t2.micro"
  associate_public_ip_address = true
  vpc_security_group_ids = [var.ec2_sg_id]
  subnet_id = var.Subnets[count.index]
  availability_zone = data.aws_availability_zones.available.names[count.index]
  #USer Data
  user_data = <<EOF
  #!/bin/bash
  yum update -y
  yum install httpd -y
  systemctl start httpd
  systemctl enable httpd
  echo "<h1>Congrats! Your Instance has been deployed via Terraform</h1>" > /var/www/html/index.html
  EOF
  tags = {
    Name = var.ec2_names[count.index]
  }
}