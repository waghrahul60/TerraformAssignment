resource "aws_iam_role" "iam_role" {
  name = "${var.environment}-${var.application}-iam-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "iam.amazonaws.com"
        }
      }
    ]
  })
  tags = merge(
    {
      Name        = "${var.environment}-${var.application}-iam-role",
      Environment = var.environment,
      Application = var.application
    },
    var.tags
  )
}

resource "aws_iam_policy" "iam_policy" {
  name   = "${var.environment}-${var.application}-iam-policy"
  policy = file("${path.module}../../../scripts/iam-policies/${var.iam_policy_json_file}")
}


resource "aws_iam_role_policy_attachment" "iam_role_policy_attachment" {
  role       = aws_iam_role.iam_role.name
  policy_arn = aws_iam_policy.iam_policy.arn
}
