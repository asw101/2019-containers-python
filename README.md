# aka.ms/pycon-ca-2019

## Visual Studio Online

1. Open <https://aka.ms/vso-login> in your browser. This will redirect you to the login page for <https://online.visualstudio.com>. [[1]](images/image-001a.png)
1. Click `Sign in` and enter the **email** you have been provided. [[1]](images/image-002a.png) [[2]](images/image-003a.png). Click `Next` and enter the **password** you have been provided. [[3]](images/image-004a.png)
1. _If prompted_ click `Accept` on the `Permissions requested` screen for `Visual Studio Services Client`. [[1]](images/image-005a.png)
1. Click `Create environment`. [[1]](images/image-006a.png)
1. Under `Create a Billing Plan` click `Advanced Options`. [[1]](images/image-007a.png)
1. Under `Resource Group` you will need to enter `Group-N`, where **N** is the **number** in your email. For example, if your login email is `user-75@azrhack.onmicrosoft.com`, you should enter `Group-75`. [[1]](images/image-009a.png). You only have to do this step *once*.
1. Under `Create Environment` enter `Environment Name`: `my-vso` (this can be anything). [[1]](images/image-010a.png). [[2]](images/image-011a.png)
1. Under `Git Repository`: enter `asw101/2019-python-containers`. [[1]](images/image-011a.png)
1. Click `Create`.
1. You can see the environment `my-vso` will have been created. It will say `Creating`. [[1]](images/image-013a.png)
1. When the status is *green* and says `Available` you can click on `my-vso` or `Connect` from the menu. [[1]](images/image-014a.png)
1. Visual Studio Online will open. [[1]](images/image-015a.png)
1. The [Integrated Terminal]() with the title `1. VS Online` will appear. This is where various tools are installed automatically on environment creation. 
1. This terminal is `Read Only`. You must create a new one with `+` or `Cmd/Ctrl+Shift-~`. It will have the title `bash`. [[1]](images/image-017a.png)
1. The [Azure CLI]() (az) is pre-installed. Type `az login` to login to Azure.
1. You will be prompted to open <https://microsoft.com/devicelogin> and enter a code. Copy the code and `Cmd/Ctrl+Click` the URL or open the URL in a new window. [[1]](images/image-018a.png) [[1]](images/image-019a.png)
1. Paste the code under `Enter code` > `Code:`. [[1]](images/image-020a.png)
1. Under `Pick the account`, click the account you have already logged into (e.g. `user-75@azrhack.onmicrosoft.com`). [[1]](images/image-021a.png)
1. Close this browser window when you see the `You have signed in...` message and return to Visual Studio Online. [[1]](images/image-022a.png)
1. You will see output from the login command in JSON format. [[1]](images/image-023a.png)
1. (Optional) type `az group list` in the [Integrated Terminal]() and you will see JSON formatted output from this command. [[1]](images/image-024a.png)
1. Click on `README.md` on the left hand side and `Cmd/Ctrl+Shift+V` to `Open Preview` or `Right-Click` the file and click `Open Preview`
1. Close the preview window. Now open the [Command Pallete](https://code.visualstudio.com/docs/getstarted/userinterface#_command-palette) with `Cmd/Ctrl+Shift+P` and type `Markdown: Open Preview`. You can now continue with the workshop.
