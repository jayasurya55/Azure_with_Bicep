resource storageaccount 'Microsoft.Storage/storageAccounts@2021-02-01' = {
  name: 'stbicepweudev'
  location: resourceGroup().location
  kind: 'StorageV2'
  sku: {
    name: 'Premium_LRS'
  }
}
// in order to create container we need this blobservices type Microsoft.Storage/storageAccounts/blobServices
resource blobservices1 'Microsoft.Storage/storageAccounts/blobServices@2023-05-01' = {
   name: 'default'    // name should be default always
   parent: storageaccount
}

// for creating containers in storage account
resource storage_container 'Microsoft.Storage/storageAccounts/blobServices/containers@2023-05-01' = {
   name: 'blob-container'
   parent: blobservices1
   properties: {
     publicAccess: 'None'
     metadata: {}
   }
}

