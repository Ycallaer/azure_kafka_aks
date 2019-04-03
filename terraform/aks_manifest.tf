resource "null_resource" "kubernetes_resource" {
  depends_on = [
    "azurerm_kubernetes_cluster.kube_cluster",
  ]

  #Get the credentials from the cluster and register to tmp file
  provisioner "local-exec" {
     command = <<EOT
          sleep 10 && \
          az aks get-credentials \
           --resource-group ${data.azurerm_resource_group.kafka_aks_res_group.name} \
           --name ${var.kubernetesClusterName} \
           -a \
           -f /tmp/${var.kubernetesClusterName}.conf
    EOT
  }



  #Configure the storage class
  provisioner "local-exec" {
    command = <<EOT
      export KUBECONFIG="/tmp/${var.kubernetesClusterName}.conf"
      kubectl apply -f aks_manifests/storage/aks_storage_broker.yml && \
      kubectl apply -f aks_manifests/storage/aks_storage_zookeeper.yml
    EOT
  }

  #Configure zookeeper
  provisioner "local-exec" {
    command = <<EOT
      export KUBECONFIG="/tmp/${var.kubernetesClusterName}.conf"
      kubectl apply -f aks_manifests/zookeeper/00_namespace.yml && \
      kubectl apply -f aks_manifests/zookeeper/10_zookeeper_config.yml && \
      kubectl apply -f aks_manifests/zookeeper/20_pzookeeper_service.yml && \
      kubectl apply -f aks_manifests/zookeeper/21_zookeeper_service.yml && \
      kubectl apply -f aks_manifests/zookeeper/30_service.yml && \
      kubectl apply -f aks_manifests/zookeeper/50_pzoo.yml && \
      kubectl apply -f aks_manifests/zookeeper/51_zoo.yml
    EOT
  }

  #Configure kafka
  provisioner "local-exec" {
    command = <<EOT
      export KUBECONFIG="/tmp/${var.kubernetesClusterName}.conf"
      kubectl apply -f aks_manifests/kafka/00_namespace.yml && \
      kubectl apply -f aks_manifests/kafka/10_broker_config.yml && \
      kubectl apply -f aks_manifests/kafka/20_dns.yml && \
      kubectl apply -f aks_manifests/kafka/30_bootstrap_service.yml && \
      kubectl apply -f aks_manifests/kafka/50_kafka.yml
    EOT
  }

  #Configure yahoo kafka manager
  provisioner "local-exec" {
    command = <<EOT
      export KUBECONFIG="/tmp/${var.kubernetesClusterName}.conf"
      kubectl apply -f aks_manifests/yahoo_kafka_manager/10_kafka_manager_service.yml && \
      kubectl apply -f aks_manifests/yahoo_kafka_manager/20_kafka_manager.yml
    EOT
  }
}