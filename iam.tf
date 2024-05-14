resource "aws_iam_role" "ec2_role" {
    name = "ec2_role_to_test" 
    assume_assume_role_policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
            {
                Action  = "sts:AssumeRole"
                Effect = "Allow"
                Sid = ""
                Principal = {
                    Service = "ec2.amazon.com"
                }
            },
        ]
    }) 
}