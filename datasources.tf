data "aws_security_group" "hw1" {
    filter {
        name = "group-name"
        values = ["hw-security-group1"]
    }
    filter {
        name = "vpc-id"
        values = ["vpc-09df3dd1cdfce8584"]
    }
}

data "aws_security_group" "hw2" {
    filter {
        name = "group-name"
        values = ["hw-security-group2"]
    }
    filter {
        name = "vpc-id"
        values = ["vpc-09df3dd1cdfce8584"]
    }
}