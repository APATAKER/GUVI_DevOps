terraform {
  backend "s3" {
    bucket = "terraform-raja-state"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}
