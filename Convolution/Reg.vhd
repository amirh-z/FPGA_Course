library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned;
use ieee.numeric_std.all;

entity Reg is
	port(din: in std_logic_vector(15 downto 0);
		  clk: in std_logic;
		  clr: in std_logic;
		  dout: out std_logic_vector(15 downto 0));
end Reg;

architecture Behavioral of Reg is

begin
	process(clk)
	begin
		if(clk'event and clk='1') then
			if clr='1' then
				dout <= "000000000000000";
			else
				dout <= din;
			end if;
		end if;
	end process;

end Behavioral;

