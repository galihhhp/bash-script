output "environment" {
  description = "The environment this infrastructure belongs to (derived from the instance name)"
  value       = var.instance_name
}

output "vm_details" {
  description = "Details about the VM instance"
  value = {
    id           = module.bookly_vm.vm_id
    name         = module.bookly_vm.vm_name
    internal_ip  = module.bookly_vm.vm_internal_ip
    external_ip  = module.bookly_vm.vm_external_ip
    machine_type = module.bookly_vm.vm_machine_type
    zone         = module.bookly_vm.vm_zone
  }
}

output "network_details" {
  description = "Details about the network infrastructure"
  value = {
    network_id   = module.bookly_vm.network_id
    network_name = module.bookly_vm.network_name
    subnet_id    = module.bookly_vm.subnet_id
    subnet_name  = module.bookly_vm.subnet_name
    subnet_cidr  = module.bookly_vm.subnet_cidr
  }
}

output "deployment_info" {
  description = "Information about the deployment"
  value = {
    project_id = var.project_id
    region     = var.region
  }
}
