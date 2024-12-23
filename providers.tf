terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
      version = "0.124.0"
    }
  }
  required_version = ">=1.5"
}

provider "yandex" {
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  service_account_key_file = file("~/authorized_key.json")
}
