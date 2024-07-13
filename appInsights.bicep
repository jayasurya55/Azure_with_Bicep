resource appInsightsComponents 'Microsoft.Insights/components@2020-02-02' = {
  name: 'bicep-appinsights-weu-dev'
  location: resourceGroup().location
  kind: 'web'
  properties: {
    Application_Type: 'web'
  }
}
