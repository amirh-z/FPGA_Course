-- amirh_z

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned;
use ieee.numeric_std.all;

entity Adder_Reg is
	port(din: in std_logic_vector(15 downto 0);
		  clk, clr: in std_logic;
		  dout: out std_logic_vector(15 downto 0));
end Adder_Reg;

architecture Behavioral of Adder_Reg is

begin
	process(clk)
	begin
		if (clk'event and clk='1') then
			if clr='0' then
				dout <= din;
			else
				dout <= "0000000000000000";
			end if;
		end if;
	end process;

end Behavioral;