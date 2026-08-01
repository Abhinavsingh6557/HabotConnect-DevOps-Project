variable "project_id" {
  description = "Google Cloud Project ID"
  type        = string
}

variable "region" {
  description = "Google Cloud Region"
  type        = string
  default     = "asia-south1"
}

variable "bucket_name" {
  description = "Raw Landing Bucket Name"
  type        = string
  default     = "habot-d0-raw-landing"
}

variable "dataset_id" {
  description = "BigQuery Dataset ID"
  type        = string
  default     = "habot_d1_staging"
}

variable "environment" {
  description = "Deployment Environment"
  type        = string
  default     = "staging"
}