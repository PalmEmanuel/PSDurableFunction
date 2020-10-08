param($Context)

$ApprovalTimeOut = New-TimeSpan -Days $Context.Input.TimeoutDays

Invoke-ActivityFunction -FunctionName "RequestApproval"

$DurableTimeoutEvent = Start-DurableTimer -Duration $ApprovalTimeOut -NoWait
$ApprovalEvent = Start-DurableExternalEventListener -EventName "ApprovalEvent" -NoWait

# The -Any parameter picks the first event to occur, instead of waiting for all of them
$FirstEvent = Wait-DurableTask -Task @($ApprovalEvent, $DurableTimeoutEvent) -Any

if ($ApprovalEvent -eq $FirstEvent) {
    Stop-DurableTimerTask -Task $DurableTimeoutEvent
    Invoke-ActivityFunction -FunctionName "ProcessApproval" -Input $ApprovalEvent
}
else {
    Invoke-ActivityFunction -FunctionName "EscalateApproval"
}