variable "region" {
  type        = string
  description = "Aws region"
}

variable "vpc_cidr_block" {
  type        = string
  description = "cidr block for vpc"
}

variable "subnet_cidr_block" {
  type        = string
  description = "cidr block for subnet"
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

variable "availability_zone" {
  type        = string
  description = "availability_zone "
}

# variable "access_key" {
#   type        = string
#   description = "Aws authantication access key"
# }

# variable "secret_key" {
#   type        = string
#   description = "Aws authantication secret key"
# }
