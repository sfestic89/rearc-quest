variable "project_id" {
  type        = string
  description = "The ID of the Google Cloud project."
}

variable "repositories" {
  type = list(object({
    repo_id  = string
    location = string
    format   = string
    labels   = map(string)
  }))
  description = "A list of objects defining the Artifact Registry repositories to create."
}
