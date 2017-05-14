$ModuleName   = "EqualBird"
$ModulePath   = "C:\Program Files\WindowsPowerShell\Modules"
$TargetPath = "$($ModulePath)\$($ModuleName)"

if(!(Test-Path $TargetPath)) { mkdir $TargetPath | out-null}

$targetFiles = Write-Output `
    *.psm1 `
    *.psd1 `
    Get* `
    README.md

Get-ChildItem $targetFiles |
    ForEach-Object {
        Copy-Item -Verbose -Path $_.FullName -Destination "$($TargetPath)\$($_.name)"
    }