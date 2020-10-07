param($Context)

# We can only pass one object as input, but we can pass a number range as an array
$RandomNumber = Invoke-ActivityFunction -FunctionName 'Random'
$BitFlippedNumber = Invoke-ActivityFunction -FunctionName 'FlipBits' -Input $RandomNumber

# Output binary strings
Invoke-ActivityFunction -FunctionName 'ToBinaryString' -Input $RandomNumber
Invoke-ActivityFunction -FunctionName 'ToBinaryString' -Input $BitFlippedNumber