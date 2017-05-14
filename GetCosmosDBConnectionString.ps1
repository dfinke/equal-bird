function Get-CosmosDBConnectionString {
    <#
        .SYNOPSIS
        Retrieves keys from your Cosmos DB and returns a connectstring for use in apps like "DocumentDB Data Migration Tool"
        .DESCRIPTION
        You can also use it with Get-CosmosDB. Piping it to Get-CosmosDBConnectionString to get the ConnectionString for all of your Cosmos DBs.
        .Example
        Get-CosmosDBConnectionString Kramer-RG seinfeld
AccountEndpoint=https://seinfeld.documents.azure.com:443/;AccountKey=xxxxxxxx;Database=seinfeld

        .Example
Get-CosmosDB | Get-CosmosDBConnectionString
AccountEndpoint=https://seinfeld.documents.azure.com:443/;AccountKey=xxxxxxxx;Database=seinfeld
    #>
    param(
        [Parameter(ValueFromPipelineByPropertyName)]
        $ResourceGroupName,
        [Parameter(ValueFromPipelineByPropertyName)]
        $Name
    )

    Begin {
        DoLogin
    }

    Process {
        $k = Invoke-AzureRmResourceAction `
            -Action listKeys `
            -ResourceType "Microsoft.DocumentDb/databaseAccounts" `
            -ApiVersion "2015-04-08" `
            -ResourceGroupName $ResourceGroupName `
            -Name $Name -Force

        "AccountEndpoint=https://{0}.documents.azure.com:443/;AccountKey={1};Database={0}" -f $name, $k.primaryMasterKey 
    }
}