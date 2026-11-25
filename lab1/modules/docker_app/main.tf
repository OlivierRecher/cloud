terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

# 1. Image (télécharge nginx)
resource "docker_image" "nginx" {
  name         = var.image_name
  keep_locally = false # supprime l'image au destroy
}

# 2. Conteneurs
resource "docker_container" "web" {
  count = var.container_count

  name       = "${var.name_prefix}-${count.index}"
  image      = docker_image.nginx.image_id
  memory     = var.memory
  privileged = var.privileged

  ports {
    internal = 80
    external = var.start_port + count.index
  }
}
