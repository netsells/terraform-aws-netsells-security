resource "aws_iam_role" "NetsellsSecurityOps" {
  name = "NetsellsSecurityOps"

  assume_role_policy = data.aws_iam_policy_document.saml_trust_policy.json
}

resource "aws_iam_role_policy_attachment" "NetsellsSecurityOps-Admin" {
  role       = aws_iam_role.NetsellsSecurityOps.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}
