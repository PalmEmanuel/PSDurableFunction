param($InputData)

$Types = 'education','cooking','relaxation','recreational','music'

1..10 | ForEach-Object {
    $Types[(Get-Random -Minimum 0 -Maximum 4)]
}