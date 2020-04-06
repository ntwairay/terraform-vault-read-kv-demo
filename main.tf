provider "vault" {
  auth_login {
    path = "auth/approle/login"

    parameters = {
      role_id   = var.role_id
      secret_id = var.secret_id
    }
    namespace = "hashicorp/ns_app1"
  }
  namespace = "hashicorp/ns_app1"
  alias     = "ns_base"
}

data "vault_generic_secret" "dev" {
  provider    = vault.ns_base
  path        = var.secret_path
}

data "template_file" "index" {
  template = file("${path.module}/templates/index.tpl")

  vars = {
    firstname = data.vault_generic_secret.dev.data[var.secret_key_1]
    lastname  = data.vault_generic_secret.dev.data[var.secret_key_2]
  }
}

resource "aws_s3_bucket" "examplebucket" {
  bucket = var.s3_bucket
  acl    = "private"
}

resource "aws_s3_bucket_object" "examplebucket_object" {
  key                    = var.s3_key
  bucket                 = aws_s3_bucket.examplebucket.id
  content                = data.template_file.index.rendered
  server_side_encryption = "AES256"
}
