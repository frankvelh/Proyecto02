####### Variables #######
variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "bucket_name" {
  description = "S3 bucket name"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "db_username" {
  description = "RDS DB username"
  type        = string
}

variable "db_password" {
  description = "RDS DB password"
  type        = string
  sensitive   = true
}

variable "db_name" {
  description = "Database name"
  type        = string
}

variable "key_name" {
  description = "SSH key pair name"
  type        = string
}

variable "ses_email" {
  description = "Verified SES email"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}
