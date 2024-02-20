--amirh_z

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity Multiplier is
	port(A, B: in std_logic_vector(7 downto 0);
		  m_out: out std_logic_vector(15 downto 0));
end Multiplier;

architecture Behavioral of Multiplier is

begin
	m_out <= A * B;
end Behavioral;




