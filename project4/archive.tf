data "archive_file" "zip_file" {
  type        = "zip"
  output_path = "${path.module}/files/files.zip"
  source_file = "${path.module}/files/main.js"
}