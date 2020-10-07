param($Type)

$Result = Invoke-RestMethod "http://www.boredapi.com/api/activity?type=$Type"
"$Type - $($Result.activity)"