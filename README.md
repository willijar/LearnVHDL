<!-- LTeX: language=en-US -->

# Learn VHDL and FPGA Design: a free course with videos, exercises and an AI tutor

A free, hands-on introduction to **synchronous digital design using VHDL** and the **FPGA design flow**, built around
the Digilent Basys 3 (AMD Artix-7) board and AMD Vivado.

The course has three parts that work together:

* **Video lectures** on YouTube: [watch the playlist](PLAYLIST_URL)
* **A practical workbook**, [VHDL-Introduction-Exercises.pdf](VHDL-Introduction-Exercises.pdf), with exercises that
  start from a single logic gate and build up to a complete stopwatch on the FPGA
* **This repository**, which holds the exercise templates, testbenches, constraints files and build scripts, plus an
  optional Socratic AI tutor that helps you learn without writing your code for you

It is written by Dr John A.R. Williams, who has taught electronic engineering in higher education for more than 30
years.

## Who this course is for

The course is for undergraduate students and independent learners who already know some basic digital electronics
but are new to hardware description languages. You should already be familiar with:

* logic gates (AND, OR, NOT, XOR), truth tables and Boolean algebra;
* clocks, flip-flops and registers;
* using a text editor and a terminal.

You do not need any previous experience of VHDL.

## What you will learn

By the end of the course you should be able to:

* read and write simple synthesizable VHDL;
* design and test combinational and sequential circuits;
* describe synchronous behaviour using a state-machine approach;
* write testbenches and use simulation to check a design;
* synthesize a design and run it on an FPGA.

You build and test each component separately (an AND gate, a full adder, a clock prescaler, a debouncer, counters,
a seven-segment display driver, a timer and a state machine) and then combine them into a working stopwatch on the
Basys 3 board. The hints in the workbook become fewer as you go, so that by the end you are finding things out for
yourself.

## The video lectures

The lectures are designed to be watched alongside the workbook. Topics include:

**Getting started**

* Introduction to Digital Design Using VHDL
* The Need for Hardware Description Languages
* Combinational Logic: Principles, Minimisation, and Implementation
* VHDL Fundamentals: From Signals to Synthesizable Hardware
* Setting up VS Code, Vivado and the Basys 3 Development Board for VHDL Practical Exercises
* Exercises Part 1: Introduction to VHDL Simulation and Synthesis
* Using AI for Feedback While Studying VHDL Design

**VHDL modelling and simulation**

* Process Modelling in VHDL: Describing Behaviour
* Structural Modelling in VHDL: Building Systems from Connected Components
* Stopwatch Case Study: From VHDL Design to FPGA Implementation
* Inside the FPGA: Architecture, Logic Resources, and Design Principles
* Simulating Digital Hardware: Events, Timing, and Verification
* VHDL for Simulation: Testbenches, Timing, and Automated Verification
* IEEE Numeric Types: Signed, Unsigned, and Conversion
* Reusable VHDL Designs with Generics and Attributes

**Sequential logic and state machines**

* Sequential Logic: States, Feedback, and Timing Hazards
* Introduction to Synchronous Sequential Logic
* SoC and FPGA Workflow
* Moore Models: Specification and Sequential System Design
* Implementing Moore Machines with Sequential Logic Systems
* Mealy Models: Responsive Sequential-System Design
* Finite State Machines and Algorithmic State Machine Design
* Implementation of a Sequential State Machine in VHDL
* Timing Analysis of Finite State Machines
* Common VHDL Mistakes and Design Pitfalls

## What you need

* [AMD Vivado Design Suite](https://www.amd.com/en/products/software/adaptive-socs-and-fpgas/vivado.html)
* [Microsoft Visual Studio Code](https://code.visualstudio.com/download)
* [Task](https://taskfile.dev), which runs the build scripts
* A [Basys 3 Artix-7 FPGA board](https://www.digikey.co.uk/en/product-highlight/d/digilent/basys3-artix-7-fpga-board)
* A recent Windows or Linux system supported by Vivado

Other boards with an AMD FPGA and similar features will work. You will need to change the pin mappings in the
constraints (`.xdc`) files and the part number in `Taskfile.yml`.

## Getting started

1. Clone this repository to get your own working copy, for example with "Clone Git Repository" in Visual Studio Code.
2. Open the top folder of the repository in Visual Studio Code.
3. Set up your tools by following section 1.5 of the [workbook](VHDL-Introduction-Exercises.pdf) and the setup video.
4. Work through the exercises in the workbook in order.

Common commands, run from the repository folder:

| Command | What it does |
| --- | --- |
| `task counter_testbench` | Simulate a testbench and open the waveform viewer |
| `task VHDL:analyze:counter.vhd` | Check the syntax of one file |
| `task stopwatch.bit` | Synthesize a design into a bitstream |
| `task program_stopwatch` | Program the Basys 3 board |
| `task VHDL:clean-all` | Remove generated files |

The Taskfile hides most of the detail of the Vivado tool chain, so that you can concentrate on VHDL design. It
integrates with VS Code through the Task extension, and works the same way on Windows and Linux. A traditional
`Makefile` is also provided for Linux users.

You do not need the Vivado GUI for this course. It supports advanced features such as live debugging and timing and
power analysis, but those are beyond an introductory course, and the GUI is complex for beginners. Working with the
command line tools also builds skills that carry over to software development: the tools are widely used, mature,
fast, easy to automate, and the same across many kinds of project.

## The AI tutor (optional)

This repository includes a Socratic VHDL tutor that runs in [Claude Code](https://code.claude.com/docs/en/vs-code)
inside Visual Studio Code. It is set up to help you learn rather than do the work for you. It knows the exercises,
the coding rules and the build commands. It can look at your files and run the simulator, then asks you questions
and gives hints in stages, but it will not write your solution. It can also point you to the part of a video that
explains an idea you are stuck on.

The tutor needs a paid Claude plan or a Claude Console account with API credit. None of the exercises depend on it.
Section 1.8 of the workbook explains how to set it up and use it. Like any AI, it can be wrong, so check what it
tells you against the workbook, the simulator and your own reasoning.

## Saving your work

Commit and push your work to GitHub regularly, at least at the end of every practical session and each time you
finish an exercise. In Visual Studio Code:

* Go to the "Source Control" panel.
* Select the changed files you want to push (I suggest selecting all) and choose "Commit and Sync".

## Licence

The code in this repository is licensed under the GNU General Public License, version 3 or later (see
[LICENCE.md](LICENCE.md)). The workbook is licensed under the
[Creative Commons Attribution-ShareAlike 4.0 International License](https://creativecommons.org/licenses/by-sa/4.0/).
