param($Context)

$Tomorrow = $Context.CurrentUtcDateTime.AddDays(1)
$ExpiryDate = $Context.Input.ExpiryDate

while ($Tomorrow -lt $ExpiryDate) {

    $WeatherData = Invoke-ActivityFunction -FunctionName 'PollWeather' -Input $Tomorrow

    if ($WeatherData.weather_state_name.Contains('Snow')) {
        break
    }

    Start-DurableTimer -Duration (New-TimeSpan -Days 1)
}

if ($Tomorrow -lt $ExpiryDate) {
    Invoke-ActivityFunction -FunctionName 'Notify'
}
