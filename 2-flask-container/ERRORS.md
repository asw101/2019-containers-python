# ERRORS

```
az group deployment create --resource-group $RESOURCE_GROUP --template-file azuredeploy.json     --parameters cpuCores=0.25 memoryInGb=0.25
Deployment failed. Correlation ID: 816738a9-e9dd-43fc-aaf6-87c38703e076. {
  "error": {
    "code": "MemoryRequirementNotTimesOfOneTenthGB",
    "message": "The memory requirement is '0.25' in container 'aci1-1' of container group 'aci1'. The memory requirement should be in incrememts of 0.1 GB."
  }
}
```