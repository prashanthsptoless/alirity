# Azure App Service Plan

An app service always runs in an App Service plan. In addition, Azure Functions also has the option of running in an App Service plan. An App Service plan defines a set of compute resources for a web app to run.

For more information refer the page: https://learn.microsoft.com/en-us/azure/app-service/overview-hosting-plans

## Required Input variables

| Variable Name  | Type  | Is it Required to Pass  |
|----------------|-------|:-----------------------:|
| app_service_plan_app_name | string | Yes |
| location | string | Yes |
| resource_group_name | string | Yes |

