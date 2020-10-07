param($Context)

$Types = Invoke-ActivityFunction -FunctionName 'Types'

$ParallelFunctions = foreach ($Type in $Types) {
    Invoke-ActivityFunction -FunctionName 'Bored' -Input $Type -NoWait
}

Wait-ActivityFunction -Task $ParallelFunctions