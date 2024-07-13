resource bicepappserviceplan 'Microsoft.Web/serverfarms@2020-12-01' = {
  name: 'bicep-appservice-weu-dev'
  location: resourceGroup().location
  sku: {
    name: 'S1'
    capacity: 1
  }
}

// for linux app services
resource bicepappserviceplanlinux 'Microsoft.Web/serverfarms@2020-12-01' = {
  name: 'bicep-appservicelinux-weu-dev'
  kind: 'linux'
  properties:{
    reserved: true      //properties >reserved : true is mandatory
  }
  location: resourceGroup().location
  sku: {
    name: 'S1'
    capacity: 1
  }
}

