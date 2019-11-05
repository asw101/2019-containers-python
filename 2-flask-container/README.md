# 2. README

If you are not yet logged in:

```bash
az login
```

Set some environment variables:

```bash
# RESOURCE_GROUP=$(az group list | jq -r '[.[].name|select(. | startswith("Group-"))][0]')
RESOURCE_GROUP='191100-python'
LOCATION='eastus'
if [ -z "$RANDOM_STR" ]; then RANDOM_STR=$(openssl rand -hex 3); else echo $RANDOM_STR; fi
# RANDOM_STR='8929c6'
REGISTRY_NAME=acr${RANDOM_STR}
CONTAINER_IMAGE='hello-flask:latest'
```

Create the resource group, if required:

```bash
az group create --name $RESOURCE_GROUP --location $LOCATION
```

Now use the Azure CLI (az) to create an Azure Container Registry and build an image in the cloud.

```bash
az acr create -g $RESOURCE_GROUP -l $LOCATION --name $REGISTRY_NAME --sku Basic --admin-enabled true
```

Next run the [az acr build](https://docs.microsoft.com/en-us/cli/azure/acr?#az-acr-build) command, which will push the source code and Dockerfile to the cloud, build the image, and store it in the Azure Container Registry:

```bash
cd 2-flask-container/
az acr build -r $REGISTRY_NAME -t hello-flask --file Dockerfile .
```

The fully-qualified name of the image in your Container Registry is `$REGISTRY_NAME'.azurecr.io/hello-flask:latest'`. Output this with:

```bash
echo "${REGISTRY_NAME}.azurecr.io/hello-flask:latest"
```

To deploy to Azure Container Instances (ACI) via the CLI, see [ACI.md](ACI.md)

## Resources
- https://docs.microsoft.com/en-us/azure/container-registry/container-registry-get-started-azure-cli
