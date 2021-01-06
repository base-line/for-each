variable "name1" {
  type    = set(string)
  default = ["one", "three"]
}

resource "null_resource" "name1" {
  for_each = var.name1
  triggers = {
    "key" = each.value
  }
}

variable "name2" {
  default = ["one", "four"]
}

resource "null_resource" "name2" {
  for_each = toset(var.name2)
  triggers = {
    "key" = each.value
  }
}