variable "aws_region" {
  default = "eu-west-2"
  type    = string
}

variable "role_engineer_edit_ecs_env" {
  default = false
  type    = bool
}

variable "role_engineer_ssm_ecs" {
  default = false
  type    = bool
}

variable "role_engineer_ssm_ec2" {
  default = false
  type    = bool
}

variable "role_engineer_manage_hosting" {
  default     = true
  type        = bool
  description = "Allows engineers to kill ECS tasks"
}
