resource "aws_dynamodb_table" "cliente" {
  name           = "cliente"
  billing_mode   = "PROVISIONED"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "cpf"

  attribute {
    name = "cpf"
    type = "S"
  }

  tags = {
    Name        = "cliente-tabela"
    Environment = "production"
  }
}


resource "aws_dynamodb_table" "extractor" {
  name           = "extractor"
  billing_mode   = "PROVISIONED"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "id"


  attribute {
    name = "id"
    type = "S"
  }

  attribute {
    name = "userEmail"
    type = "S"
  }

  global_secondary_index {
    name               = "userEmail-index"
    hash_key           = "userEmail"
    write_capacity     = 10
    read_capacity      = 10
    projection_type    = "ALL"
  }

  ttl {
    attribute_name = "expirationTime"
    enabled        = true
  }

  tags = {
    Name        = "extractor-table"
    Environment = "production"
  }

}

