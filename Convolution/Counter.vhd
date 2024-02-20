--amirh_z

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity Counter is
	port(clk: in std_logic;
		  rco: out std_logic);
end Counter;

architecture Behavioral of Counter is

begin
	process(clk)
	variable count: std_logic_vector(3 downto 0) := "0000";
	begin
		if (clk'event and clk='1') then
			count := count + "0001";
			if count="1010" then
				count := "0000";
				rco <= '1';
			else
				rco <= '0';
			end if;
		end if;
	end process;

end Behavioral;