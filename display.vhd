-- 7 Segment Display Driver Template
-- SPDX-FileCopyrightText: 2016-2026 Dr. John A.R. Williams <j.a.r.williams@jarw.org.uk>
-- SPDX-License-Identifier: GPL-3.0-or-later

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity display is
  port (
    clk: in STD_LOGIC;
    clk_en: in  STD_LOGIC; -- refresh clock enable should be <=1kHz
    bcd: in STD_LOGIC_VECTOR(15 downto 0):=(others=>'0'); -- 4 BCD digits
    dp_on: in STD_LOGIC_VECTOR(3 downto 0):="0000" ; -- dp on enable
    -- Outputs to connect directly to external display hardware
    segments : out STD_LOGIC_VECTOR (6 downto 0); -- 7 segments cathode drive
    dp: out STD_LOGIC; -- decimal point 
    anodes   : out STD_LOGIC_VECTOR (3 downto 0) -- anode drive (0 is on)
    );
end display;

architecture behavioral of display is
  signal digit : STD_LOGIC_VECTOR(3 downto 0);
  signal anodes_i : STD_LOGIC_VECTOR (3 downto 0) := "1110";
  
begin

  -- lookup table mapping digits to segments
  digit_to_segment_proc: process(digit)
  begin
    case digit is   -- Cathodes   GFEDCBA
      when "0000" => segments <= "1000000";
      -- complete for other digits.
      when others => segments <= "1111111"; -- all off if >12
    end case;
  end process;

  -- multiplexing process scan across anodes and digits
  mux_proc: process(clk)
  begin
    if rising_edge(clk) and clk_en='1' then
      -- go through the BCD digits in turn setting the anode, 
      -- the digit signal to be displayed and the decimal point if necessary.
    end if;
  end process;
  
end behavioral;
