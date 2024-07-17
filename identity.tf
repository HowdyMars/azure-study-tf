########################################
#    ___    _         _   _ _          #
#   |_ _|__| |___ _ _| |_(_| |_ _  _   #
#    | |/ _` / -_| ' |  _| |  _| || |  #
#   |___\__,_\___|_||_\__|_|\__|\_, |  #
#                               |__/   #
########################################


resource "azuread_group" "az-104-group" {
  display_name     = "${local.prefix}-group"
  mail_enabled     = false
  owners           = [local.client_config.object_id]
  security_enabled = true

  dynamic_membership {
    enabled = true
    rule    = "user.department -eq \"Engineering\""
  }
}

resource "azuread_user" "az-104-user" {
  display_name        = "John Doe"
  given_name          = "John"
  surname             = "Doe"
  user_principal_name = "jdoe@fetchrodi.lol"
  department          = "Engineering"
  password            = "P@ssw0rd1234"
  account_enabled     = false
}