variable "enviroment" {
  default = "production"
}

variable "plus" {
  default = 2
}

variable "production" {
    default = true
}

variable "environment" {
  type = string
  default = "staging"
  description = "The environment of instance"
}

variable "sg" {
  type = list(number)
  default = [ 1,2,3,4 ]
  description = "The list of sg for this instance"
}

variable "instance_type" {
  type = list(string)
  default = ["t2.micro", "t3.medium"]
  description = "The list of instance type"
}