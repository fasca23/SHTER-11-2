###cloud vars


variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network & subnet name"
}


# ###ssh vars

# variable "vms_ssh_root_key" {
#   type        = string
#   default     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINifPFZ4j5XP5Vr26jOJc/dNA0puQXfu6XdpszX3WL8n kamenev@kamenev"
#   description = "ssh-keygen -t ed25519.pub / ls -al ~/.ssh / cat ~/.ssh/id_ed25519.pub /"
# }


### По заданию 2

variable "vm_web_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "yandex_compute_image_family"
}

# variable "vm_web_name" {
#   type        = string
#   default     = "netology-develop-platform-web"
#   description = "yandex_compute_instance_name"
# }

variable "vm_web_platform_id" {
  type        = string
  default     = "standard-v3"
  description = "yandex_compute_platform_id"
}

# variable "vm_web_cores" {
#   type        = number
#   default     = 2
#   description = "yandex_compute_cores"
# }

# variable "vm_web_memory" {
#   type        = number
#   default     = 1
#   description = "yandex_compute_memory"
# }

# variable "vm_web_core_fraction" {
#   type        = number
#   default     = 20
#   description = "yandex_compute_core_fraction"
# }

variable "vm_web_preemptible" {
  type        = bool
  default     = true
  description = "yandex_compute_network_preemptible"
}

variable "vm_web_nat" {
  type        = bool
  # default     = true
  default     = false
  description = "yandex_compute_network_nat"
}

# variable "vm_web_serial_port_enable" {
#   type        = number
#   default     = 1
#   description = "yandex_compute_serial_port_enable"
# }


### По заданию 5
variable "vm_web_env" {
  type        = string
  default     = "develop"
  description = "yandex compute instance name env"
}
variable "vm_web_project" {
  type        = string
  default     = "platform"
  description = "yandex compute instance name project"
}
variable "vm_web_role" {
  type        = string
  default     = "web"
  description = "yandex compute instance name role"
}


### По заданию 6
variable "vms_resources" {
  description = "переменная map для ресурсов ВМ"
  type = map(object({
      cores         = number
      memory        = number
      core_fraction = number
  }))
  
  default = {
    web = {
        cores        = 2
        memory       = 1
        core_fraction = 20
    },
    db = {
        cores        = 2
        memory       = 2
        core_fraction = 20
    }
  }
}

variable "metadata" {
  description = "Для всех ВМ"
  type = map(object({
      serial-port-enable = number
      ssh-keys           = string
  }))
  
  default = {
    web = {
        serial-port-enable = 1
        ssh-keys = "ubuntu:ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINifPFZ4j5XP5Vr26jOJc/dNA0puQXfu6XdpszX3WL8n kamenev@kamenev"
    },
    db = {
        serial-port-enable = 1
        ssh-keys = "ubuntu:ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINifPFZ4j5XP5Vr26jOJc/dNA0puQXfu6XdpszX3WL8n kamenev@kamenev"
    }
  }
}

### По заданию 8*

variable "test" {
  description = "переменная Задания 8* "
  type        = list(map(list(string)))
  default     = [
    {
      "dev1" = [
        "ssh -o 'StrictHostKeyChecking=no' ubuntu@62.84.124.117",
        "10.0.1.7",
      ]
    },
    {
      "dev2" = [
        "ssh -o 'StrictHostKeyChecking=no' ubuntu@84.252.140.88",
        "10.0.2.29",
      ]
    },
    {
      "prod1" = [
        "ssh -o 'StrictHostKeyChecking=no' ubuntu@51.250.2.101",
        "10.0.1.30",
      ]
    },
  ]
}