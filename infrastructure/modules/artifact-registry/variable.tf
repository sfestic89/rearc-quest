variable "project_id" {
  type        = string
  description = "The ID of the Google Cloud project."
}

variable "repositories" {
  type = list(object({
    repo_id  = string
    location = string
    format   = string
    labels   = optional(map(string), {})
  }))
  description = "A list of objects defining the Artifact Registry repositories to create."
}

variable "cloudbuild_service_account_member" {
  type        = string
  description = "The service account member for Cloud Build (e.g., serviceAccount:1234567890@cloudbuild.gserviceaccount.com)."
}