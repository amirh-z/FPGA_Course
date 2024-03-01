library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity sin_wave is
	port(clk : in std_logic;
		  state : in std_logic_vector(1 downto 0);
		  DAC : out std_logic_vector(7 downto 0));
end sin_wave;

architecture Behavioral of sin_wave is

type mem64 is array (0 to 63) of integer range 0 to 255;
constant base_wave: mem64 :=( 128, 140, 152, 164, 176, 187, 198, 208, 217, 
										226, 233, 240, 245, 249, 252, 254, 255, 254, 
										252, 249, 245, 240, 233, 226, 217, 208, 198, 
										187, 176, 164, 152, 140, 128, 116, 104, 92, 
										80, 69, 58, 48, 39, 30, 23, 16, 11, 7, 4, 2, 
										1, 2, 4, 7, 11, 16, 23, 30, 39, 48, 58, 69, 
										80, 92, 104, 116);

signal div_clk: integer := 1563;

begin

	with state select
	div_clk <= 1563 when "00",
				  3126 when "01",
				  6252 when others;

	process(clk,state)
	variable counter: integer := 0;
	variable ptr: integer := 0;
	begin 
		if (clk'event and clk='1') then
			counter := counter + 1;
			if (counter = div_clk) then
				counter := 0;
				ptr := ptr + 1;
				if (ptr = 64) then 
					ptr := 0;
				end if;
			end if;
		end if;
		if (state = "11") then
			DAC <= conv_std_logic_vector(base_wave(ptr)/2, DAC'length);
		else
			DAC <= conv_std_logic_vector(base_wave(ptr), DAC'length);
		end if;
	end process;

end Behavioral;