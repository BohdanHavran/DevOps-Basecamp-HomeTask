# Bucket
resource "google_storage_bucket" "internalip" {
  name          = "internalip"
  location      = "US"
  force_destroy = true
}
# Bucket rule
resource "google_storage_bucket_iam_member" "member" {
  bucket = google_storage_bucket.internalip.name
  role   = "roles/storage.admin"
  member = "allUsers"
}
