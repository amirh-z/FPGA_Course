----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:33:18 03/30/2023 
-- Design Name: 
-- Module Name:    IC74163 - Behavioral 
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

entity IC74163 is
	port(data_in: in std_logic_vector(3 downto 0);
	loadn, clrn, clk, pe, te: in std_logic;
	rco: out std_logic;
	data_out: out std_logic_vector(3 downto 0));
end IC74163;

architecture Behavioral of IC74163 is
signal count1: std_logic_vector(3 downto 0);
begin
	process(clk)
	variable count: std_logic_vector(3 downto 0) := "0000";
	begin
		if (clk'event and clk='1') then
			if clrn='0' then count := "0000";
			elsif loadn='0' then count:=data_in;
			elsif ((te and pe)='1') then count:=count+"0001";
			end if;
			if count="1111" then rco<='1';
			else rco<='0';
			end if;
		end if;
		data_out<=count;
		count1<=count;
	end process;
	rco <= '1' when count1 = "1111" else '0';
end Behavioral;

