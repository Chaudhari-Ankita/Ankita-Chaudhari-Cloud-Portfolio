provider "google" {
  project = "portfolio-deployment-460223"
  region  = "us-central1"
}

resource "google_storage_bucket" "portfolio_bucket" {
  name     = "ankita-portfolio-bucket"
  location = "US"
  website {
    main_page_suffix = "index.html"
    not_found_page   = "index.html"
  }
  force_destroy = true
}

# resource "google_storage_bucket_object" "website_files" {
#  name   = each.key
#  bucket = google_storage_bucket.portfolio_bucket.name
#  source = "C:/Users/User/Documents/Cloud_Portfolio/Ankita-Chaudhari-Cloud-Portfolio/Code/${each.key}"
#  content_type = lookup({
#   html = "text/html"
#    css  = "text/css"
#    js   = "application/javascript"
#  }, split(".", each.key)[1], "text/plain")
# }


resource "google_storage_bucket_iam_binding" "public_access" {
  bucket = google_storage_bucket.portfolio_bucket.name
  role   = "roles/storage.objectViewer"
  members = [
    "allUsers",
  ]
}

locals {
  files = [
    "index.html",
    "style.css",
    "script.js"
  ]
}

resource "google_storage_bucket_object" "upload_files" {
  for_each = toset(local.files)

  name     = each.key
  bucket   = google_storage_bucket.portfolio_bucket.name
  source   = "../Code/${each.key}"

  content_type = lookup({
    html = "text/html"
    css  = "text/css"
    js   = "application/javascript"
  }, split(".", each.key)[1], "text/plain")
}
