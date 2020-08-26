terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "prathyushkk"

    workspaces {
      name = "project-factory"
    }
  }
}