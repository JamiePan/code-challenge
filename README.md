# Introduction 
This is the Code Challenge for Azure Kubernetes and other relevant Azure Infra.
There are two parts for the whole challenge:
  - Azure Infra: Resource Group, AKS, Storage Account (TF statefile), Azure DNS
  - IaC: Terraform
  - Kubernetes Applications: Helm-Chart

![alt tag](images/azure-infra.png)
![alt tag](images/url.png)

# Two Pipelines
Pipelines will be triggered once the new changes merged into "Main" branch.
- Terraform pipeline
- Helm-Chart Pipeline

![alt tag](images/kubectl.png)
![alt tag](images/pipelines.png)

