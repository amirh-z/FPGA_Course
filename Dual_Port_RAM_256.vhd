-- amirh_z

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Dual_Port_RAM_256 is
	port(din_A, din_B: in std_logic_vector(7 downto 0);
		  addr_A, addr_B: in std_logic_vector(7 downto 0);
		  we_A, we_B: in std_logic;
		  clk: in std_logic;
		  dout_A, dout_B: out std_logic_vector(7 downto 0));
end Dual_Port_RAM_256;

architecture behavioral of Dual_Port_RAM_256 is
	type memory is array(255 downto 0) of std_logic_vector(7 downto 0);
	shared variable RAM: memory;
begin

	-- Port A
	process(clk)
	begin
		if(clk'event and clk='1') then 
			if we_A='1' then
				RAM(to_integer(unsigned(addr_A))) := din_A;
			end if;
			dout_A <= RAM(to_integer(unsigned(addr_A)));
		end if;
	end process;
	
	-- Port B
	process(clk)
	begin
		if(clk'event and clk='1') then
			if we_B='1' then
				RAM(to_integer(unsigned(addr_B))) := din_B;
			end if;
			dout_B <= RAM(to_integer(unsigned(addr_B)));
		end if;
	end process;
end behavioral;