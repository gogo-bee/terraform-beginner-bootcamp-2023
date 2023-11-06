variable "user_uuid" {
  description = "Unique identifier for the user"
  type        = string

  validation {
    condition     = can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-4[0-9a-fA-F]{3}-[89aAbB][0-9a-fA-F]{3}-[0-9a-fA-F]{12}$", var.user_uuid))
    error_message = "user_uuid must be in the format of a UUID (e.g., 123e4567-e89b-12d3-a456-426614174001)"
  }
}

variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string

  validation {
    condition     = length(var.bucket_name) <= 63 && length(var.bucket_name) >= 3
    error_message = "Bucket name must be between 3 and 63 characters long"
  }
} 

variable "index_html_filepath" {
  description = "Filepath for the index.html file"
  type        = string

  validation {
    condition     = fileexists(var.index_html_filepath)
    error_message = "The provided path for index.html does not exist"
  }
}

variable "error_html_filepath" {
  description = "Filepath for the error.html file"
  type        = string

  validation {
    condition     = fileexists(var.error_html_filepath)
    error_message = "The provided path for error.html does not exist"
  }
}

variable "content_version" {
  description = "Version number for content"
  type        = number
  default     = 1

  validation {
    condition     = var.content_version > 0 && can(var.content_version)
    error_message = "Content version must be a positive integer starting at 1"
  }
}

variable "assets_path" {
  description = "Path to assets folder"
  type = string
}