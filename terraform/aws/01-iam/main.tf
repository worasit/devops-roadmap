resource "aws_iam_policy" "s3-reader" {
  name   = "S3ReadOnly-Terraform"
  policy = file("s3-readonly.json")
  tags   = {
    Description = "Em-test Terraform"
  }
}

resource "aws_iam_group" "em-test-group" {
  name = "em-test-group"
}

resource "aws_iam_group_policy_attachment" "em-test-group-policy" {
  group      = aws_iam_group.em-test-group.name
  policy_arn = aws_iam_policy.s3-reader.arn
  depends_on = [
    aws_iam_policy.s3-reader,
    aws_iam_group.em-test-group
  ]
}

resource "aws_iam_user" "em-test-users" {
  name     = each.value
  for_each = var.em-test-project-users
  tags     = {
    Description = "Em-test Terraform"
  }
}

resource "aws_iam_user_group_membership" "em-test-add-user-to-group" {
  groups     = [aws_iam_group.em-test-group.name]
  user       = each.value
  for_each   = var.em-test-project-users
  depends_on = [
    aws_iam_group.em-test-group,
    aws_iam_user.em-test-users
  ]
}







