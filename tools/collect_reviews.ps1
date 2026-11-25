# Collects the reviews and traces from kept evaluation runs, then deletes the temporary folders.
# Run from the repository root after a batch, for example:
#   powershell -ExecutionPolicy Bypass -File tools\collect_reviews.ps1 -Batch k
param([Parameter(Mandatory = $true)][string]$Batch)

$dest = Join-Path $PSScriptRoot "..\plugins\architecture-review\evals\results\full-run\$Batch"
$runs = Get-ChildItem $env:TEMP -Directory -Filter "claude-eval-*"
foreach ($run in $runs) {
    $target = Join-Path $dest $run.Name
    New-Item -ItemType Directory -Force $target | Out-Null
    $out = Join-Path $run.FullName "out"
    $reviews = Join-Path $run.FullName "home\cwd\reviews"
    if (Test-Path $out) { Copy-Item (Join-Path $out "*") $target -Recurse -Force }
    if (Test-Path $reviews) { Copy-Item $reviews $target -Recurse -Force }
    Remove-Item -Recurse -Force -LiteralPath $run.FullName
}
"Collected $($runs.Count) run folders into $dest"
