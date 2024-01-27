locals {
  items_json_data = file("items.json")
  items_tf        = jsondecode(local.items_json_data)
}