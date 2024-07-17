###########################
#       _      _          #
#    __| |__ _| |_ __ _   #
#   / _` / _` |  _/ _` |  #
#   \__,_\__,_|\__\__,_|  #
#                         #
########################### 


data "azuread_client_config" "current" {}

output "object_id" {
  value = data.azuread_client_config.current.object_id
}