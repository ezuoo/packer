build {
  name = "jawn-packer"

  source "source.null.one" {}

  post-processor "manifest" {}

  post-processors {
    post-processor "shell-local" {
      inline = ["echo Hello World !! > artifact.txt"]
    }

    post-processor "artifice" {
      files = ["artifact.txt"]
    }

    post-processor "compress" {
      output = "log_{{.BuildName}}"
    }
  }

  post-processors {
    post-processor "shell-local" {
      inline = ["echo Finished !"]
    }
  }
}