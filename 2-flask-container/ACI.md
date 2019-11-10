# Azure Container Instances (ACI)

```bash
# get our container registry password
REGISTRY_PASSWORD=$(az acr credential show -n $REGISTRY_NAME | jq -r .passwords[0].value)

# create container instance
az container create --resource-group $RESOURCE_GROUP --location $LOCATION \
    --name aci${RANDOM_STR} \
    --image "${REGISTRY_NAME}.azurecr.io/${CONTAINER_IMAGE}" \
    --registry-login-server "${REGISTRY_NAME}.azurecr.io" \
    --registry-username $REGISTRY_NAME \
    --registry-password $REGISTRY_PASSWORD \
    --cpu 1 \
    --memory 1 \
    --ports 80 \
    --environment-variables LISTEN_PORT=80 \
    --dns-name-label aci${RANDOM_STR}

# show container events
az container show -g $RESOURCE_GROUP -n aci${RANDOM_STR} | jq .containers[0].instanceView.events[]

# get the fully qualified domain of our container instance, set --dns-name-label above
CONTAINER_INSTANCE_FQDN=$(az container show -g $RESOURCE_GROUP -n aci${RANDOM_STR} | jq -r .ipAddress.fqdn)

# test the service in the terminal via curl
curl "${CONTAINER_INSTANCE_FQDN}"

# you may also open the following URL in your web browser
echo "http://${CONTAINER_INSTANCE_FQDN}"

# load test with hey
hey "http://${CONTAINER_INSTANCE_FQDN}"
```
