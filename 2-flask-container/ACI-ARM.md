# Azure Container Instances (ACI) + Azure Resource Manager (ARM)

```bash
cd 2-flask-container/

# basic
az group deployment create --resource-group $RESOURCE_GROUP --template-file azuredeploy.json

# multi-container
az group deployment create --resource-group $RESOURCE_GROUP --template-file azuredeploy.json \
    --parameters cpuCores=0.25 memoryInGb=0.1

# gpu
az group deployment create --resource-group $RESOURCE_GROUP --template-file azuredeploy-gpu.json \
    --parameters aciName=gpu1 gpuCount=1 cpuCores=6 memoryInGb=56

# delete
az container show -g $RESOURCE_GROUP -n aci1
az container delete -y -g $RESOURCE_GROUP -n aci1
```

## Resources
- https://docs.microsoft.com/en-us/azure/container-instances/container-instances-multi-container-group
- https://docs.microsoft.com/en-us/azure/templates/microsoft.containerinstance/2018-10-01/containergroups
- https://docs.microsoft.com/en-us/azure/container-instances/container-instances-multi-container-yaml
- https://azure.microsoft.com/en-us/pricing/details/container-instances/
- https://docs.microsoft.com/en-us/azure/container-instances/container-instances-gpu
- https://github.com/asw101/cloud-snips/tree/master/arm/aci
