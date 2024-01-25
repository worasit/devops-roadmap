resource "local_file" "pet" {
  filename = var.filename
  content  = var.file-content["statement2"]
}

resource "random_pet" "my-pet" {
  prefix    = var.prefix[0]
  separator = var.separator
  length    = var.length
}

