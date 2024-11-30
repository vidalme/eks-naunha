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
  })

  default = {
    cidr_block = "10.0.0.0/16"
    pub-subnets = [{
      cidr_block              = "10.0.0.0/26",
      availability_zone       = "us-east-1d",
      map_public_ip_on_launch = true,
      }, {
      cidr_block              = "10.0.0.64/26"
      availability_zone       = "us-east-1e",
      map_public_ip_on_launch = true,
    }]
  }
}


# variable "subnet" {
#     type = object({
#         name = string
#         cidr_block = string
#     })
#     default = {
#         name = "eks-na-unha-subnet"
#         cidr_block = "
#     }

# }