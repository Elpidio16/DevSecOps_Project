provider "kubernetes" {
  config_path = var.kubeconfig_path
}

resource "kubernetes_deployment" "dvwa" {
  metadata {
    name = var.app_name
    labels = {
      app = var.app_name
    }
  }

  spec {
    replicas = var.replicas
    selector {
      match_labels = {
        app = var.app_name
      }
    }

    template {
      metadata {
        labels = {
          app = var.app_name
        }
      }

      spec {
        container {
          image = var.docker_image
          name  = var.app_name
          port {
            container_port = 80
          }
          resources {
            limits = {
              cpu    = var.cpu_limit
              memory = var.memory_limit
            }
          }

          liveness_probe {
            http_get {
              path = "/"
              port = 80
            }
            initial_delay_seconds = 3
            period_seconds        = 10
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "dvwa" {
  metadata {
    name = "${var.app_name}-service"
  }

  spec {
    selector = {
      app = kubernetes_deployment.dvwa.metadata[0].labels.app
    }
    port {
      port        = 80
      target_port = 80
      node_port   = var.node_port
    }
    type = "NodePort"
  }
}
