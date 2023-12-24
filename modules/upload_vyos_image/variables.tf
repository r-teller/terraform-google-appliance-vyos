variable "project_id" {
  type = string
}

variable "release_latest" {
  type    = bool
  default = false
}

variable "release_tag" {
  type    = string
  default = "v1.3.5"
}

variable "gcs_region" {
  type    = string
  default = "US"
}
