# Create Artifact Registry repositories using a for_each loop
resource "google_artifact_registry_repository" "repos" {
  for_each = { for repo in var.repositories : repo.repo_id => repo }

  repository_id = each.value.repo_id
  project       = var.project_id
  location      = each.value.location
  format        = each.value.format
  labels        = each.value.labels

  lifecycle {
    prevent_destroy = false
  }
}

# Grant the Cloud Build service account the Artifact Registry Writer role for each repository
resource "google_artifact_registry_repository_iam_member" "cloudbuild_ar_writer" {
  for_each = google_artifact_registry_repository.repos

  repository = each.value.name
  location   = each.value.location
  project    = var.project_id
  role       = "roles/artifactregistry.writer"
  member     = var.cloudbuild_service_account_member
}