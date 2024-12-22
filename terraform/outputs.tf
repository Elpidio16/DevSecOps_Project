output "deployment_name" {
  description = "Nom du déploiement Kubernetes"
  value       = kubernetes_deployment.dvwa.metadata[0].name
}

output "service_name" {
  description = "Nom du service Kubernetes exposé"
  value       = kubernetes_service.dvwa.metadata[0].name
}

output "service_port" {
  description = "Port exposé par le service Kubernetes"
  value       = kubernetes_service.dvwa.spec[0].ports[0].node_port
}

output "app_url" {
  description = "URL pour accéder à l'application"
  value       = "http://<node-ip>:${kubernetes_service.dvwa.spec[0].ports[0].node_port}"
}
