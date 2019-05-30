[cmdletbinding()]
param (
  [ValidateSet('local', 'dev', 'qa', 'prod')]
  [string]
  $EnvironmentCode = 'local'
)

Begin {
  Install-Module PoshArmDeployment -Repository PSGallery -Force
  Import-Module -Name PoshArmDeployment
  $Config = Get-EnvironmentConfiguration -EnvironmentCode $EnvironmentCode
  Import-Module $PSScriptRoot\Backup-Storage-Accounts.psm1 -Force
  $ErrorActionPreference = 'stop'
}

Process {

  $destStorageAccountName = $Config.properties.destStorageAccountName
  $destResourceGroup = $Config.properties.destResourceGroup
  $destCtx = Get-StorageAccountContext -StorageAccountName $destStorageAccountName -StorageAccountResourceGroup $destResourceGroup
  
  foreach ($srcStorageAccount in $Config.properties.srcStorageAccounts) {    
    $srcStorageAccountName = $srcStorageAccount.storageAccountName
    $srcResourceGroup = $srcStorageAccount.resourceGroup
    $srcCtx = Get-StorageAccountContext -StorageAccountName $srcStorageAccountName -StorageAccountResourceGroup $srcResourceGroup
    Backup-StorageAccount -SrcCtx $srcCtx -DestCtx $destCtx
  }
}

