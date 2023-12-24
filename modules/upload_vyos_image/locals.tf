
data "local_file" "http_getRelease" {
  count    = fileexists("./foo.json") ? 1 : 0
  filename = "./foo.json"

}

data "http" "http_getRelease" {
  url = "https://api.github.com/repos/r-teller/vyos/releases/latest"
  request_headers = {
    accept        = "application/json"
    If-None-Match = try()
  }
}

resource "local_file" "http_getRelease_2" {
  filename = "./foo.json"
  content  = jsonencode(data.http.http_getRelease)
}


# output "http_getRelease" {
#   value = data.http.http_getRelease
# }

# data "github_release" "latest" {
#   count       = var.release_latest ? 1 : 0
#   repository  = "vyos"
#   retrieve_by = "latest"
#   owner       = "r-teller"
# }

# data "github_release" "tagged" {
#   count       = var.release_latest ? 0 : 1
#   repository  = "vyos"
#   retrieve_by = "tag"
#   owner       = "r-teller"
#   release_tag = "v1.3.6"
# }


locals {
  github_release       = { release_tag = "v1.3.5" }
  browser_download_url = "https://github.com/r-teller/vyos/releases/download/v1.3.5/vyos-equuleus-image-gce.tar.gz"
  # github_release       = try(data.github_release.latest[0], data.github_release.tagged[0])
  # browser_download_url = [for asset in local.github_release.assets : asset.browser_download_url if asset.name == "vyos-equuleus-image-gce.tar.gz"][0]
}
