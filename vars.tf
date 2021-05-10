variable "location" {
  type    = string
  default = "East US"
}

variable "numberOfWorkerNodes" {
  type = number
  default = 1
}

# variable "image" {
#   type    = string
#   default = "/subscriptions/5a8d2bcf-85f4-4625-a08e-162fcb039c1a/resourceGroups/devops_vmss/providers/Microsoft.Compute/images/Devops_VM-image-20210510154248"
# }

variable "ssh-source-address" {
  type    = string
  default = "*"
}

variable scfile{
    type = string 
    default = "script.sh"
}

variable "computer_name" {
  default = "hostname"
}

variable "admin_password" {
  default = "Password1234!"
}

