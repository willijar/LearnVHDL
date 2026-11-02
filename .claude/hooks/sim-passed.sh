#!/bin/sh
# FileChanged hook (Linux/macOS): wakes the tutor when a student's testbench has just passed.
# The Taskfile writes the testbench name to sim_result.txt after each simulation and keeps the xsim log in log/.
# Exit 2 wakes Claude with the stderr message; exit 0 does nothing. Windows uses sim-passed.ps1 instead.
root="${CLAUDE_PROJECT_DIR:-$(pwd)}"
result="$root/sim_result.txt"
[ -f "$result" ] || exit 0
tb=$(tr -d '"[:space:]' < "$result")
echo "$tb" | grep -Eq '^[A-Za-z0-9_]+_testbench$' || exit 0
log="$root/log/${tb}_sim.log"
[ -f "$log" ] || exit 0
grep -Eiq '^[[:space:]]*(Error|Failure|Fatal|FATAL_ERROR)[[:space:]]*:' "$log" && exit 0
uut=${tb%_testbench}
echo "The student has just run $tb and it passed with no assertion errors (log/${tb}_sim.log)." \
  "Congratulate them briefly on that specific result. Then use the vhdl-reviewer agent to review $uut.vhd and" \
  "$tb.vhd, and raise its findings with the student one guiding question at a time, most important first." \
  "Never paste the review or give corrected code." >&2
exit 2
