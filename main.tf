locals {
  credentials_file_path = var.credentials_path
}

provider "google" {
  credentials = file(local.credentials_file_path)
  version     = "~> 3.30"
}

provider "google-beta" {
  credentials = file(local.credentials_file_path)
  version     = "~> 3.30"
}

provider "gsuite" {
  credentials             = file(local.credentials_file_path)
  impersonated_user_email = var.admin_email

  oauth_scopes = [
    "https://www.googleapis.com/auth/admin.directory.group",
    "https://www.googleapis.com/auth/admin.directory.group.member",
  ]

  version = "~> 0.1.12"
}

provider "null" {
  version = "~> 2.1"
}

provider "random" {
  version = "~> 2.2"
}

resource "google_folder" "prod" {
  display_name = "gcp-prod"
  parent       = "organizations/${var.organization_id}"
}

module "etl" {
  source  = "terraform-google-modules/project-factory/google"
  version = "9.0.0"
  org_id            = var.organization_id
  random_project_id = true
  name              = "etl"
  auto_create_network = false
  billing_account   = var.billing_account
  folder_id         = google_folder.prod.id
  credentials_path  = local.credentials_file_path
  default_service_account = keep
}

module "api" {
  source  = "terraform-google-modules/project-factory/google"
  version = "9.0.0"
  org_id            = var.organization_id
  random_project_id = true
  name              = "api"
  auto_create_network = false
  billing_account   = var.billing_account
  folder_id         = google_folder.prod.id
  credentials_path  = local.credentials_file_path
  default_service_account = keep
}