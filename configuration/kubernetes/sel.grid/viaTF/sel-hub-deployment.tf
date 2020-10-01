terraform {
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
    }
  }
}

provider "kubernetes" {}

resource "kubernetes_deployment" "sel_hub" {
  metadata {
    name = "selenium-hub"
    labels = {
      App = "selenium-hub"
    }
    annotations = {
      "service.beta.kubernetes.io/azure-dns-label-name" = "aksskc123"
    }
    
  }

  spec {
    replicas = 1
    selector {
      match_labels = {
        App = "selenium-hub"
      }
    }
    template {
      metadata {
        labels = {
          App = "selenium-hub"
        }
      }
      spec {
        container {
          image = "selenium/hub:3.141"
          name  = "selenium-hub"

          port {
            container_port = 4444
          }

          resources {
            limits {
              cpu    = "1.2"
              memory = "1800Mi"
            }
            requests {
              cpu    = "700m"
              memory = "1024Mi"
            }
          }
        
        }
      }
    }
  }
}