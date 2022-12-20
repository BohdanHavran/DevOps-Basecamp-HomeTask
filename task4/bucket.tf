resource "google_storage_bucket" "internalip" {
  name          = "internalip"
  location      = "US"
  force_destroy = true
}
resource "google_storage_bucket_iam_member" "member" {
  bucket = google_storage_bucket.internalip.name
  role   = "roles/storage.admin"
  member = "allUsers"
}
