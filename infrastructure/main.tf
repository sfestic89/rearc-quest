module "artifact_registry" {
  source = "./modules/artifact-registry"

  project_id = "rearc-quest-project"
  repositories = [
    {
      repo_id  = "rearc-quest"
      location = "europe-west3"
      format   = "DOCKER"
      labels   = {
        environment = "dev"
        team        = "platform"
      }
    }
  ]
}
