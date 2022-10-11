resource "oci_identity_user" "users" {
  count          = var.num_users
  compartment_id = var.tenancy_ocid
  description    = "User for ${var.description}: ${var.name}_${count.index}"
  name           = "${var.name}_${count.index}"

  email = "${var.name}_${count.index}@example.com"
}

resource "oci_identity_user_group_membership" "user_group_membership" {
  count    = var.num_users
  group_id = oci_identity_group.group.id
  user_id  = oci_identity_user.users[count.index].id
}

resource "oci_identity_user_capabilities_management" "user_capabilities_management" {
  count   = var.num_users
  user_id = oci_identity_user.users[count.index].id

  can_use_api_keys             = "false"
  can_use_auth_tokens          = "false"
  can_use_console_password     = "false"
  can_use_customer_secret_keys = "false"
  can_use_smtp_credentials     = "false"
}
