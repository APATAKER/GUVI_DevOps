output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.example.id
}

output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.example.public_ip
}

output "s3_bucket_name" {
  description = "Name of the S3 bucket for Terraform state"
  value       = var.state_bucket_name
}

