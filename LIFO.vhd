library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity LIFO is
	generic(n: integer range 0 to 255 := 8);
	port(din: in std_logic_vector(7 downto 0);
		  addr: in std_logic_vector(7 downto 0);
		  clk, rd_wr: in std_logic;
		  empty, full: out std_logic;
		  dout: out std_logic_vector(7 downto 0));
	
end LIFO;

architecture behavioral of LIFO is
	type memory is array (n-1 downto 0) of std_logic_vector(7 downto 0);
	shared variable RAM: memory;
	shared variable stack: integer range -1 to n := to_integer(unsigned(addr));
begin
	process(clk)
	begin
		if (clk'event and clk='1') then 
			if rd_wr='0' then -- write
				if stack = -1 then	
					empty<= '1';
					full <= '0';
				elsif stack<n then
					RAM(stack) := din;
					stack := stack+1;
					if stack=n then
						full <= '1';
						empty <= '0';
					else
						empty <= '0';
						full <= '0';
					end if;
				end if;
			elsif rd_wr='1' then -- read
				if stack=n then
					empty <= '0';
					full <= '1';
				elsif stack>-1 then
					dout <= RAM(stack);
					stack := stack-1;
					if stack=-1 then
						empty <= '1';
						full <= '0';
					else
						full <= '0';
						empty <= '0';
					end if;
				end if;
			end if;
		end if;
	end process;
end behavioral;