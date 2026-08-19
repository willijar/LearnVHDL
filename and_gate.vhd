-- Example simple and-gate implementation

library IEEE;
use IEEE.std_logic_1164.all;

entity and_gate is
  port (
    a      : in  std_logic;
    b      : in  std_logic;
    result : out std_logic
    );
end and_gate;

architecture behaviour of and_gate is
begin
  result <= a and b;
end behaviour;
