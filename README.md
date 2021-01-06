# for-each
Terraform for_each example

## Pre-requirements
- [git](https://git-scm.com/downloads) need to be installed 
- [terraform](https://www.terraform.io/downloads.html) need to be installed

## How to consume

```bash
git clone git@github.com:base-line/for-each.git
cd for-each
terraform init
terraform apply
```
## As result

there are 2 examples

- variable `name1` is type `set`
- variable `name2` is using [toset](https://www.terraform.io/docs/configuration/functions/toset.html) to convert types

```bash
# null_resource.name1["one"]:
resource "null_resource" "name1" {
    id       = "1928763253982891991"
    triggers = {
        "key" = "one"
    }
}

# null_resource.name1["three"]:
resource "null_resource" "name1" {
    id       = "8851478033162632729"
    triggers = {
        "key" = "three"
    }
}

# null_resource.name2["four"]:
resource "null_resource" "name2" {
    id       = "3968408546518974633"
    triggers = {
        "key" = "four"
    }
}

# null_resource.name2["one"]:
resource "null_resource" "name2" {
    id       = "2607263375194836114"
    triggers = {
        "key" = "one"
    }
}

# null_resource.name2["three"]:
resource "null_resource" "name2" {
    id       = "5748931891031638762"
    triggers = {
        "key" = "three"
    }
}
```

if remove one of the elements, for example

```bash
variable "name2" {
  default = ["one", "four"]
}
```

on next `terraform apply` you'll have 

```bash
terraform apply
null_resource.name2["three"]: Refreshing state... [id=5748931891031638762]
null_resource.name2["one"]: Refreshing state... [id=2607263375194836114]
null_resource.name1["one"]: Refreshing state... [id=1928763253982891991]
null_resource.name2["four"]: Refreshing state... [id=3968408546518974633]
null_resource.name1["three"]: Refreshing state... [id=8851478033162632729]

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  - destroy

Terraform will perform the following actions:

  # null_resource.name2["three"] will be destroyed
  - resource "null_resource" "name2" {
      - id       = "5748931891031638762" -> null
      - triggers = {
          - "key" = "three"
        } -> null
    }

Plan: 0 to add, 0 to change, 1 to destroy.
```

one of the elements of the list will be destroy

## Destroy

destroy created infrastructure if need be

```
terraform destroy
```