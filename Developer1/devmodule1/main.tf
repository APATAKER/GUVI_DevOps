# Provider configuration
provider "aws" {
  region = var.region
}

# EC2 instance
resource "aws_instance" "example" {
  ami           = "ami-0ebfd941bbafe70c6"
  instance_type = "t2.micro"
  key_name      = var.key_name

  vpc_security_group_ids = ["sg-0d4e2bbf6bd03efc2"]

  tags = {
    Name = "dev1-instance"
  }
}

