--amirh_z

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity Out_Reg is
	port(din: in std_logic_vector(15 downto 0);
		  clk, en: in std_logic;
		  dout: out std_logic_vector(15 downto 0));
end Out_Reg;

architecture Behavioral of Out_Reg is
begin
	process(clk)
	begin
		if (clk'event and clk='1') then
			if en='1' then
				dout <= din;
			else
				dout <= "ZZZZZZZZZZZZZZZZ";
			end if;
		end if;
	end process;
end Behavioral;