variable "instance_name" {
  description = "The name of the VM instance"
}

variable "machine_type" {
  description = "The machine type for the VM instance (e.g., e2-small, e2-medium)"
}

variable "network_name" {
  description = "The name of the VPC network to create"
}

variable "subnet_name" {
  description = "The name of the subnet within the VPC network"
}

variable "subnet_ip_cidr_range" {
  description = "The IP CIDR range for the subnet (e.g., 10.100.0.0/24)"
}

variable "region" {
  description = "The GCP region where resources will be deployed"
}

variable "project_id" {
  description = "The Google Cloud project ID"
}

variable "firewall_name" {
  description = "The name of the firewall rule to create"
}
