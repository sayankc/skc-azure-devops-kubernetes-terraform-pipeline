variable client_id {}
variable client_secret {}
variable ssh_public_key {}

variable environment {
    default = "dev"
}

variable location {
    default = "westeurope"
}

variable node_count {
  default = 2
}



variable dns_prefix {
  default = "skc-k8-cluster-dns"
}

variable cluster_name {
  default = "skc-k8-cluster"
}

variable resource_group {
  default = "skc-k8-cluste-rg"
}
