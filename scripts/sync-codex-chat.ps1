param(
    [switch]$All,
    [switch]$Import
)

$ErrorActionPreference = "Stop"

& (Join-Path $PSScriptRoot "export-codex-chat.ps1") -All:$All

if ($Import) {
    & (Join-Path $PSScriptRoot "import-codex-chat.ps1")
}
