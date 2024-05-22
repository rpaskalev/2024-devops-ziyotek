resource "aws_iam_role" "ec2_role" {
  name = "testing-lifecycles" #"ec2_role_to_test_s3_access"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
  lifecycle {
     create_before_destroy = true
  }
}

resource "aws_iam_policy" "ec2_policy" {
  name        = "test_policy_for_ec2_for_s3_access"
  path        = "/"
  description = "My ec2 test policy"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "s3:PutObject"
        ]
        Effect   = "Allow"
        Resource = [
            "${aws_s3_bucket.ziyotek_bucket.arn}",
            "${aws_s3_bucket.ziyotek_bucket.arn}/*"
        ]
      }
    ]
  })
}

resource "aws_iam_policy_attachment" "test-attach" {
  name       = "test-attachment"
  roles      = [aws_iam_role.ec2_role.name]
  policy_arn = aws_iam_policy.ec2_policy.arn
}

resource "aws_iam_instance_profile" "test_profile" {
  name = "test_profile_for_ec2_s3_access"
  role = aws_iam_role.ec2_role.name
}
