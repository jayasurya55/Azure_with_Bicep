resource webApp 'Microsoft.Web/sites@2021-01-15' = {
  name: 'bicep-webapp-weu-dev'
  location: resourceGroup().location
  properties: {
    serverFarmId: resourceId('Microsoft.Web/serverfarms','bicep-appservice-weu-dev') //serverFarmId is app service plan type
  }
}

//in-case your resource is configured in other file give same reference names along with "existing"
resource appInsightsComponents 'Microsoft.Insights/components@2020-02-02' existing = {
  name:  'bicep-appinsights-weu-dev'
}

resource storageaccount 'Microsoft.Storage/storageAccounts@2021-02-01' existing = {
   name: 'stbicepweudev'
}

// adding app settings to my web app 
// create own resource with own reference name  with 'Microsoft.Web/sites/config and respective version
resource webAppsettings 'Microsoft.Web/sites/config@2023-12-01' ={           
   name: 'web'   // name should be 'web' mandatory
   parent: webApp  // parent should be your web app  reference name
   properties: {
     appSettings: [
       {
         name: 'APPINSIGHTS_INSTRUMENTATIONKEY'
         value: appInsightsComponents.properties.InstrumentationKey
       }
        {
         name: 'storageconnection_string'
         value: 'DefaultEndpointsProtocol=https;AccountName=${storageaccount.name};AccountKey=${storageaccount.listKeys().keys[0].value};EndpointSuffix=${environment().suffixes.storage}'
        }
     ]
   }
}
