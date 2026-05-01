output "website_url" {
  description = "Public URL for the static website index page"
  value       = "https://storage.googleapis.com/${google_storage_bucket.GCS_bucket1.name}/index.html"
}