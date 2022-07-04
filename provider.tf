terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.27.0"
    }
  }
}

provider "google" {
  project = "dauntless-sun-355118"
  region  = "us-central1"
}
