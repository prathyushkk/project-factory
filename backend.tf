terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "WooliesX"

    workspaces {
      name = var.terraform_workspace
    }
  }
}