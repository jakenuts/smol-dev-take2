function ConvertTo-HashTable {
    param (
        [Parameter(Mandatory=$true)]
        [string]$JsonFilePath
    )

    if (!(Test-Path $JsonFilePath)) {
        throw "File $JsonFilePath does not exist."
    }

    $jsonContent = Get-Content $JsonFilePath -Raw
    $jsonObject = ConvertFrom-Json $jsonContent

    $hashTable = @{}
    $jsonObject.PSObject.Properties | ForEach-Object {
        $hashTable[$_.Name] = $_.Value
    }

    return $hashTable
}