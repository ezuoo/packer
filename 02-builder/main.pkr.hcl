################################################
# Without name
################################################
build {
  sources = [
    "source.null.one",
    "source.null.two"
  ]
}

################################################
# With name
################################################
build {
  name = "jawn"

  sources = [
    "source.null.one",
    "source.null.two"
  ]
}

################################################
# Fill-in
################################################
build {
  name = "Fill-in-jawn"

  source "null.one" {
    name = "terraform"
  }

  source "null.two" {
    name = "vault"
  }
}