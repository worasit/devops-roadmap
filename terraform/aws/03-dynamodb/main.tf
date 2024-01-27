resource "aws_dynamodb_table" "cars" {
  hash_key     = "VIN"
  name         = "cars"
  billing_mode = "PAY_PER_REQUEST"
  attribute {
    name = "VIN"
    type = "S"
  }
}


resource "aws_dynamodb_table_item" "car-items" {
  for_each   = local.items_tf
  table_name = aws_dynamodb_table.cars.name
  hash_key   = aws_dynamodb_table.cars.hash_key
  item       = jsonencode(each.value)
}