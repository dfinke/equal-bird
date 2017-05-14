function Get-CosmosDB {
    <#
        .SYNOPSIS
        Gets all the Cosmos DB in your Azure subscription
        .Example
        Get-CosmosDB
Name              : seinfeld
ResourceId        : /subscriptions/xxxxxxxxxxxxxx/resourceGroups/Kramer-RG/providers/Microsoft.Do
                    cumentDb/databaseAccounts/seinfeld
ResourceName      : seinfeld
ResourceType      : Microsoft.DocumentDb/databaseAccounts
Kind              : GlobalDocumentDB
ResourceGroupName : Kramer-RG
Location          : eastus
SubscriptionId    : xxxxxxxxxxxxxx
Tags              : {defaultExperience}

        .Example
        Get-CosmosDB feld
Name              : seinfeld
ResourceId        : /subscriptions/xxxxxxxxxxxxxx/resourceGroups/Kramer-RG/providers/Microsoft.Do
                    cumentDb/databaseAccounts/seinfeld
ResourceName      : seinfeld
ResourceType      : Microsoft.DocumentDb/databaseAccounts
Kind              : GlobalDocumentDB
ResourceGroupName : Kramer-RG
Location          : eastus
SubscriptionId    : xxxxxxxxxxxxxx
Tags              : {defaultExperience}

    #>
    param(
        $name
    )

    DoLogin

    Get-AzureRmResource | 
        Where-Object {
        $_.kind -EQ 'GlobalDocumentDB' -and 
        $_.name -match $name
    }
}