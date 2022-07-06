# Setup identity provider to allow Google login
resource "aws_iam_saml_provider" "default" {
  name                   = "NetsellsGoogleWorkspace"
  saml_metadata_document = file("files/GoogleIDPMetadata.xml")
}

data "aws_iam_policy_document" "saml_trust_policy" {
  # Security Account
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::249394787319:root"]
    }
  }

  # Google SSO
  statement {
    actions = ["sts:AssumeRoleWithSAML"]

    principals {
      type        = "Federated"
      identifiers = [aws_iam_saml_provider.default.arn]
    }

    condition {
      test     = "StringEquals"
      variable = "SAML:aud"
      values   = ["https://signin.aws.amazon.com/saml"]
    }
  }
}
