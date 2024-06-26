variable "region" {
  type        = string
  description = "Aws region"
}

variable "access_key" {
  type        = string
  description = "Aws authantication access key"
}

variable "secret_key" {
  type        = string
  description = "Aws authantication secret key"
}

variable "cidr_block" {
  type        = string
  description = "cidr block for vac"
}

variable "private_ips" {
  type        = string
  description = "privet ip for instance"
}

variable "instance_image" {
  type        = string
  description = "Amazon machine image ( operating-system )"
}

variable "instance_type" {
  type        = string
  description = "instance specifications"
}

variable "key_name" {
  type        = string
  description = "ssh key name"
}






