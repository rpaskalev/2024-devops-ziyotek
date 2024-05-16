resource "aws_iam_role" "ec2_role-mr" {
  name = "ec2_role_to_test-mr"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazon.com"
        }
      },
    ]
  })
}

resource "aws_iam_policy" "e2_policy" {
  name        = "test_policy_mr_ec2_s3_access"
  path        = "/"
  description = "My test policy"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "s3:*",
          #"ec2:Describe*",
        ]
        Effect = "Allow"
        Resource = [
          "${aws_s3_bucket.ziyotek_bucket.id}",
          "${aws_s3_bucket.ziyotek_bucket.id}*/"
        ]
      },
    ]
  })
}

resource "aws_iam_policy_attachment" "test-attach" {
  name = "test-attachment "
  #users      = [aws_iam_user.user.name]
  roles = [aws_iam_role.ec2_role-mr.name] #[aws_iam_role.role.name]
  #groups     = [aws_iam_group.group.name]
  policy_arn = aws_iam_policy.e2_policy.arn #aws_iam_policy.policy.arn
}