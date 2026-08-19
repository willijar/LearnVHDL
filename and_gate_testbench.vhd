-- Example test bench for and_gate example component

library IEEE;
use IEEE.std_logic_1164.all;

-- entity declaration for your test bench - don't declare any ports in testbench
entity and_gate_testbench is
end and_gate_testbench;

-- architecture name should reflect style of implementation e.g.
-- behavioural, structural, dataflow, rtl etc
architecture behavioural of and_gate_testbench is
  
  -- component declaration for unit under test (UUT)
  -- just copy and paste the input and ouput ports for the entity declaration
  component and_gate
    port
      (
        a: in std_logic;
        b: in std_logic;
        result: out std_logic
      );
  end component;

  -- declare your test signals and initialize them
  -- I have used the same names as the port names of the unit under test here
  -- This isn't required - use whatever makes intent clear.
  signal  a:      std_logic; -- input test signal a
  signal  b:      std_logic; -- input test signal b
  signal result:  std_logic; -- uut ouput test signal

begin
  -- instantiate the unit under test (UUT)
  -- always list explicit rather than positional mapping for clarity here.
  uut: entity work.and_gate
    port map (a => a, b => b, result => result);
  
  -- stimulus process - always give your process a label
  stimulus: process
  begin
    -- we go through each combination of a and b, wait for 10ns for
    -- output to settle and then check that the output is as expected
    a<='0'; b<='0'; wait for 10 ns;
    assert (result='0') report "Output for 0 0 incorrect";
    a<='1'; b<='0'; wait for 10 ns;
    assert (result='0') report "Output for 1 0 incorrect";
    a<='1'; b<='1'; wait for 10 ns;
    assert (result='1') report "Output for 1 1 incorrect";
    a<='0'; b<='1'; wait for 10 ns;
    assert (result='0') report "Output for 0 1 incorrect";
    wait;
  end process;
end behavioural;
