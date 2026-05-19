param(
    [string]$Source = "chat_exports"
)

$ErrorActionPreference = "Stop"

$projectRoot = Split-Path -Parent $PSScriptRoot
$sourceRoot = Join-Path $projectRoot $Source
$sessionRoot = Join-Path $env:USERPROFILE ".codex\sessions"

if (-not (Test-Path -LiteralPath $sourceRoot)) {
    throw "Chat export folder was not found: $sourceRoot"
}

$exports = Get-ChildItem -Recurse -File -LiteralPath $sourceRoot -Filter "*.jsonl" |
    Sort-Object FullName

if (-not $exports) {
    throw "No exported chat files were found under: $sourceRoot"
}

foreach ($export in $exports) {
    $dateText = $export.Directory.Name

    if ($dateText -notmatch "^\d{4}-\d{2}-\d{2}$" -and
        $export.Name -match "rollout-(\d{4})-(\d{2})-(\d{2})") {
        $dateText = "$($Matches[1])-$($Matches[2])-$($Matches[3])"
    }

    if ($dateText -notmatch "^\d{4}-\d{2}-\d{2}$") {
        Write-Warning "Skipping file with unknown date: $($export.FullName)"
        continue
    }

    $parts = $dateText.Split("-")
    $targetFolder = Join-Path $sessionRoot (Join-Path $parts[0] (Join-Path $parts[1] $parts[2]))
    New-Item -ItemType Directory -Force -Path $targetFolder | Out-Null

    $target = Join-Path $targetFolder $export.Name
    Copy-Item -LiteralPath $export.FullName -Destination $target -Force
    Write-Output $target
}
