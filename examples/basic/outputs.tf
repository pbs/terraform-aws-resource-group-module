output "arn" {
  description = "ARN of the resource group."
  value       = module.resource_group.arn
}

output "name" {
  description = "Name of the resource group."
  value       = module.resource_group.name
}
