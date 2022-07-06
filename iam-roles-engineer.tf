resource "aws_iam_role" "NetsellsSecurityEngineer" {
  name = "NetsellsSecurityEngineer"

  assume_role_policy = data.aws_iam_policy_document.saml_trust_policy.json
}

resource "aws_iam_role_policy_attachment" "NetsellsSecurityEngineer-ReadOnly" {
  role       = aws_iam_role.NetsellsSecurityEngineer.name
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}

resource "aws_iam_role_policy_attachment" "NetsellsSecurityEngineer-SSMConnect" {
  role       = aws_iam_role.NetsellsSecurityEngineer.name
  policy_arn = aws_iam_policy.ssm_connect.arn
}

resource "aws_iam_role_policy_attachment" "NetsellsSecurityEngineer-ECSConnect" {
  role       = aws_iam_role.NetsellsSecurityEngineer.name
  policy_arn = aws_iam_policy.ecs_connect.arn
}

resource "aws_iam_role_policy_attachment" "NetsellsSecurityEngineer-ManageEnv" {
  role       = aws_iam_role.NetsellsSecurityEngineer.name
  policy_arn = aws_iam_policy.manage_env.arn
}

resource "aws_iam_role_policy_attachment" "NetsellsSecurityEngineer-ManageHosting" {
  role       = aws_iam_role.NetsellsSecurityEngineer.name
  policy_arn = aws_iam_policy.manage_hosting.arn
}

# Allows netsells aws:ssm:connect to function
resource "aws_iam_policy" "ssm_connect" {
  name_prefix = "ssm_connect-"
  policy      = data.aws_iam_policy_document.ssm_connect.json
}

data "aws_iam_policy_document" "ssm_connect" {
  statement {
    actions = [
      "ssm:SendCommand",
    ]
    resources = [
      "arn:aws:ec2:*:*:instance/*",
      "arn:aws:ssm:*:*:document/AWS-RunShellScript",
    ]
  }

  statement {
    actions = [
      "ssm:StartSession",
    ]
    resources = [
      "arn:aws:ec2:*:*:instance/*",
      "arn:aws:ssm:*:*:document/AWS-StartSSHSession",
    ]
  }

  statement {
    actions = [
      "ssm:TerminateSession",
    ]
    resources = [
      "arn:aws:ssm:*:*:session/*",
    ]
  }
}

# Allows netsells aws:ecs:connect to function
resource "aws_iam_policy" "ecs_connect" {
  name_prefix = "ecs_connect-"
  policy      = data.aws_iam_policy_document.ecs_connect.json
}

data "aws_iam_policy_document" "ecs_connect" {
  statement {
    actions = [
      "ecs:ExecuteCommand",
    ]
    resources = [
      "arn:aws:ecs:*:*:cluster/",
      "arn:aws:ecs:*:*:task/*/*"
    ]
  }
}

# Allows netsells aws:ecs:manage-env to function
resource "aws_iam_policy" "manage_env" {
  name_prefix = "manage_env-"
  policy      = data.aws_iam_policy_document.manage_env.json
}

data "aws_iam_policy_document" "manage_env" {
  statement {
    actions = [
      "s3:PutObject",
    ]
    resources = ["arn:aws:s3:::*-ecs-env/*.env"]
  }
}

# Allow engineers to interact via the UI
resource "aws_iam_policy" "manage_hosting" {
  name_prefix = "manage_hosting-"
  policy      = data.aws_iam_policy_document.manage_hosting.json
}

data "aws_iam_policy_document" "manage_hosting" {
  statement {
    actions = [
      "ecs:StopTask",
    ]
    resources = [
      "arn:aws:ecs:*:*:task/*/*"
    ]
  }
}
