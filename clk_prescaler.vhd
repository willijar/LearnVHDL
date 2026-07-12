-- Tutorial template for creating a clock prescaler
-- SPDX-FileCopyrightText: 2016-2026 Dr. John A.R. Williams <j.a.r.williams@jarw.org.uk>
-- SPDX-License-Identifier: GPL-3.0-or-later

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use ieee.math_real.all; -- needed for mathematical calculations

entity clk_prescaler is
  generic (
    n: integer                   --  divide clk by n to generate clk_div
  );
  port (
    clk: in std_logic;           -- input (system) clock
    clk_div: out std_logic:='0'  -- clock enable signal at clk/n frequency
    );
end clk_prescaler;

architecture behavioural of clk_prescaler is
  -- determine number of bits required for counter up to n
  constant nbits: integer:=integer(ceil(log2(real(n))));
  -- declare counter register of this size.
  signal count: unsigned(nbits-1 downto 0) :=(others=>'0');
  
begin
  cp: process(clk)
  begin
   -- insert implementation here 
   -- it should output a single clock enable pulse with the width of
   -- the system clock period  every n input system clock pulses
   -- Hint: use the rising_edge macro to detect clk edges
   -- increment count up to the required end-count and then reset to 0
   -- set clk_div to 1 only while count is at the terminal count
   -- value, otherwise it should be 0
  end process;
end behavioural;
