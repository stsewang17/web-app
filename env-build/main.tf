# resource "google_storage_bucket" "example_bucket" {
#   name     = "st-example-bucket-123"
#   location = "US"

#   versioning {
#     enabled = true
#   }
# }

resource "google_cloud_run_service" "sopa_website" {
  name     = "sopa-website"
  location = "us-central1"

  template {
    spec {
      containers {
        image = var.image_url
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }
}

# This Terraform won't create any Google Cloud resources, so additional 
# permissions are required for the service account
#
resource "random_string" "random" {
  length           = 13
  special          = true
  override_special = "/@£$"
}

output "random_string" {
    value = random_string.random.id
}