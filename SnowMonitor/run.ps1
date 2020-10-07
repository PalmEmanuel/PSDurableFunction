param($Context)

$Tomorrow = $Context.CurrentUtcDateTime.AddDays(1)

for ($i = 0; $i -lt 100; $i++) {

    $WeatherData = Invoke-ActivityFunction -FunctionName 'PollWeather' -Input $Tomorrow

    if ($WeatherData.weather_state_name.Contains('Snow')) {
        break
    }

    Start-DurableTimer -Duration ([timespan]::FromDays(1))
}

# Here we could send an email or another type of notification
# Invoke-ActivityFunction -FunctionName 'Notify'