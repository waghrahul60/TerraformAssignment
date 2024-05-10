variable "tags" {
  default     = {}
  type        = map(string)
  description = "Extra tags to attach to the iam-policy"
}

variable "environment" {
  type        = string
  description = "The environment name for the resources."
}

variable "application" {
  type        = string
  description = "Name of the application"
}

variable "iam_policy_json_file" {
  type        = string
  description = "Name of the json file"
}