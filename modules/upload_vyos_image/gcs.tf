# resource "random_id" "id" {
#   byte_length = 4
# }

# resource "null_resource" "download_file" {
#   # This provisioner will run when the download url changes.
#   triggers = {
#     number               = 1
#     browser_download_url = local.browser_download_url
#   }

#   provisioner "local-exec" {
#     command = "curl -L -o ./vyos-equuleus-image-gce.tar.gz ${local.browser_download_url}"
#   }
# }

# resource "local_file" "vyos_image" {
#   source   = "./vyos-equuleus-image-gce.tar.gz"
#   filename = "vyos-equuleus-image-gce.tar.gz"

#   lifecycle {
#     replace_triggered_by = [null_resource.download_file]
#   }

#   depends_on = [
#     null_resource.download_file
#   ]
# }

# resource "google_storage_bucket" "vyos_bucket" {
#   project  = var.project_id
#   name     = format("gce-vyos-image-%s-%s", replace(local.github_release.release_tag, ".", "-"), random_id.id.hex)
#   location = var.gcs_region
# }

# # resource "google_storage_bucket_object" "vyos_image" {
# #   name   = "vyos-equuleus-image-gce.tar.gz"
# #   source = "./vyos-equuleus-image-gce.tar.gz"

# #   bucket = google_storage_bucket.vyos_bucket.id

# #   lifecycle {
# #     replace_triggered_by = [null_resource.download_file]
# #   }

# #   depends_on = [
# #     null_resource.download_file
# #   ]
# # }
