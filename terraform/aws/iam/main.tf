resource "aws_iam_user" "admin-user" {
  name     = each.value
  for_each = var.em-test-project-users
  tags     = {
    Description = "Em-test Terraform"
  }
}

resource "aws_iam_policy" "s3-reader" {
  name   = "S3ReadOnly-Terraform"
  policy = file("s3-readonly.json")
}

resource "aws_iam_user_policy_attachment" "lucy-policy-attachment" {
  policy_arn = aws_iam_policy.s3-reader.arn
  user       = aws_iam_user.admin-user[each.value].name
  for_each   = var.em-test-project-users
}