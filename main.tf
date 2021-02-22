provider "google" {}

variable "name" {
  default = "vm01"
}

variable "cpu" {
  default = "1"
}

variable "memory" {
  default = "1024"
}

variable "zone" {
  default = "asia-northeast1-b"
}

variable "disk_size" {
  default = 10
}

variable "disk_image" {
  default = "ubuntu-2004-focal-v20200810"
}

resource "google_compute_instance" "default" {
  name         = var.name
  machine_type = "custom-${var.cpu}-${var.memory}"
  zone         = var.zone

  boot_disk {
    initialize_params {
      size = var.disk_size
      type = "pd-ssd"
      image = var.disk_image
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }

  allow_stopping_for_update = true
}

