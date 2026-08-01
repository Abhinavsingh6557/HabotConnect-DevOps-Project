output "bucket_name" {
  description = "Google Cloud Storage Bucket"

  value = google_storage_bucket.raw_bucket.name
}

output "bucket_url" {

  value = google_storage_bucket.raw_bucket.url
}

output "bigquery_dataset" {

  value = google_bigquery_dataset.staging_dataset.dataset_id
}

output "region" {

  value = var.region
}