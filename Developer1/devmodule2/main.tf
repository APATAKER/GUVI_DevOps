provider "aws" {
  region = "us-east-1"
}
resource "aws_instance" "example" {
  ami           = var.ami /* "ami-0ebfd941bbafe70c6" */
  instance_type = "t2.micro"
  key_name      = "KP_Common"

  vpc_security_group_ids = ["sg-0d4e2bbf6bd03efc2"]

  tags = {
    Name = "dev1-instance"
  }
}
