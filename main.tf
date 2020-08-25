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

module "project-prod-gke" {
  source            = "../../modules/gsuite_enabled"
  random_project_id = true
  name              = "hierarchy-sample-prod-gke"
  org_id            = var.organization_id
  billing_account   = var.billing_account
  folder_id         = google_folder.prod.id
  credentials_path  = local.credentials_file_path
}

module "project-factory" {
  source            = "../../modules/gsuite_enabled"
  random_project_id = true
  name              = "hierarchy-sample-factory"
  org_id            = var.organization_id
  billing_account   = var.billing_account
  folder_id         = google_folder.prod.id
  credentials_path  = local.credentials_file_path
}