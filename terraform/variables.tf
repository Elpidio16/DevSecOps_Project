variable "kubeconfig_path" {
  description = "Chemin du fichier kubeconfig pour accéder au cluster Kubernetes"
  type        = string
  default     = "~/.kube/config"
}

variable "docker_image" {
  description = "Nom complet de l'image Docker à déployer"
  type        = string
}

variable "app_name" {
  description = "Nom de l'application"
  type        = string
  default     = "dvwa"
}

variable "replicas" {
  description = "Nombre de réplicas du déploiement"
  type        = number
  default     = 2
}

variable "cpu_limit" {
  description = "Limite de CPU par conteneur"
  type        = string
  default     = "500m"
}

variable "memory_limit" {
  description = "Limite de mémoire par conteneur"
  type        = string
  default     = "256Mi"
}

variable "node_port" {
  description = "Port NodePort exposé pour le service"
  type        = number
  default     = 30000
}
