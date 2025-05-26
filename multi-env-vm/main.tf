terraform {
  backend "gcs" {
    bucket = "gp-tf-state"
    prefix = "terraform/bookly"
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
  zone    = "${var.region}-a"
}

module "bookly_vm" {
  source               = "./modules/vm"
  project_id           = var.project_id
  instance_name        = var.instance_name
  machine_type         = var.machine_type
  network_name         = var.network_name
  subnet_name          = var.subnet_name
  subnet_ip_cidr_range = var.subnet_ip_cidr_range
  region               = var.region
  firewall_name        = var.firewall_name
}
