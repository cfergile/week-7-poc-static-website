terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "7.28.0"
    }
  }
}


provider "google" {
  project = "theowafclass75-claudefergile"
  region  = "us-central1"
}