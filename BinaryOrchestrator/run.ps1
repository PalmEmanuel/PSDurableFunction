param($Context)

Get-Member -InputObject $Context

$RandomNumber = Invoke-ActivityFunction -FunctionName 'Random'
$BitFlippedNumber = Invoke-ActivityFunction -FunctionName 'FlipBits' -Input $RandomNumber

# Output binary strings
Invoke-ActivityFunction -FunctionName 'ToBinary' -Input $RandomNumber
Invoke-ActivityFunction -FunctionName 'ToBinary' -Input $BitFlippedNumber