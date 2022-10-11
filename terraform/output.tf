locals {
  user_data = [for idx in range(0, var.num_users) :
    join(":", [oci_identity_user.users[idx].name, oci_identity_ui_password.ui_password[idx].password])
  ]
}

output "users_and_passwords" {
  value = local.user_data
}

output "group" {
  value = oci_identity_group.group.name
}
