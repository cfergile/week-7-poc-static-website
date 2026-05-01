resource "google_storage_bucket" "GCS_bucket1" {
  name                        = "week-7-poc-bucket"
  location                    = "US-CENTRAL1"
  storage_class               = "STANDARD"
  force_destroy               = true
  uniform_bucket_level_access = true

  website {
    main_page_suffix = "index.html"
    not_found_page   = "404.html"
  }

}


resource "google_storage_bucket_iam_member" "bucket1_member" {
  bucket = google_storage_bucket.GCS_bucket1.name
  role   = "roles/storage.objectViewer"
  member = "allUsers"
}
