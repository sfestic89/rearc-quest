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
