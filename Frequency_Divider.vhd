-- amirh_z

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Frequency_Divider is
	port(clk_in: in std_logic;
		  ctrl: in std_logic_vector(3 downto 0);
		  clk_out: out std_logic);
end Frequency_Divider;

architecture Behavioral of Frequency_Divider is
begin
	process(clk_in)
	variable cnt: integer range 0 to 100 := 0;
	variable tmp: std_logic := '1';
	
	begin
		if (clk_in'event and clk_in='1') then
			cnt := cnt + 1;
			if (cnt=(to_integer(unsigned(ctrl)) * 10)) then
				tmp := not tmp;
			elsif cnt=100 then
				tmp := not tmp;
				cnt := 0;
			end if;
		end if;
		clk_out <= tmp;
	end process;
end Behavioral;