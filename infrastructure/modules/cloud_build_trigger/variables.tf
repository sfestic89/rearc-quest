variable "project_id" {
  type        = string
  description = "The ID of the Google Cloud project."
}

variable "artifact_registry_repo_name" {
  type        = string
  description = "The name of the Artifact Registry repository (output from the other module)."
}

variable "artifact_registry_repo_location" {
  type        = string
  description = "The location of the Artifact Registry repository (output from the other module)."
}

variable "source_repo_name" {
  type        = string
  description = "The name of the source repository (e.g., from Cloud Source Repositories)."
}

variable "branch_name" {
  type        = string
  description = "The branch name to trigger the build from (e.g., 'main')."
}

variable "cloudbuild_yaml_filename" {
  type        = string
  description = "The name of the cloudbuild.yaml file."
}

variable "image_name" {
  type        = string
  description = "The desired name for your Docker image."
}

variable "image_tag" {
  type        = string
  description = "A tag for your image, often 'latest' or a version number."
}