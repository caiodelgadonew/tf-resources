resource "aws_iam_user" "users" {
  count = length(var.users)
  name = var.users[count.index]
}

resource "aws_iam_group" "admins" {
  name = "${var.name}-admins"
}

resource "aws_iam_group_membership" "admins" {
  name = "user-admins"
  users = aws_iam_user.users[*].name
  group = aws_iam_group.admins.name
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_group_policy_attachment" "admin" {
  group      =  aws_iam_group.admins.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

resource "aws_iam_role" "admin" {
  name = "${var.name}-admin-role"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

resource "aws_iam_user" "app" {
  name = var.name
}

data "aws_iam_policy_document" "read_only_s3" {
  statement {
    actions = [
      "s3:ListBucket",
      "s3:*Object"
    ]
    resources = [ aws_s3_bucket.app_bucket.arn ]
  }
}

resource "aws_iam_user_policy" "app_bucket" {
  name = "${var.name}-bucket-rw"
  user = aws_iam_user.app.name
  policy = data.aws_iam_policy_document.read_only_s3.json
}
