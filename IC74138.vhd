----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:45:39 03/23/2023 
-- Design Name: 
-- Module Name:    IC74138 - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity IC74138 is
	port(A, B, C: in std_logic;
		G1, G2n, G3n: in std_logic;
		y: out std_logic_vector(7 downto 0));
end IC74138;

architecture Behavioral of IC74138 is
	signal in_s: std_logic_vector(2 downto 0);
	signal y_s: std_logic_vector(7 downto 0);
begin
	in_s <= C & B & A;
	with in_s select
		y_s <= "11111110" when "000",
				"11111101" when "001",
				"11111011" when "010",
				"11110111" when "011",
				"11101111" when "100",
				"11011101" when "101",
				"10111101" when "110",
				"01111101" when "111",
				"11111111" when others;
	y <= y_s when (G1 and (not (G2n)) and (not(G3n))) = '1' else "11111111";

end Behavioral;

