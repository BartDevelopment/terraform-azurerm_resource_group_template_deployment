#REQUIRED

variable "templates" {
  type = map
}

variable "resource_group_name" {
  type = string
}

variable "tags" {
  type    = map
  default = null
}
