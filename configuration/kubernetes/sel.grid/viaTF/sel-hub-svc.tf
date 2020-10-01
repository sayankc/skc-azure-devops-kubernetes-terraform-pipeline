resource "kubernetes_service" "sel_hub" {
  metadata {
    name = "selenium-hub"
    labels = {
      App = "selenium-hub"
    }
    annotations = {
      "service.beta.kubernetes.io/azure-dns-label-name" = "skchubservice123tf"
    }

  }

  spec {
    selector = {
      App = "selenium-hub"
    }
    port {
      port        = 4444
      target_port = 4444
    }

    type = "LoadBalancer"
  }
}


