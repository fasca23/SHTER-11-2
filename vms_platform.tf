### По заданию 3

variable "vpc_db_name" {
  type        = string
  default     = "network2"
  description = "VPC network & subnet name"
}

variable "vm_db_cidr" {
  type        = list(string)
  default     = ["10.0.2.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create -- подсеть"
}

variable "vm_db_vpc_name" {
  type        = string
  default     = "develop-db"
  description = "имя подсети"
}

variable "vm_db_zone" {
  type        = string
  default     = "ru-central1-b"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope -- зона доступности"
}

variable "vm_db_platform_id" {
  type        = string
  default     = "standard-v3"
  description = "yandex_compute_platform_id"
}

variable "vm_db_nat" {
  type        = bool
  default     = true
  description = "yandex_compute_network_nat"
}

variable "vm_db_preemptible" {
  type        = bool
  default     = true
  description = "yandex_compute_network_preemptible"
}

### По заданию 5
variable "vm_db_env" {
  type        = string
  default     = "develop"
  description = "yandex compute instance name env"
}
variable "vm_db_project" {
  type        = string
  default     = "platform"
  description = "yandex compute instance name project"
}
variable "vm_db_role" {
  type        = string
  default     = "db"
  description = "yandex compute instance name role"
}
