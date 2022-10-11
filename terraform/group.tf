resource "oci_identity_group" "group" {
  compartment_id = var.tenancy_ocid
  description    = "Group for ${var.group_name}"
  name           = var.group_name
}
