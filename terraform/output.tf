output "users" {
  value = oci_identity_user.users.*.name
}
