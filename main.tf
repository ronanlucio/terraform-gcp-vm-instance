resource "google_compute_instance" "vm-test" {
  name         = "test"
  machine_type = "e2-micro"
  zone         = "us-central1-a"

  tags = ["icmp", "ssh", "web"]

  boot_disk {
    initialize_params {
      image = "ubuntu-2004-focal-v20220701"
    }
  }

  # Install nginx
  metadata_startup_script = "sudo apt-get update; sudo apt-get install -yq nginx; systemctl start nginx"

  network_interface {
    network = "default"

    access_config {
      # Include this section to give the VM an external IP address
    }
  }
}
