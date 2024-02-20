library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity main is
	port(a, x: in std_logic_vector(7 downto 0);
		  clk: in std_logic;
		  conv_out: out std_logic_vector(15 downto 0));
end main;

architecture Behavioral of main is
	component Multiplier
		port(A, B: in std_logic_vector(7 downto 0);
		  m_out: out std_logic_vector(15 downto 0));
	end component;
	
	component Adder
		port(A, B: in std_logic_vector(15 downto 0);
			  a_out: out std_logic_vector(15 downto 0));
	end component;
	
	component Inp_Reg
		port(din: in std_logic_vector(7 downto 0);
		  clk: in std_logic;
		  dout: out std_logic_vector(7 downto 0));
	end component;

	component Adder_Reg
		port(din: in std_logic_vector(15 downto 0);
		  clk, clr: in std_logic;
		  dout: out std_logic_vector(15 downto 0));
	end component;

	component Out_Reg
		port(din: in std_logic_vector(15 downto 0);
		  clk, en: in std_logic;
		  dout: out std_logic_vector(15 downto 0));
	end component;
	
	component counter
		port(clk: in std_logic;
		     rco: out std_logic);
	end component;
	
	signal inp1_mul: std_logic_vector(7 downto 0);
	signal inp2_mul: std_logic_vector(7 downto 0);
	signal inp1_adder: std_logic_vector(15 downto 0);
	signal dout_adder_reg: std_logic_vector(15 downto 0);
	signal adder_out: std_logic_vector(15 downto 0);
	signal counter_out: std_logic;
	
begin

	U1: Inp_Reg port map(a, clk, inp1_mul);
	U2: Inp_Reg port map(x, clk, inp2_mul);
	U3: multiplier port map(inp1_mul, inp2_mul, inp1_adder);
	U4: Adder port map(inp1_adder, dout_adder_reg, adder_out);
	U5: Adder_Reg port map(adder_out, clk, counter_out, dout_adder_reg);
	U6: Out_Reg port map(adder_out, clk, counter_out, conv_out);
	U7: counter port map(clk, counter_out);

end Behavioral;



