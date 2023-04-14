locals {
  files_to_watch = setunion(flatten(
    [for pattern in var.files_to_watch : fileset(var.root_dir, pattern)]
  ))
}

data "archive_file" "this" {
  type        = "zip"
  source_dir  = "${var.root_dir}/build/"
  output_path = "${var.root_dir}/build.zip"

  depends_on = [
    null_resource.this
  ]
}

resource "null_resource" "this" {
  triggers = length(local.files_to_watch) > 0 ? {
    for filename in local.files_to_watch : filename => filemd5("${var.root_dir}/${filename}")
    } : {
    always = timestamp()
  }

  provisioner "local-exec" {
    working_dir = var.root_dir
    command     = var.build_command
  }
}

