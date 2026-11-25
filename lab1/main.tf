terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {
  host = var.docker_host
}

module "app" {
  source = "./modules/docker_app"

  image_name      = var.image_name
  memory          = var.memory
  privileged      = var.privileged
  container_count = var.container_count
  name_prefix     = var.name_prefix
  start_port      = var.start_port
}

# Conserve les ressources déjà créées dans le state (évite destroy/recreate)
moved {
  from = docker_image.nginx
  to   = module.app.docker_image.nginx
}

moved {
  from = docker_container.web
  to   = module.app.docker_container.web
}
