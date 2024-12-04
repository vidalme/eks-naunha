variable "app_name" {
  type    = string
  default = "eks-na-unha"
}

variable "tags" {

  description = "Additional resource tags"
  type        = map(string)

  default = {
    "Environment" = "estudo"
    "Project"     = "tutorial de eks"
  }
}

variable "vpc" {

  type = object({
    cidr_block = string
    pub-subnets = list(object({
      cidr_block              = string
      availability_zone       = string
      map_public_ip_on_launch = bool
    }))
    pri-subnets = list(object({
      cidr_block        = string
      availability_zone = string
    }))
  })

  default = {
    cidr_block = "10.0.0.0/16"
    pub-subnets = [{
      cidr_block              = "10.0.0.0/26",
      availability_zone       = "us-east-1a",
      map_public_ip_on_launch = true,
      }, {
      cidr_block              = "10.0.0.64/26"
      availability_zone       = "us-east-1b",
      map_public_ip_on_launch = true,
    }]
    pri-subnets = [{
      cidr_block        = "10.0.0.128/26",
      availability_zone = "us-east-1a",
      }, {
      cidr_block        = "10.0.0.192/26"
      availability_zone = "us-east-1b",
    }]
  }
}

variable "ecr" {
  type = list(object({
    name                 = string
    image_tag_mutability = string
  }))
  default = [{
    name                 = "eksnaunha/production/frontend"
    image_tag_mutability = "MUTABLE"
    },
    {
      name                 = "eksnaunha/production/backend"
      image_tag_mutability = "MUTABLE"
  }]
}