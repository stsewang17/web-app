terraform {
  backend "gcs" {
    bucket = "sopa-tf-state"
    prefix = "terraform/state"
  } 
}

provider "google" {
  project = "ageless-rig-375816"
  zone    = "us-central1-c"
  region  = "us-central1"
}

