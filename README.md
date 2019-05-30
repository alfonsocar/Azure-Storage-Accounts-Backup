# Azure-Storage-Accounts-Backup

## Azure Devops CI build running Azcopy

### Configure Json file with your environment data.

Replace the placeholders by the following values from Azure portal:

- {azure-environment-code}: the environment code in azure

- {key-vault-name}: the name of the key vault generated in your security resource group

- {sf-cluster-name}: the name of the service fabric cluster generated in your infrastructure resource group

- {storage-account-name-1}: the name of the storage account in the resourcegroup you want to backup

- {storage-account-name-2}: the name of the storage account in the resourcegroup you want to backup

- {destination-storage-account-name}: the name of the storage account in the backup resourcegroup

- {resource-group-name-1}: the name of the resourcegroup you want to backup

- {resource-group-name-2}: the name of the resourcegroup you want to backup

- {destination-resource-group-name}: the name of the backup resourcegroup

### Running powershell script locally.

- Make sure you have AzCopy 7.3 installed.
- Make sure you have signed in to your azure and selected the proper subscription.
- Run the following script in powershell as admin:

  Backup-Storage-Accounts.ps1 -EnvironmentCode "{azure-environment-code}"
