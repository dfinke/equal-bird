. $PSScriptRoot\GetCosmosDBConnectionString.ps1
. $PSScriptRoot\GetCosmosDB.ps1

Function DoLogin {
    try {
        $null = Get-AzureRmContext
    } Catch {
        $null = Login-AzureRmAccount
    }
}
