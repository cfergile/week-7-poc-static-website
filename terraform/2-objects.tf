resource "google_storage_bucket_object" "picture1" {
  name   = "gold_bars.jpg"
  bucket = google_storage_bucket.GCS_bucket1.name
  source = "gold_bars.jpg"
  content_type = "image/jpeg"

}

resource "google_storage_bucket_object" "error_page" {
  name   = "404.html"
  bucket = google_storage_bucket.GCS_bucket1.name
  source = "404.html"

}

resource "google_storage_bucket_object" "index_page" {
  name   = "index.html"
  bucket = google_storage_bucket.GCS_bucket1.name
  source = "index.html"
}

resource "google_storage_bucket_object" "style" {
  name   = "style.css"
  bucket = google_storage_bucket.GCS_bucket1.name
  source = "style.css"

}