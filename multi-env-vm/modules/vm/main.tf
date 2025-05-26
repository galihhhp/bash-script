resource "google_compute_instance" "bookly" {
  name         = var.instance_name
  machine_type = var.machine_type

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }

  network_interface {
    network    = google_compute_network.bookly_vpc.id
    subnetwork = google_compute_subnetwork.bookly_subnet.id

    access_config {}
  }

  tags = ["bookly-vm"]
}

resource "google_compute_network" "bookly_vpc" {
  name                    = var.network_name
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "bookly_subnet" {
  name          = var.subnet_name
  network       = google_compute_network.bookly_vpc.id
  ip_cidr_range = var.subnet_ip_cidr_range
  region        = var.region
}

resource "google_compute_firewall" "default" {
  name    = var.instance_name
  network = google_compute_network.bookly_vpc.id

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["80", "8080", "22", "443"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["bookly-vm"]
}
