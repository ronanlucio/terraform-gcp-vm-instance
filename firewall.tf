data "google_compute_network" "default" {
  name = "default"
}

resource "google_compute_firewall" "icmp" {
  name    = "allow-icmp"
  network = data.google_compute_network.default.name

  allow {
    protocol = "icmp"
  }

  direction = "INGRESS"
  priority  = 1000

  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "ssh" {
  name    = "allow-ssh"
  network = data.google_compute_network.default.name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  direction = "INGRESS"
  priority  = 1000

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["ssh"]
}

resource "google_compute_firewall" "web" {
  name    = "allow-web"
  network = data.google_compute_network.default.name

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  direction = "INGRESS"
  priority  = 1000

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["web"]
}
