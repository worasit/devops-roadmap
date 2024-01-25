variable "filename" {
  default = "./pets.txt"
}

variable "content" {
  default = "My favorite pet it Mrs. Whiskers"
}

variable "prefix" {
  default     = ["Mr", "Mrs", "Sir"]
  type        = list(string)
  description = "Represents a collection of prefix Mr, Mrs and Sir"
}

variable "separator" {
  default = "."
}

variable "length" {
  default = "2"
}

variable "file-content" {
  type    = map(string)
  default = {
    "statement1" = "We love pets!"
    "statement2" = "We love animals!"
  }
}

variable "bella" {
  type = object({
    name         = string
    color        = string
    age          = number
    food         = list(string)
    favorite_pet = bool
  })

  default = {
    name         = "bella"
    color        = "brown"
    age          = 7
    food         = ["fish", "chicken", "turkey"]
    favorite_pet = true
  }
}


variable "kitty" {
  type    = tuple([string, number, bool])
  default = ["cat", 7, true]
}
