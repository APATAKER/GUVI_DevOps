provider "aws" {
  alias  = "us_east_1"
  region = "us-east-1"
}

provider "aws" {
  alias  = "us_west_2"
  region = "us-west-2"
}

# EC2 Instance in us-east-1
resource "aws_instance" "us_east_1_instance" {
  provider      = aws.us_east_1
  ami           = var.ami_us_east_1
  instance_type = var.instance_type

  # User data script to install Nginx on the instance
  user_data = <<-EOF
              #!/bin/bash
              sudo dnf search nginx
              sudo dnf install nginx -y
              sudo systemctl start nginx
              sudo systemctl enable nginx
            EOF

  tags = {
    Name = "us-east-1-nginx-instance"
  }

  # Security Group for allowing HTTP traffic
  vpc_security_group_ids = [aws_security_group.us_east_1_sg.id]
}

# EC2 Instance in us-west-2
resource "aws_instance" "us_west_2_instance" {
  provider      = aws.us_west_2
  ami           = var.ami_us_west_2
  instance_type = var.instance_type

  # User data script to install Nginx on the instance
  user_data = <<-EOF
              #!/bin/bash
              sudo apt-get update
              sudo apt-get install -y nginx
              sudo systemctl start nginx
              sudo systemctl enable nginx
            EOF

  tags = {
    Name = "us-west-2-nginx-instance"
  }

  # Security Group for allowing HTTP traffic
  vpc_security_group_ids = [aws_security_group.us_west_2_sg.id]
}

# Security Group for us-east-1 to allow HTTP (port 80) and SSH (port 22)
resource "aws_security_group" "us_east_1_sg" {
  provider = aws.us_east_1
  name     = "us-east-1-nginx-sg"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allow HTTP traffic from any IP
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allow SSH traffic from any IP
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Security Group for us-west-2 to allow HTTP (port 80) and SSH (port 22)
resource "aws_security_group" "us_west_2_sg" {
  provider = aws.us_west_2
  name     = "us-west-2-nginx-sg"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allow HTTP traffic from any IP
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allow SSH traffic from any IP
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

