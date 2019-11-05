# AZURE-ACTIONS

1. <https://github.com/features/actions>.
1. Sign-in + 2FA.
1. Create a new repository: <https://github.com/new>.
1. Click on `Actions` tab.
1. Click `Set up a workflow yourself`.
1. Edit `.github/workflows/main.yml`.
1. Click `Start commit`.
1. Click `Commit new file`.
1. Click `Actions` tab.
1. Click workflow name (`CI`).
1. Click `Settings` tab.
1. Click `Secrets` on the left.
1. Click `Add a new secret`.
1. Type `Name:`, Type `Value:`
1. Open <https://portal.azure.com>
1. Create a new `Resource Group` called `191000-actions`.
1. Open `Cloud Shell`.
1. Paste the following snippet:
    ```bash
    SUBSCRIPTION_ID=$(az account show | jq -r .id)
    RESOURCE_GROUP='191000-actions'
    LOCATION='eastus'
    SP_NAME='http://191000-github-actions'

    # create service principal
    SP=$(az ad sp create-for-rbac --sdk-auth --skip-assignment -n $SP_NAME)
    SP_ID=$(echo $SP | jq -r .clientId)
    # create resource group
    az group create -n $RESOURCE_GROUP -l $LOCATION
    # assign contributor role to service principal at resource group scope
    az role assignment create --assignee $SP_ID --role Contributor \
        --scope "/subscriptions/${SUBSCRIPTION_ID}/resourceGroups/${RESOURCE_GROUP}"
    # output service principal
    echo $SP
    ```
1. Copy the `Service Principal` (JSON) to the clipboard.
1. Open the `Resource Group` and click `Access control (IAM)`.
1. Click `Add` > `Add role assignment`.
1. Type `Role: Contributor`. 
1. Select: `191000-github`.
1. Click `Save`.
1. Open GitHub repo Secrets. Add a secret named `AZURE_CREDENTIALS`.
1. Paste `Service Principal` (JSON) into `Value:`.
1. Click `Add Secret`.
1. Open <https://github.com/Azure/actions>.
1. Copy the following snippet:
    ```yaml
    - uses: azure/actions/login@v1
      with:
        creds: ${{ secrets.AZURE_CREDENTIALS }}
    ```
1. Open respository and Edit `.github/workflows/main.yml`.
1. Paste the above snippet.
1. Add snippet:
    ```yaml
    - name: az group show
      env:
        RESOURCE_GROUP: 191000-actions
      run: |
        az group show --name $RESOURCE_GROUP
    ```
1. Commit changes.
1. Click on `Actions`.
1. Click on Workflow (`CI`).
1. Click on Step (`az group show`).
1. Fork repo and add a new `Secret` (as above).
