resource "aws_iam_role" "NetsellsSecurityEngineer" {
  name = "NetsellsSecurityEngineer"

  assume_role_policy = data.aws_iam_policy_document.saml_trust_policy.json
}

resource "aws_iam_role_policy_attachment" "NetsellsSecurityEngineer-ReadOnly" {
  role       = aws_iam_role.NetsellsSecurityEngineer.name
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}

################################################################
# Allow engineers to connect directly to an EC2 instance via SSM
################################################################
resource "aws_iam_role_policy_attachment" "NetsellsSecurityEngineer-SSMConnect" {
  role       = aws_iam_role.NetsellsSecurityEngineer.name
  policy_arn = aws_iam_policy.ssm_connect[0].arn
  count      = var.role_engineer_ssm_ec2 ? 1 : 0
}

resource "aws_iam_policy" "ssm_connect" {
  name_prefix = "ssm_connect-"
  policy      = data.aws_iam_policy_document.ssm_connect.json
  count       = var.role_engineer_ssm_ec2 ? 1 : 0
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

################################################################
# Allow engineers to connect directly to an ECS task via SSM
################################################################
resource "aws_iam_role_policy_attachment" "NetsellsSecurityEngineer-ECSConnect" {
  role       = aws_iam_role.NetsellsSecurityEngineer.name
  policy_arn = aws_iam_policy.ecs_connect[0].arn
  count      = var.role_engineer_ssm_ecs ? 1 : 0
}

resource "aws_iam_policy" "ecs_connect" {
  name_prefix = "ecs_connect-"
  policy      = data.aws_iam_policy_document.ecs_connect.json
  count       = var.role_engineer_ssm_ecs ? 1 : 0
}

data "aws_iam_policy_document" "ecs_connect" {
  statement {
    actions = [
      "ecs:ExecuteCommand",
    ]
    resources = [
      "arn:aws:ecs:*:*:cluster/*",
      "arn:aws:ecs:*:*:task/*/*"
    ]
  }
}

################################################################
# Allow engineers to manage ECS env files in S3
################################################################

resource "aws_iam_role_policy_attachment" "NetsellsSecurityEngineer-ManageEnv" {
  role       = aws_iam_role.NetsellsSecurityEngineer.name
  policy_arn = aws_iam_policy.manage_env[0].arn
  count      = var.role_engineer_edit_ecs_env ? 1 : 0
}
resource "aws_iam_policy" "manage_env" {
  name_prefix = "manage_env-"
  policy      = data.aws_iam_policy_document.manage_env.json
  count       = var.role_engineer_edit_ecs_env ? 1 : 0
}

data "aws_iam_policy_document" "manage_env" {
  statement {
    actions = [
      "s3:PutObject",
    ]
    resources = ["arn:aws:s3:::*-ecs-env/*.env"]
  }
}

################################################################
# Allow engineers to kill ECS tasks
################################################################

resource "aws_iam_role_policy_attachment" "NetsellsSecurityEngineer-ManageHosting" {
  role       = aws_iam_role.NetsellsSecurityEngineer.name
  policy_arn = aws_iam_policy.manage_hosting[0].arn
  count      = var.role_engineer_manage_hosting ? 1 : 0
}

resource "aws_iam_policy" "manage_hosting" {
  name_prefix = "manage_hosting-"
  policy      = data.aws_iam_policy_document.manage_hosting.json
  count       = var.role_engineer_manage_hosting ? 1 : 0
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
