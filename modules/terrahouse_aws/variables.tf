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