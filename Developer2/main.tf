locals {
  instances = [for i in range(var.instance_count) : format("%d", i + 1)]
}


# Provider configuration
provider "aws" {
  region = var.region
}

resource "aws_security_group" "instance_sg" {
  for_each = toset(local.instances)

  name        = "instance-sg-${each.key}"
  description = "Security group for EC2 instance ${each.key}"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# EC2 instance
resource "aws_instance" "instance" {
  for_each      = toset(local.instances)
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name

  vpc_security_group_ids = [aws_security_group.instance_sg[each.key].id]

  tags = {
    Name = join(":", ["dynamic", "config", var.instance_name, each.key])
  }
}

