provider "vault" {
  namespace = "hashicorp"
  alias     = "ns_base"
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