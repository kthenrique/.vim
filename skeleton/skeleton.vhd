--------------------------------------------------------------------------------
-- Project    : <project title> 
--------------------------------------------------------------------------------
-- File       : <filename> 
-- Author     : Kelve T. Henrique
-- Company    : FH Technikum Wien
-- Last update: <date> 
-- Platform   : Linux, ModelSim, Xilinx Vivado
--------------------------------------------------------------------------------
-- Description: <What is this code for?> 
--------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all; -- use logic elements

entity reg is
  port (clk_i      : in std_logic;
        reset_i    : in  std_logic;
        in_i       : in  std_logic;

        out_o      : out  std_logic);
end reg;

architecture rtl of reg is
begin
  p_reg: process(clk_i, reset_i)
  begin
    if reset_i = '0' then
      out_o <= '0';
    elsif rising_edge(clk_i) then
      out_o <= in_i;
  end process p_reg;
end rtl;
