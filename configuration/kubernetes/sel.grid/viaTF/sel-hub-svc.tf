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

terraform {
  backend "azurerm" {
    # storage_account_name="<<storage_account_name>>" #OVERRIDE in TERRAFORM init
    # access_key="<<storage_account_key>>" #OVERRIDE in TERRAFORM init
    # key="<<env_name.k8s.tfstate>>" #OVERRIDE in TERRAFORM init
    # container_name="<<storage_account_container_name>>" #OVERRIDE in TERRAFORM init
  }
}
