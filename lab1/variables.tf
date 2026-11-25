variable "docker_host" {
  type        = string
  description = "Socket du daemon Docker"
  default     = "unix:///Users/olivierrecher/.docker/run/docker.sock"
}

variable "image_name" {
  type    = string
  default = "nginx:latest"
}

variable "memory" {
  type        = number
  description = "Mémoire par conteneur, en Mo"
  default     = 256
}

variable "privileged" {
  type        = bool
  description = "Lancer les conteneurs en mode privilégié"
  default     = false
}

variable "container_count" {
  type        = number
  description = "Nombre de conteneurs à créer"
  default     = 3
}

variable "name_prefix" {
  type        = string
  description = "Préfixe des noms de conteneurs"
  default     = "web"
}

variable "start_port" {
  type        = number
  description = "Port externe du premier conteneur"
  default     = 3000
}
