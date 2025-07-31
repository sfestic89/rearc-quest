/**
module "artifact_registry" {
  source = "./modules/artifact-registry"

  project_id = "rearc-quest-project"
  repositories = [
    {
      repo_id  = "rearc-quest"
      location = "europe-west3"
      format   = "DOCKER"
    }
  ]
  cloudbuild_service_account_member = "serviceAccount:rearc-quest-project@cloudbuild.gserviceaccount.com"
}
**/
# Call the Cloud Build trigger module to set up the build pipeline
module "cloud_build_trigger" {
  source = "./modules/cloud_build_trigger"

  project_id                      = "rearc-quest-project"
  artifact_registry_repo_name     = "rearc-quest"
  artifact_registry_repo_location = "europe-west3"
  source_repo_name                = "rearc-quest"
  branch_name                     = "main"
  cloudbuild_yaml_filename        = "cloudbuild.yaml"
  image_name                      = "rearc-quest-image"
  image_tag                       = "latest"
}