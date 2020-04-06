provider "vault" {
  auth_login {
    path = "auth/aws/login"

    parameters = {
      role = "dev-role"
      iam_http_request_method = "POST"
      iam_request_body = "QWN0aW9uPUdldENhbGxlcklkZW50aXR5JlZlcnNpb249MjAxMS0wNi0xNQ=="
      iam_request_url = "aHR0cHM6Ly9zdHMuYW1hem9uYXdzLmNvbS8="
      iam_request_headers = "eyJDb250ZW50LUxlbmd0aCI6IFsiNDMiXSwgIlgtVmF1bHQtQVdTLUlBTS1TZXJ2ZXItSUQiOiBbInZhdWx0LnNlcnZpY2UuY29uc3VsIl0sICJYLUFtei1EYXRlIjogWyIyMDIwMDQwNlQwNTMxMzlaIl0sICJVc2VyLUFnZW50IjogWyJCb3RvY29yZS8xLjEzLjM2IFB5dGhvbi8yLjcuMTYgTGludXgvNC4xNC4xNzMtMTM3LjIyOC5hbXpuMi54ODZfNjQiXSwgIlgtQW16LVNlY3VyaXR5LVRva2VuIjogWyJJUW9KYjNKcFoybHVYMlZqRUpYLy8vLy8vLy8vL3dFYURtRndMWE52ZFhSb1pXRnpkQzB5SWtZd1JBSWdVVmlLNGExQkpuR29xQUk2b21tMXpBSkI2SkxuN0tGS1lIUmsxTjk0NDg4Q0lEV1dGSUVRQWtrWjdsMEo0Ty9RRWdrM0Nmd0NqQlAzdFA0anNoSU96eVlSS3NjRENKNy8vLy8vLy8vLy93RVFBUm9NTlRjNE5qRXlNVEV4T1RRMklneExkdkR0U3gzRlpXbDIwMXNxbXdOQTdSdHJkWXB1cEJWNDljQWN2a0FmVmtVWmZnNG1IVWdpeDFhNzc3Q05jNzdqT21wdVBKZnNWK2UxdTRZdHA0VnZHa0JwdFdMcVF1UU92TFBSeTRYNkZUOUw2S1JFVWVxVWtUMG9zemc5cld2RTBpR1ROZWdXTDcrTlVRTDdNbWtBazdQZ05zUVBCcHM4SkhWYWgvS2VuejVFdWhQS0lidmFkTDJVSUltRjNDNUNqczdERXZGZzlTV2E2TkxVK1BDeFZrU2JTRUdZOUo5RVNkOGxmL3VXSzVJbjN4TDVJaUZuMHlZTVAxWnd0bktZcCtXWURxNjRVTi9jTUF6bFVHaStPM1JqSmFsdGY2S0U3MjJaNWtYeGlqMXlVcm95em03ZHlkZG8zQWNZa0dYOHNnNHZNU0FqOFp3SGp1b0F6VFQ4YnRUMjl2ZXoxNWRyTm44UURkdUxuMlVCSEpmUzdFN0F4bGtzbVRtK3lDRjhTYVRoU2hHM2dwVHpEbXpJT3NkbmJEak1Ka2JDcnRYNjdpdE1TYmMrVzVBelV6Rms1N2dBQTg3dlp3Ym10NVJtQUR5bWxBMTEzRUR6NTBJdVZ6clhZNWlJMVpsa0tGbnhZcjlwampTZDRJaEo2MVNFZDRKN2xmeE8yS0tDeE1ZV1UvK2tZRjBrVEFJaWlsbk5iRkRBSUtDTE1YaUViUlFtWWZnT3ZmMTFqbmpDcmZpM3JhRExES1l3eHZlcTlBVTY3QUZOT01hdUlDUmg2ejRMSVAyeVNUZGpETmRtcWVLVit5a1d5MXczRGE3MENWQ2RYQ3dsaHlzeXpSb2puWHBZUi9BV1FIWXBUK0pLaXB2UWo5M0pSdWdKWWJGbWNDT2tPa3BIQWlGY0QwOG1ZbVpkUFJvdDFtK2pSNFo5OUlxMU15TWg3RnRPTzlxZUdZS2xkT2lieWx5VlBLbTNQMzdNUEtWT0pKTG1nUUJMSTJoR3pFQnEzNjBuMU1GREE1cEc0MGI2MWFQWVFhczVrWUtoVlBrUytESStLQ1hRUUU1VWtMNS9yaHFkZW13ZURPYk1UajJDSmZSdGNraUYyZ3czMlg4SkFSb2lETW1VaUpRSTBYTHN6VFFjWUxBZzVIUU5Ua1k3WXBMUHZKRGhJWGdPU0VHNlF2UU1FRXVUSVE9PSJdLCAiQ29udGVudC1UeXBlIjogWyJhcHBsaWNhdGlvbi94LXd3dy1mb3JtLXVybGVuY29kZWQ7IGNoYXJzZXQ9dXRmLTgiXSwgIkF1dGhvcml6YXRpb24iOiBbIkFXUzQtSE1BQy1TSEEyNTYgQ3JlZGVudGlhbD1BU0lBWU5ON1lGSkZKQ1c3TkxHUy8yMDIwMDQwNi91cy1lYXN0LTEvc3RzL2F3czRfcmVxdWVzdCwgU2lnbmVkSGVhZGVycz1jb250ZW50LXR5cGU7aG9zdDt4LWFtei1kYXRlO3gtYW16LXNlY3VyaXR5LXRva2VuO3gtdmF1bHQtYXdzLWlhbS1zZXJ2ZXItaWQsIFNpZ25hdHVyZT03ZGYwOGFjYTdhNDBhZTgyYTA5MDBiNmQyZWRiZTdkMjg2MTEzMmEyYjlhZGMzZWQ4ZjdiMTEyYWFlODI1YWZiIl19"
    }
    namespace = "hashicorp"
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
