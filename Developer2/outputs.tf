
output "instance_names" {
  value = {
    for k, v in aws_instance.instance : k => v.tags.Name
  }
}

output "security_groups" {
  value = {
    for k, v in aws_security_group.instance_sg : k => v.name
  }
}
