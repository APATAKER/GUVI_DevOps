# Provider configuration
provider "aws" {
  region = var.region
}

# EC2 instance
resource "aws_instance" "example" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name

  vpc_security_group_ids = ["sg-0d4e2bbf6bd03efc2"]

  tags = {
    Name = "task-instance"
  }
}

