# Create a Cloud Build Trigger
resource "google_cloudbuild_trigger" "build_and_push" {
  project = var.project_id
  name    = "build-and-push-docker-image"

  trigger_template {
    project_id  = var.project_id
    repo_name   = var.source_repo_name
    branch_name = var.branch_name
  }

  filename = var.cloudbuild_yaml_filename

  substitutions = {
    _AR_LOCATION      = var.artifact_registry_repo_location
    _AR_REPOSITORY_ID = var.artifact_registry_repo_name
    _IMAGE_NAME       = var.image_name
    _IMAGE_TAG        = var.image_tag
  }
}