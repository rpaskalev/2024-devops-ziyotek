resource "aws_s3_bucket" "my_hw_bucket"{
    bucket = "sun-ziyotek72"
    //acl = "public-read"
    versioning{
        enabled = true
    }
    server_side_encryption_configuration {
        rule {
            apply_server_side_encryption_by_default {
                sse_algorithm = "AES256"
            }
        }
    }
    object_lock_configuration {
        object_lock_enabled = "Enabled"
        //Cannot have public-read acls with object lock enabled
    }
    tags = {
        Name = "Eric Sun"
    }
}