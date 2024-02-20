--amirh_z

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity Adder is
	port(A, B: in std_logic_vector(15 downto 0);
		  a_out: out std_logic_vector(15 downto 0));
end Adder;

architecture Behavioral of Adder is
	
begin
	a_out <= A + B;
end Behavioral;

