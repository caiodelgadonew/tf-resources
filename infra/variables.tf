variable "region" {
  description = "Define what region the resources  will be created"
  default     = "eu-central-1"
}

variable "name" {
  description = "Name of the Application"
  default     = "fake-product"
}

variable "envs" {
  description = "Environments to be created"
  type = list(string)
  default = [
    "production", 
    "staging"
  ]
}


variable "users" {
  description = "Users to be created"
  type = list(string)
  default = [
    "emma", 
    "liam"
  ]
}

variable "squad" {
  description = "Owner Squad of the Application"
  default     = "devops-squad"
}

variable "allowed_cidr_blocks" {
  description = "CIDR blocks that are allowed to access the instance"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}
