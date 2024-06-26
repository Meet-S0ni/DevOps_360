# Terraform code for aws resources 

resource "aws_vpc" "main-vpc" {
  cidr_block = var.cidr_block

  tags = {
    Name = "main-vpc"
  }
}

resource "aws_internet_gateway" "main-ig" {
  vpc_id = aws_vpc.main-vpc.id

  tags = {
    Name = "main-ig"
  }
}

resource "aws_route_table" "main-rt" {
  vpc_id = aws_vpc.main-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main-ig.id
  }

  route {
    ipv6_cidr_block = "::/0"
    gateway_id      = aws_internet_gateway.main-ig.id
  }

  tags = {
    Name = "main-rt"
  }
}

resource "aws_subnet" "main-subnet" {
  vpc_id            = aws_vpc.main-vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "ap-south-1a"

  tags = {
    Name = "main-subnet"
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.main-subnet.id
  route_table_id = aws_route_table.main-rt.id

}

resource "aws_security_group" "allow_web" {
  name        = "allow_web_traffic"
  description = "Allow web inbound traffic"
  vpc_id      = aws_vpc.main-vpc.id

  ingress {
    description = "HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Node App"
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_web_traffic"
  }
}

resource "aws_network_interface" "web_server_nic" {
  subnet_id       = aws_subnet.main-subnet.id
  private_ips     = [var.private_ips]
  security_groups = [aws_security_group.allow_web.id]

  tags = {
    Name = "web-nic"
  }
}

resource "aws_eip" "web-eip" {
  domain                    = "vpc"
  network_interface         = aws_network_interface.web_server_nic.id
  associate_with_private_ip = var.private_ips
  depends_on                = [aws_internet_gateway.main-ig, aws_instance.web-server-instance]

  tags = {
    Name = "web-eip"
  }
}

resource "aws_instance" "web-server-instance" {
  ami                         = var.instance_image
  instance_type               = var.instance_type
  availability_zone           = var.availability_zone
  key_name                    = module.key_pair.key_pair_name

  network_interface {
    device_index         = 0 # eth0
    network_interface_id = aws_network_interface.web_server_nic.id
  }

  user_data = <<-EOF
              #!/bin/bash
              sudo 
              sudo yum install nginx -y
              sudo systemctl start nginx
              sudo systemctl enable nginx
              sudo bash -c 'echo Success fully installed everything > /var/www/html/index.html'
              nginx -v
              curl localhost
              EOF
  tags = {
    Name = "web-server"
  }

  depends_on = [module.key_pair]
}


