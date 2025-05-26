output "vm_id" {
  description = "The ID of the VM instance"
  value       = google_compute_instance.bookly.id
}

output "vm_name" {
  description = "The name of the VM instance"
  value       = google_compute_instance.bookly.name
}

output "vm_internal_ip" {
  description = "The internal IP address of the VM instance"
  value       = google_compute_instance.bookly.network_interface[0].network_ip
}

output "vm_external_ip" {
  description = "The external IP address of the VM instance"
  value       = google_compute_instance.bookly.network_interface[0].access_config[0].nat_ip
}

output "network_id" {
  description = "The ID of the VPC network"
  value       = google_compute_network.bookly_vpc.id
}

output "network_name" {
  description = "The name of the VPC network"
  value       = google_compute_network.bookly_vpc.name
}

output "subnet_id" {
  description = "The ID of the subnet"
  value       = google_compute_subnetwork.bookly_subnet.id
}

output "subnet_name" {
  description = "The name of the subnet"
  value       = google_compute_subnetwork.bookly_subnet.name
}

output "subnet_cidr" {
  description = "The CIDR range of the subnet"
  value       = google_compute_subnetwork.bookly_subnet.ip_cidr_range
}

output "vm_self_link" {
  description = "The self link of the VM instance"
  value       = google_compute_instance.bookly.self_link
}

output "vm_zone" {
  description = "The zone where the VM is deployed"
  value       = google_compute_instance.bookly.zone
}

output "vm_machine_type" {
  description = "The machine type of the VM"
  value       = google_compute_instance.bookly.machine_type
}