
variable "key_name" {
  description = "The key pair name for the EC2 instance"
  type        = string
}
variable "region" {
  description = "The AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}
variable "ami_id" {
  description = "The AMI ID for the EC2 instance"
  default     = "ami-0ebfd941bbafe70c6"
  type        = string
}

variable "instance_type" {
  description = "The instance type for the EC2 instance"
  type        = string
  default     = "t2.micro"
}

variable "instance_name" {
  description = "Base name for EC2 instances"
  default     = "raja"
}
variable "instance_count" {
  description = "Number of instances to create"
  default     = 3
}
