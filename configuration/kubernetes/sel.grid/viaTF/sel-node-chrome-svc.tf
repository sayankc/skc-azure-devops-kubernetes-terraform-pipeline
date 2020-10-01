resource "kubernetes_service" "sel_node_chrome" {
  metadata {
    name = "selenium-node-chrome"
    labels = {
      App = "selenium-node-chrome"
    }

  }

  spec {
    selector = {
      App = "selenium-node-chrome"
    }
    port {
      name = "nodeport"
      protocol = "TCP"
      port        = 5555
      target_port = 5555
    }
    port {
      port = 4444
      target_port = 4444
      protocol = "TCP"
      name = "node-port-grid"
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
