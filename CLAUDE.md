# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this is

Starter template for an introductory VHDL design and synthesis course (see `VHDL-Introduction-Exercises.pdf`). Students build small components (`and_gate`, `full_adder`, `clk_prescaler`, `debounce`, `counter`, `display`, `timer`, `stopwatch_ssm`) with testbenches, then combine them into a top-level `stopwatch` for the Basys3 board (Artix-7, part `xc7a35tcpg236-1`). Some files referenced in the build config (e.g. `stopwatch.vhd`, `timer.vhd`, `stopwatch_ssm.vhd`, `fourcounter.vhd`) are exercises students create; they may not exist yet.

## Toolchain and commands

AMD Vivado (`xvhdl`/`xelab`/`xsim`/`vivado`) driven by [Task](https://taskfile.dev). The Vivado install path is set by `VIVADOPATH` in `Taskfile.yml` (Windows default `C:\AMDDesignTools\2026.1\Vivado\bin`). On Windows, Vivado is invoked via `cmd.exe /c <tool>.bat`.

- Simulate a testbench and open the waveform viewer: `task <name>_testbench` (e.g. `task counter_testbench`)
- Simulate without the viewer: `task VHDL:build:<name>_testbench`
- Syntax-check/analyze one file: `task VHDL:analyze:<file>.vhd`
- Synthesize a bitstream: `task <top>.bit` (or `task VHDL:synthesize:<top>`); reports go to `log/`
- Program the board: `task program_<top>` (e.g. `task program_stopwatch`)
- All testbenches / all bitstreams: `task VHDL:simulate-all-testbenches`, `task VHDL:synthesize-all`
- Clean: `task VHDL:clean-all`

`Makefile` + `casestudy.mk` is a Linux-only alternative (`make <uut>_testbench`, `make <uut>_testbench.view`, `make <top>.bit`, `make <top>.program`); it is secondary to the Taskfile and `casestudy.mk` still references a stale `EE2IDD.vhd` (now `IDD.vhd`). VS Code tasks in `.vscode/tasks.json` run Analyze/Simulate/Synthesize/Program on the currently open file.

There is no test framework beyond VHDL testbenches: a "test" is a testbench simulated with xsim, checked via `assert`/`report` and the waveform.

## Build conventions (important when adding files)

- Entity name == filename basename. Testbenches are `<uut>_testbench.vhd`; top-level designs need a matching `<top>.xdc` constraints file (derive pin mappings from `Basys3_Master.xdc`).
- Every simulation or bitstream target must be listed in the `DEPENDS` map in `Taskfile.yml` (key `<name>_testbench` or `<top>.bit`, value = space-separated sources in dependency order, dependencies first). Adding a new target also needs a wrapper task in `Taskfile.yml` (copy an existing one). The generic logic lives in `VHDLTasks.yml`, which generates Vivado TCL on the fly into `tmp/.vivado.tcl`.
- All VHDL is compiled as VHDL-2008 into the `work` library (`xsim.dir/`).
- `IDD.vhd` is a package of component declarations for the course components (`use work.IDD.all`); keep it in sync with entity port/generic changes and list it first in `DEPENDS` for designs that use it.
- `testbench_template.vhd` and `fsm_template.vhd` (three-process FSM: sync register, output decode, next-state decode) are the templates to follow.
- Synthesis stamps `BITSTREAM.CONFIG.USERID` with a hash of the username (`userid.ps1` on Windows).
- Generated artifacts (`*.bit`, `*.wdb`, `*.wcfg`, `log/`, `tmp/`, `xsim.dir/`, `vivado_pid*.str`) should not be committed.

## VHDL coding rules (from `.github/copilot-instructions.md`; code is assessed against these)

- Synthesisable VHDL-2008 using `ieee.std_logic_1164`, `ieee.numeric_std`, `ieee.math_real` only — never `std_logic_arith`, `std_logic_unsigned`, `std_logic_signed`, `std_logic_textio`.
- 2-space indent, no tabs, max 120 columns, spaces around operators and after commas; one signal per line in port maps/assignments; explicit (named) port mappings.
- Lowercase `snake_case` for entities, architectures, signals, types, functions; `ALL_CAPS` constants (no magic numbers). Suffixes: `_clk` clocks, `_addr` addresses, `_l` active-low, `_i` for internal copy of an output port; never `_in`/`_out`.
- Each signal driven from exactly one process/concurrent assignment; single clock, single edge, `rising_edge()`; prefer synchronous resets and active-high signals; in clocked processes assign only within the reset/clock-edge branches; in combinational processes assign each signal once.
- FSMs: three processes, define outputs for every state, cover all cases (`else` / `when others`), prefer mutually exclusive conditions.
- Files carry an SPDX header comment block; document each module.
