variable "region" {
  description = "The AWS region to create resources in"
  default     = "us-west-2"
}

variable "key_name" {
  description = "The name of the SSH key to use for the EC2 instances"
  type        = string
}
