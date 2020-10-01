/*
terraform {
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
    }
  }
}
*/

#provider "kubernetes" {}

resource "kubernetes_deployment" "sel_node_chrome" {
  metadata {
    name = "selenium-node-chrome"
    labels = {
      App = "selenium-node-chrome"
    }
    
  }

  spec {
    replicas = var.node_count
    selector {
      match_labels = {
        App = "selenium-node-chrome"
      }
    }
    template {
      metadata {
        labels = {
          App = "selenium-node-chrome"
        }
      }
      spec {
        container {
          image = "selenium/node-chrome:3.141.59-xenon"
          name  = "selenium-node-chrome"
          env {
            name = "JAVA_OPTS"
            value = "-Xmx512m -Dselenium.LOGGER.level=WARNING"
          }
          env  {
            name = "HUB_PORT_4444_TCP_ADDR"
            value = "selenium-hub"
          }
          env  {
            name = "HUB_PORT_4444_TCP_PORT"
            value = "4444"
          }

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

terraform {
  backend "azurerm" {
    # storage_account_name="<<storage_account_name>>" #OVERRIDE in TERRAFORM init
    # access_key="<<storage_account_key>>" #OVERRIDE in TERRAFORM init
    # key="<<env_name.k8s.tfstate>>" #OVERRIDE in TERRAFORM init
    # container_name="<<storage_account_container_name>>" #OVERRIDE in TERRAFORM init
  }
}
