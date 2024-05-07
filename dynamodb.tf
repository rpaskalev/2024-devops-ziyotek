resource "aws_dynamodb_table" "ziyotek_devops_dynamodb_lock" { 

  name     = "terraform-lock1" 

  hash_key = "LockID" 

  read_capacity = "20" 

  write_capacity = "20" 

  

  attribute { 

    name = "LockID" 

    type = "S" 

 

  } 

} 