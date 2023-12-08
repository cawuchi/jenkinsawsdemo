variable "services" {
  description = "Person name for Consul services monitored by Consul-Terraform-Sync"   
  type = string
  default = "test"
}
output "services" {
value = var.services
}
