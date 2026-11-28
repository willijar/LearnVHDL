-- Template for full adder
-- SPDX-FileCopyrightText: 2026 Dr. John A.R. Williams <j.a.r.williams@jarw.org.uk>
-- SPDX-License-Identifier: GPL-3.0-or-later

library ieee;
use ieee.std_logic_1164.all;

entity full_adder is
  port (
    x    : in  std_logic;
    y    : in  std_logic;
    cin  : in  std_logic;
    s    : out std_logic;
    cout : out std_logic);
end;

architecture behavioral of full_adder is
begin
  s    <=;                              -- insert your logic here
  cout <=;                              -- insert your logic here
end;
