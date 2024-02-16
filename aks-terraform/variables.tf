variable "client_id" {
  description = "Access key for the provider"
  type = string
  sensitive   = true
}

variable "client_secret" {
  description = "Secret key for the provider"
  type = string
  sensitive   = true
}

variable "ip_address" {
  description = "To allow traffic from a specific IP address"
  type = string
}