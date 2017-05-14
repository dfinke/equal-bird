# Install from the PowerShell Gallery

```powershell
Install-Module -Name EqualBird
```
Set of PowerShell functions to make working with Azure resources easier.

These functions also leverage PowerShell's ability to bind parameters between functions by property name.

```
PS C:\> Get-CosmosDB
Name              : seinfeld
ResourceId        : /subscriptions/xxxxxxxxxxxxxx/resourceGroups/Kramer-RG/providers/Microsoft.Do
                    cumentDb/databaseAccounts/seinfeld
ResourceName      : seinfeld
ResourceType      : Microsoft.DocumentDb/databaseAccounts
Kind              : GlobalDocumentDB
ResourceGroupName : Kramer-RG

PS C:\> Get-CosmosDB | Get-CosmosConnectionString
AccountEndpoint=https://seinfeld.documents.azure.com:443/;AccountKey=xxxxxxxx;Database=seinfeld

````

## Cosmos DB
| Function | Description|
|---|---|
|Get-CosmosDB|Gets all the Cosmos DBs in your Azure subscription
|Get-CosmosConnectionString|Retrieves keys from your Cosmos DB and returns a connectstring
|Get-AllCosmosDBConnectionString|Convenience function that calls `Get-CosmosDB \| Get-AllCosmosDBConnectionString` and formats the results|