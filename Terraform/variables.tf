###################
# App Service Plan
###################
variable "rg_name" {
  description = "Name of the Resource Group"
}
###################
# App Service Plan
###################
variable "asp_name" {
  description = "Name of the App Service Plan"
}
variable "asp_tier" {
  description = "Tier of the App Service Plan"
}
variable "asp_size" {
  description = "Size of the App Service Plan"
  default = "B1"
}

###################
# Web App
###################
variable "app_name" {
  description = "Name of the Web Application"
}
