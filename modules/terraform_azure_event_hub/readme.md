# Azure Event Hubs

Azure Event Hubs is a cloud native data streaming service that can stream millions of events per second, with low latency, from any source to any destination. Event Hubs is compatible with Apache Kafka, and it enables you to run existing Kafka workloads without any code changes.

For more information refer the page: https://learn.microsoft.com/en-us/azure/event-hubs/event-hubs-about

## Required Input variables

| Variable Name  | Type  | Is it Required to Pass  |
|----------------|-------|:-----------------------:|
| eventhub_namespace | string | Yes |
| location | string | Yes |
| resource_group_name | string | Yes |
| eventhub_name | string | Yes |
