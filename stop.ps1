# WorkBuddy Manager —— 停止本机服务（Windows / PowerShell）
$root = $PSScriptRoot
if (-not $root -and $MyInvocation.MyCommand.Path) { $root = Split-Path -Parent $MyInvocation.MyCommand.Path }
if (-not $root -and $MyInvocation.MyCommand.Definition) { $root = Split-Path -Parent $MyInvocation.MyCommand.Definition }
if (-not $root) { $root = (Get-Location).Path }
& (Join-Path $root 'service-tools.ps1') stop

$upstreamStop = Join-Path $root 'upstream\stop-workbuddy2api.cmd'
if (Test-Path $upstreamStop) {
    & cmd.exe /c $upstreamStop
}
Write-Host "已停止所有 WorkBuddy 服务。"
