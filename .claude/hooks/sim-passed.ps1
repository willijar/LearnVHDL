# FileChanged hook: wakes the tutor when a student's testbench has just passed.
# The Taskfile writes the testbench name to sim_result.txt after each simulation and keeps the xsim log in log/.
# Exit 2 wakes Claude with the stderr message; exit 0 does nothing.
$ErrorActionPreference = 'SilentlyContinue'
$root = $env:CLAUDE_PROJECT_DIR
if (-not $root) { $root = (Get-Location).Path }
$resultFile = Join-Path $root 'sim_result.txt'
if (-not (Test-Path $resultFile)) { exit 0 }
$tb = ((Get-Content $resultFile -Raw) -replace '["\s]', '')
if ($tb -notmatch '^[A-Za-z0-9_]+_testbench$') { exit 0 }
$log = Join-Path $root ('log\' + $tb + '_sim.log')
if (-not (Test-Path $log)) { exit 0 }
$text = Get-Content $log -Raw
if ($text -match '(?im)^\s*(Error|Failure|Fatal|FATAL_ERROR)\s*:') { exit 0 }
$uut = $tb -replace '_testbench$', ''
[Console]::Error.WriteLine(
  "The student has just run $tb and it passed with no assertion errors (log\${tb}_sim.log). " +
  "Congratulate them briefly on that specific result. Then use the vhdl-reviewer agent to review $uut.vhd and " +
  "$tb.vhd, and raise its findings with the student one guiding question at a time, most important first. " +
  "Never paste the review or give corrected code.")
exit 2
