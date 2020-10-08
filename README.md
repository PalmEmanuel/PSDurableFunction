# Azure Durable Functions in PowerShell

This is an example project connected to the [blog post on PipeHow about Azure Durable Functions in PowerShell](https://www.pipehow.tech/new-durableazurefunction/).

## Application Patterns

The project implements application patterns listed in [Microsoft's documentation for Durable Functions](https://docs.microsoft.com/en-us/azure/azure-functions/durable/durable-functions-overview). Below is the list of functions in the project, split by pattern.

### Function Chaining

Flips the bits of a random number and converts both the original and flipped number to binary as a showcase of the pattern.

- Client Function - DurableFunctionsHttpStart
- Orchestrator Function - BinaryOrchestrator
- Activity Function - Random
- Activity Function - FlipBits
- Activity Function - ToBinary

### Fan-out / Fan-in

Gets activities to do when bored while showcasing the pattern in the example.

- Client Function - DurableFunctionsHttpStart
- Orchestrator Function - BoredOrchestrator
- Activity Function - Types
- Activity Function - Bored

### Monitor

The `Notify` function is not implemented more than to illustrate the example.

- Client Function - SnowMonitorStart
- Orchestrator Function - SnowMonitor
- Activity Function - PollWeather
- Activity Function - Notify

### Human Interaction

Requires at least [version 3.0.549 of the PowerShell worker](https://github.com/Azure/azure-functions-powershell-worker/releases/tag/v3.0.549).

The activity functions are not implemented more than to illustrate the example.

- Client Function - ApprovalStart
- Orchestrator Function - ApprovalOrchestrator
- Activity Function - RequestApproval
- Activity Function - ProcessApproval
- Activity Function - EscalateApproval