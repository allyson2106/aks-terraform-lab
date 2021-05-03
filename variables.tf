variable "resourcename" {
  default = "k8s-resources"
}

variable "clustername" {
  default = "kubernetes-aks1"
}

variable "location" {
  default = "brazilsouth"
}

variable "dnspreffix" {
  default = "kubecluster"
}

variable "size" {
  default = "Standard_DS1_v2"
}

variable "agentnode" {
  default = "1"
}

variable "subscription_id" {
  type    = string
  default ="69abe977-93de-49ca-813e-c5e49064513d"
}

variable "client_id" {
  type    = string
  default = "69abe977-93de-49ca-813e-c5e49064513d"
}

variable "client_secret" {
  type = string
  default = "oHUZJEvmVRPfFCWdYPP.HqwE.k8IF3GHTG"
}

variable "tenant_id" {
  type    = string
  default = "da49a844-e2e3-40af-86a6-c3819d704f4"
}