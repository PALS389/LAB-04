# variables.tf

variable "aws_region" {
  description = "La region de AWS"
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "El entorno actual"
  type        = string
}

variable "bucket_suffix" {
  description = "Sufijo unico para el bucket S3"
  type        = string
}