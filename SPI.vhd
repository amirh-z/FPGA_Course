library ieee;
use ieee.std_logic_1164.ALL;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;



entity SPI is
	port(din: in  std_logic_vector(7 downto 0);
        dout: out std_logic_vector(7 downto 0);
        din_ready: in  std_logic;
		  dout_ready: out std_logic;
        clk: in  std_logic;
        miso: in  std_logic;
        mosi: out std_logic;
        ss: out std_logic;
        sck: out std_logic;
		  spi_clk: in  std_logic;
        miso_in: in  std_logic
		  );	
end SPI;


architecture Behavioral of SPI is
	type machine is (idle, send, transceive);
	signal state: machine := idle;
	signal D_in : std_logic_vector(7 downto 0);
	signal D_out: std_logic_vector(7 downto 0);
begin
	process(clk)
		begin
			if(clk' event and clk='1') then
				case state is 
					when idle => 
						if(din_ready='1' and miso_in='0') then
							state <= send;
						elsif(din_ready='1' and miso_in='1') then
							state <= transceive;
						end if;
					when send => 
						if din_ready='0' then
							state <= idle;
						elsif miso_in='1' then
							state <= transceive;
						end if;
					when transceive => 
						if din_ready='0' then
							state <= idle;
						elsif miso_in='0' then
							state <= send;
						end if;
					when others => 
						state<= idle;
				end case;
			end if;
	end process;
	process(spi_clk)
		variable count: integer range 0 to 8:=0;
	begin
		if(spi_clk' event and spi_clk='1') then 
			if state=send then                                   
				D_in <= din;
				if count<8 then
					count := count + 1;
					mosi <= D_in(7);
					D_in <= D_in(6 downto 0) & '0';
					ss <= '0';
				elsif count=8 then
					count := 0;
					ss <= '1';
				end if;
				dout_ready <= '0';
				dout <= "UUUUUUUU";
			elsif state=transceive then                              
				if count<8 then
					count := count + 1;
					D_out <= D_out(6 downto 0) & miso;
					ss <= '0';
				elsif count=8 then
					count := 0;
					ss <= '1';
				end if;
				dout_ready <= '1';
				dout <= D_out;
			elsif(state=idle and din_ready='0') then             
				ss <= '1';
				mosi <= 'U';
				dout_ready <= '0';
				dout <= "UUUUUUUU";
			end if;
		end if;
		if state=idle then
			sck <= '1'; 
		else
			sck <= spi_clk;
		end if;
	end process;
end Behavioral;

