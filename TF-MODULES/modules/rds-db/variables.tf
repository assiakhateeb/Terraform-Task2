variable "allocated_storage" {
  default = 10
}

variable "engine" {
  type = string
  default = "mysql"
}

variable "engine_version" {
  type = string
  default = "5.7"
}

variable "instance_class" {
  type = string
  default = "db.t3.micro"
}

variable "name" {
  type = string
  default = "mydb"
}

variable "username" {
  type = string
  default = "foo"
}

variable "password" {
  type = string
  default = "foobarbaz"
}

variable "parameter_group_name" {
  type = string
  default = "default.mysql5.7"
}