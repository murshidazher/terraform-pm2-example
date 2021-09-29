# Variables TF File
variable "region" {
  description = "AWS Region"
  default     = "us-east-1"
}

variable "project" {
  description = "Project Name"
  default     = "openvpn-pm2-cluster"
}

variable "cidr_external_01" {
  description = "CIDR block for external 01"
  default     = "10.118.8.0/25"
}

variable "cidr_external_02" {
  description = "CIDR block for external 02"
  default     = "10.118.9.0/25"
}

variable "cidr_external_03" {
  description = "CIDR block for external 03"
  default     = "10.118.10.0/25"
}
