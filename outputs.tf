output "arn" {
  description = "ARN of the resource group."
  value       = aws_resourcegroups_group.group.arn
}

output "name" {
  description = "Name of the resource group."
  value       = aws_resourcegroups_group.group.name
}
