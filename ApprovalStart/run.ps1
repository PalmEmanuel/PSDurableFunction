using namespace System.Net

param($Request, $TriggerMetadata)

$OrchestratorInput = @{
    'TimeoutDays' = 7
}
$InstanceId = Start-NewOrchestration -FunctionName 'ApprovalOrchestrator' -InputObject $OrchestratorInput

$Response = New-OrchestrationCheckStatusResponse -Request $Request -InstanceId $InstanceId
Push-OutputBinding -Name Response -Value $Response