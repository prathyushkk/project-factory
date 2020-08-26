variable "admin_email" {
  description = "Admin user email on Gsuite"
}

variable "organization_id" {
  description = "The organization id for the associated services"
}

variable "billing_account" {
  description = "The ID of the billing account to associate this project with"
}

variable "credentials_path" {
  description = "Path to a service account credentials file with rights to run the Project Factory. If this file is absent Terraform will fall back to Application Default Credentials."
  default     = ""
}

variable "terraform_workspace" {
  description = "Provide the workspace of Terraform"
}