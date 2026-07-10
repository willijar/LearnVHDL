# Project general coding guidelines

## Code Style
- Use 2008 standard synthesisable VHDL
- USE IEEE STD_LOGIC_1164.ALL;
- USE IEEE.numeric_std.all;
- USE IEEE.math_real.all;
- DO NOT USE IEEE.STD_LOGIC_ARITH.ALL;
- DO NOT USE STD_LOGIC_TEXTIO;
- DO NOT USE STD_LOGIC_UNSIGNED;
- DO NOT USE STD_LOGIC_SIGNED;
- Indent with 2 spaces (no tabs)
- Limit lines to 120 characters
- Use spaces around operators and after commas
- Place opening braces on the same line as the control statement
- Use consistent naming conventions for files and directories
- Use one line per signal For signal assignments, port mappings and component instantiations. You exclude small components
- Explicitely declare port mappings

## Naming Conventions
- Use lower case for entity names, architecture names, component names, interfaces, and type aliases
- Use lower case for variables, functions, and methods
- Use ALL_CAPS for constants
- Names should use underscore to separate words (e.g., my_signal_name)
- Use <signal_name>_addr for addresses and <signal_name>_clk for clocks
- Use <signal_name>_l for actice low signal
- Do not use _in and _out suffixes for port signal names. 
- Use _i as a suffix when using a signal that is an internal representation of a port. (eg. if ’output’ is your port, output_i is the internal signal representing it).

## Code Quality
- Use meaningful names for signals, variables, entities, architectures and processes
- Avoid deep nesting of control structures
- Include helpful comments for complex logic
- Write modular and reusable code
- Wherever possible use active high signals
- Avoid magic numbers; use named constants instead
- A signal should be assigned in only one process or one concurrent assignment
- For unclocked processes, never assign to a signal more than once.
- For clocked processes, never assign a signal outside of the reset or clock edge statements.
- In a synchronous design, only one clock and one edge of the clock should be used.
- Three processes are recommended for a finite state machine: next-state decoding, output decoding and registering state bits and outputs.
- Always explicitly define behaviour for all states and outputs in a finite state machine. 
- Try to create exclusive conditional cases, rather than overlapping ones. 
- Always make explicit all cases (with else or when others conditions).
- Use rising_edge() and falling_edge() functions for clock edge detection
- Wherever possible use synchronous resets

## Documentation
- Provide clear and concise documentation for all modules, functions, and classes

## Similarity
- Avoid code duplication by reusing existing functions or modules
- Avoid copy-pasting code; instead, refactor common logic into reusable components
- Ensure that similar functionalities follow the same design patterns and coding styles
- Use consistent naming conventions for similar entities and variables

## Assessment
- Code will be assessed based on adherence to these guidelines, code quality, and overall maintainability
- Verify that code has not been copied from external sources without proper attribution
