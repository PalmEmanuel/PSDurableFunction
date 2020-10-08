param($Context)

$Tomorrow = $Context.CurrentUtcDateTime.AddDays(1)
$ExpiryTime = $Context.Input.ExpiryTime

while ($Tomorrow -lt $ExpiryTime) {

    $WeatherData = Invoke-ActivityFunction -FunctionName 'PollWeather' -Input $Tomorrow

    if ($WeatherData.weather_state_name.Contains('Snow')) {
        break
    }

    Start-DurableTimer -Duration (New-TimeSpan -Days 1)
}

if ($Tomorrow -lt $ExpiryTime) {
    Invoke-ActivityFunction -FunctionName 'Notify'
}