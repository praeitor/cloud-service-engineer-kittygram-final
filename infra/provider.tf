# terraform {
#   required_providers {
#     yandex = {
#       source  = "yandex-cloud/yandex"
#     }
#   }
#   required_version = ">= 0.13"

#   backend "s3" {
#     endpoint                    = "https://storage.yandexcloud.net"
#     bucket                      = "kittygram-tf-state"
#     key                         = "terraform.tfstate"
#     region                      = "ru-central1"
#     skip_region_validation      = true
#     skip_credentials_validation = true
#     skip_requesting_account_id  = true
#     skip_s3_checksum            = true
#     force_path_style            = true
#   }
# }

terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "~> 0.89.0"
    }
  }

  # S3-бакет в Object Storage (для хранения файла Terraform state)
  backend "s3" {
    endpoints = {
      s3 = "https://storage.yandexcloud.net"
    }
    bucket = "kittygram-tf-state"
    region = "ru-central1"
    key    = "terraform.tfstate"

    skip_region_validation      = true
    skip_credentials_validation = true
    skip_requesting_account_id  = true
    skip_s3_checksum            = true
  }
}

provider "yandex" {
  service_account_key_file = "authorized_key.json"
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  zone      = "ru-central1-a"
}
