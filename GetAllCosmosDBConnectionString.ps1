function Get-AllCosmosDBConnectionString {
    <#
        .SYNOPSIS
        Convenience function that calls `Get-CosmosDB | Get-AllCosmosDBConnectionString` and formats the results
        .Example
        Get-AllCosmosDBConnectionString
ResourceGroupName Name     ConnectionString                                                                            
----------------- ----     ----------------                                                                            
Kramer-RG         seinfeld AccountEndpoint=https://seinfeld.documents.azure.com:443/;AccountKey=xxxxxx...
    #>    foreach ($db in Get-CosmosDB) {
        [PSCustomObject]@{
            ResourceGroupName = $db.ResourceGroupName
            Name              = $db.Name
            ConnectionString  = $db|Get-CosmosDBConnectionString
        }    
    }
}