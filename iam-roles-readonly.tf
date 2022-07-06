resource "aws_iam_role" "NetsellsSecurityReadOnly" {
  name = "NetsellsSecurityReadOnly"

  assume_role_policy = data.aws_iam_policy_document.saml_trust_policy.json
}

resource "aws_iam_role_policy_attachment" "NetsellsSecurityReadOnly-ReadOnly" {
  role       = aws_iam_role.NetsellsSecurityReadOnly.name
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}
