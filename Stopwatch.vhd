library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity Stopwatch is
	port(clk, clr, start: in std_logic;
		  centisec: out std_logic_vector(6 downto 0);
		  sec: out std_logic_vector(5 downto 0);
		  min: out std_logic_vector(5 downto 0));
end Stopwatch;

architecture Behavioral of Stopwatch is
begin
	process(clk, clr)
	variable centisec_cnt: integer range 0 to 100 := 0;
	variable sec_cnt: integer range 0 to 60 := 0;
	variable min_cnt: integer range 0 to 60 := 0;
	begin
		if (clk'event and clk='1') then
			if start = '1' then
				centisec_cnt := centisec_cnt + 1;
				if centisec_cnt = 100 then
					centisec_cnt := 0;
					sec_cnt := sec_cnt + 1;
					if sec_cnt = 60 then
						sec_cnt := 0;
						min_cnt := min_cnt + 1;
						if min_cnt = 60 then
							min_cnt := 0;
						end if;
					end if;
				end if;
			end if;
		end if;
		if clr = '1' then
			centisec_cnt := 0;
			sec_cnt := 0;
			min_cnt := 0;
		end if;
		centisec <= std_logic_vector(to_unsigned(centisec_cnt, centisec'length));
		sec <= std_logic_vector(to_unsigned(sec_cnt, sec'length));
		min <= std_logic_vector(to_unsigned(min_cnt, min'length));
	end process;
end Behavioral;