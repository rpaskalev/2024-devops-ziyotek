resource "aws_db_instance" "default0" {
  allocated_storage      = 10
  db_name                = "ziyo-mr"
  engine                 = "postgres"
  engine_version         = "12.15"
  instance_class         = "db.t3.micro"
  username               = "ziyo_user-michaelrustam"
  password               = aws_ssm_parameter.foo-mr.value
  parameter_group_name   = "default.postgres12"
  skip_final_snapshot    = true
  db_subnet_group_name   = aws_db_subnet_group.ziyo_subg07.id
  vpc_security_group_ids = [aws_security_group.ziyo_security_group.id]
  storage_type           = "gp2"
}

resource "aws_db_subnet_group" "ziyo_subg07" {
  name       = "ziyo_sub_group-077"
  subnet_ids = [aws_subnet.ziyo_subnet_public.id, aws_subnet.ziyo_subnet_private.id]
}

resource "random_password" "password" {
  length  = 10
  special = false
}

resource "aws_ssm_parameter" "foo-mr" {
  name  = "ziyo_2024_class_rds_pass-mr"
  type  = "SecureString"
  value = random_password.password.result
  # key_id = data.aws_kms_key.by_alias.id
}

# # resource "aws_kms_key" "ssm_key" {
# #   description             = "KMS for encrypting ssm params"
# #   deletion_window_in_days = 10
# # }