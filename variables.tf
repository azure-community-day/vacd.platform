variable "client_id" {
  description = "Application Id of the Service Principal that will deploy the IaC"
}
variable "client_secret" {
  description = "Secret of the Service Principal that will deploy the IaC"
}
variable "tenant_id" {
  description = "Tenant Id of the subscription"
}
variable "subscription_id" {
  description = "Subscription Id where the IaC will be deployed"
}
###################
# App Service Plan
###################
variable "rg_name" {
  description = "Name of the Resource Group"
  default     = "CommunityDayRSG"
}
###################
# App Service Plan
###################
variable "asp_name" {
  description = "Name of the App Service Plan"
  default     = "api-github-appserviceplan"
}
variable "asp_tier" {
  description = "Tier of the App Service Plan"
  default     = "Standard"
}
variable "asp_size" {
  description = "Size of the App Service Plan"
  default     = "S1"
}

###################
# Web App
###################
variable "app_name" {
  description = "Name of the Web Application"
  default     = "api-github-azurecommunityday"
}
