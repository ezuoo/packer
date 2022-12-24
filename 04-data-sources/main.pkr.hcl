data "amazon-secretsmanager" "jawn" {
  name = "jawn"
  key  = "test"
}

build {
  name = "jawn-packer"

  source "amazon-ebs.ubuntu" {
    name     = "nginx"
    ami_name = "jawn-packer-nginx"
  }

  provisioner "shell" {
    inline = [
      "sudo apt-get update",
      "echo Secret it ${data.amazon-secretmanager.jawn.value}"
    ]
  }

  provisioner "file" {
    source      = "${path.root}/files/index.html"
    destination = "/tmp/index.html"
  }

  provisioner "shell" {
    inline = [
      "echo ${source.name} and ${source.type}",
      "whoami",
      "sudo apt-get install -y nginx",
      "sudo cp /tmp/index.html /var/www/html/index.html"
    ]
  }

  provisioner "breakpoint" {
    disable = false
    note    = "디버깅"
  }
}