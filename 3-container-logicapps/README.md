# 3. README

```bash
cd 3-container-logicapps/

# variables
RESOURCE_GROUP='191100-python'
REGISTRY_IMAGE='hello-flask:latest'
REGISTRY_JSON=$(az acr list -g $RESOURCE_GROUP | jq -r .[0])
REGISTRY_NAME=$(echo $REGISTRY_JSON | jq -r .name)
REGISTRY_SERVER=$(echo $REGISTRY_JSON | jq -r .loginServer)
REGISTRY_PASSWORD=$(az acr credential show -n $REGISTRY_NAME | jq -r .passwords[0].value)

# substitute values
cat logicapp.json \
    | jq '.definition.actions.Create_container_group.inputs.body.properties.containers[0].properties.image = "'${REGISTRY_NAME}'.azurecr.io/'${REGISTRY_IMAGE}'"' \
    | jq '.definition.actions.Create_container_group.inputs.body.properties.imageRegistryCredentials = {"server":"'${REGISTRY_SERVER}'", "username":"'${REGISTRY_NAME}'", "password":"'${REGISTRY_PASSWORD}'"}' \
    > output.json

```
