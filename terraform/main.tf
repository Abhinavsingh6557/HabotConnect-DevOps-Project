terraform {
  required_version = ">= 1.5"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}

###########################################################
# Google Cloud Storage Bucket (D0 Raw Landing)
###########################################################

resource "google_storage_bucket" "raw_bucket" {

  name                        = var.bucket_name
  location                    = var.region
  force_destroy               = false
  uniform_bucket_level_access = true

  public_access_prevention = "enforced"

  versioning {
    enabled = true
  }

  lifecycle_rule {

    action {
      type = "Delete"
    }

    condition {
      age = 90
    }
  }

  labels = {
    environment = var.environment
    project     = "habotconnect"
    owner       = "cloud-team"
  }
}

###########################################################
# BigQuery Dataset (D1 Staged)
###########################################################

resource "google_bigquery_dataset" "staging_dataset" {

  dataset_id = var.dataset_id

  location = var.region

  delete_contents_on_destroy = false

  labels = {
    environment = var.environment
    project     = "habotconnect"
  }

  default_table_expiration_ms = 2592000000
}

###########################################################
# IAM
###########################################################

resource "google_storage_bucket_iam_member" "bucket_admin" {

  bucket = google_storage_bucket.raw_bucket.name

  role = "roles/storage.objectAdmin"

  member = "serviceAccount:app-engine-sa@${var.project_id}.iam.gserviceaccount.com"
}

resource "google_bigquery_dataset_iam_member" "dataset_editor" {

  dataset_id = google_bigquery_dataset.staging_dataset.dataset_id

  role = "roles/bigquery.dataEditor"

  member = "serviceAccount:app-engine-sa@${var.project_id}.iam.gserviceaccount.com"
}