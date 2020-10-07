param([datetime]$Date)

# https://www.metaweather.com/api/location/search/?query=Stockholm - Id is 906057 
$LocationId = $Env:LocationId

$APIDatePath = $Date.ToString("yyyy/MM/dd", [cultureinfo]::InvariantCulture)

Invoke-RestMethod "https://www.metaweather.com/api/location/$LocationId/$APIDatePath"