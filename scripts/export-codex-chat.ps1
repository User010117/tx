param(
    [switch]$All,
    [string]$Destination = "chat_exports"
)

$ErrorActionPreference = "Stop"

$projectRoot = Split-Path -Parent $PSScriptRoot
$sessionRoot = Join-Path $env:USERPROFILE ".codex\sessions"
$destRoot = Join-Path $projectRoot $Destination

if (-not (Test-Path -LiteralPath $sessionRoot)) {
    throw "Codex sessions folder was not found: $sessionRoot"
}

New-Item -ItemType Directory -Force -Path $destRoot | Out-Null

$sessions = Get-ChildItem -Recurse -File -LiteralPath $sessionRoot -Filter "*.jsonl" |
    Sort-Object LastWriteTime -Descending

if (-not $sessions) {
    throw "No Codex session files were found under: $sessionRoot"
}

if (-not $All) {
    $sessions = @($sessions | Select-Object -First 1)
}

foreach ($session in $sessions) {
    $dateFolder = $session.LastWriteTime.ToString("yyyy-MM-dd")
    $targetFolder = Join-Path $destRoot $dateFolder
    New-Item -ItemType Directory -Force -Path $targetFolder | Out-Null

    $target = Join-Path $targetFolder $session.Name
    Copy-Item -LiteralPath $session.FullName -Destination $target -Force
    Write-Output $target
}
