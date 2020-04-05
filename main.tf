provider "vault" {
  auth_login {
    path = "auth/aws/login"

    parameters = {
      role = "dev-role-iam"
      pkcs7= "MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAaCAJIAEggHnewogICJhY2NvdW50SWQiIDogIjU3ODYxMjExMTk0NiIsCiAgImFyY2hpdGVjdHVyZSIgOiAieDg2XzY0IiwKICAiYXZhaWxhYmlsaXR5Wm9uZSIgOiAiYXAtc291dGhlYXN0LTJhIiwKICAiYmlsbGluZ1Byb2R1Y3RzIiA6IG51bGwsCiAgImRldnBheVByb2R1Y3RDb2RlcyIgOiBudWxsLAogICJtYXJrZXRwbGFjZVByb2R1Y3RDb2RlcyIgOiBudWxsLAogICJpbWFnZUlkIiA6ICJhbWktMGRjOTYyNTRkNTUzNTkyNWYiLAogICJpbnN0YW5jZUlkIiA6ICJpLTAyYzg1NTllYmViZjZhZDBiIiwKICAiaW5zdGFuY2VUeXBlIiA6ICJtNS5sYXJnZSIsCiAgImtlcm5lbElkIiA6IG51bGwsCiAgInBlbmRpbmdUaW1lIiA6ICIyMDIwLTA0LTA0VDA0OjIyOjAyWiIsCiAgInByaXZhdGVJcCIgOiAiMTcyLjMxLjM1LjE1NCIsCiAgInJhbWRpc2tJZCIgOiBudWxsLAogICJyZWdpb24iIDogImFwLXNvdXRoZWFzdC0yIiwKICAidmVyc2lvbiIgOiAiMjAxNy0wOS0zMCIKfQAAAAAAADGCARcwggETAgEBMGkwXDELMAkGA1UEBhMCVVMxGTAXBgNVBAgTEFdhc2hpbmd0b24gU3RhdGUxEDAOBgNVBAcTB1NlYXR0bGUxIDAeBgNVBAoTF0FtYXpvbiBXZWIgU2VydmljZXMgTExDAgkAlrpI2eVeGmcwCQYFKw4DAhoFAKBdMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTIwMDQwNDA0MjIwOVowIwYJKoZIhvcNAQkEMRYEFLogrjxs06oiKgLCezWU2IIOhReMMAkGByqGSM44BAMELjAsAhQ0bC6TkphkceDLrg6Eru6dI93cQgIULp6iEGJ25eP10Hw2xEaEh4ILVJgAAAAAAAA="
    }
  }
//  namespace = "hashicorp"
  alias     = "ns_base"
}

resource "vault_aws_auth_backend_login" "example" {
  provider   = vault.ns_base
  backend   = "aws"
  role      = "dev-role"
}

data "vault_generic_secret" "dev" {
  provider    = vault.ns_base
  path        = "kv/dev"
}

data "template_file" "index" {
  template = file("${path.module}/templates/index.tpl")

  vars = {
    firstname = data.vault_generic_secret.dev.data["firstname"]
    lastname  = data.vault_generic_secret.dev.data["lastname"]
  }
}

resource "aws_s3_bucket" "examplebucket" {
  bucket = "govtech-demo"
  acl    = "private"
}

resource "aws_s3_bucket_object" "examplebucket_object" {
  key                    = "index.html"
  bucket                 = aws_s3_bucket.examplebucket.id
  content                = data.template_file.index.rendered
  server_side_encryption = "AES256"
}
