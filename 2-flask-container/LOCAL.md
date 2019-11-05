# LOCAL

```bash
az acr login -n ${REGISTRY_NAME}
docker pull ${REGISTRY_NAME}.azurecr.io/hello-flask:latest
docker tag ${REGISTRY_NAME}.azurecr.io/hello-flask:latest aaronmsft/hello-flask
docker push aaronmsft/hello-flask
```
