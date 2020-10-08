using namespace System.Net

param($Request, $TriggerMetadata)

$OrchestratorInput = @{
    'ExpiryDate' = Get-Date '2020-12-31'
}
$InstanceId = Start-NewOrchestration -FunctionName 'SnowMonitor' -InputObject $OrchestratorInput

$Response = New-OrchestrationCheckStatusResponse -Request $Request -InstanceId $InstanceId
Push-OutputBinding -Name Response -Value $Response