terraform {
  required_providers {
    oci = {
      source  = "oracle/oci"
      version = "~> 4.80"
    }
  }
}

provider "oci" {
  tenancy_ocid = var.tenancy_ocid
  region       = var.region
}

variable "tenancy_ocid" {}

variable "region" {}

variable "compartment_ocid" {}

variable "config_file_profile" {}
