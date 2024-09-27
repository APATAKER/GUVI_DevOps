# Variables for AMI and Instance Type 
variable "instance_type" {
  default = "t2.micro"
}

variable "ami_us_east_1" {
  default = "ami-0ebfd941bbafe70c6" //Amazon Linux 2023
}

variable "ami_us_west_2" {
  default = "ami-05134c8ef96964280" //Ubuntu 24.0 LTS
}
