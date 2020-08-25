output "domain_example" {
  value       = module.data.domain
  description = "The organization's domain"
}

output "project_info_example" {
  value       = module.project-prod-gke.project_id
  description = "The ID of the created prod_gke project"
}

output "project_info_factory_example" {
  value       = module.project-factory.project_id
  description = "The ID of the created factory project"
}