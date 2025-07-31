output "repository_details" {
  description = "A map of repository IDs to their full details."
  value       = google_artifact_registry_repository.repos
}