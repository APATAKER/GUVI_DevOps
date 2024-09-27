provider "aws" {
  alias  = "us_east_1"
  region = "us-east-1"
}

provider "aws" {
  alias = "us_west_2"

  region = "us-west-2"
}

resource "aws_instance" "us_east_1_instance" {
  provider      = aws.us_east_1
  ami           = "ami-0ebfd941bbafe70c6" # Amazon Linux
  instance_type = "t2.micro"              # Instance type
  tags = {
    Name = "us-east-1-instance"
  }
}

resource "aws_instance" "us_west_2_instance" {
  provider      = aws.us_west_2
  ami           = "ami-05134c8ef96964280" # Ubuntu
  instance_type = "t2.micro"              # Instance type
  tags = {
    Name = "us-west-2-instance"
  }
}
