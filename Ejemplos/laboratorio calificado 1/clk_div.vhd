library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity clk_div is
	port(		inclk	:	in std_logic;
				outclk	:	out std_logic);
end clk_div;

architecture flujaso of clk_div is
signal cuenta_int	:	std_logic_vector(25 downto 0);
signal interno		:	std_logic;
begin
		process(inclk)
		begin
				if rising_edge(inclk) then
					cuenta_int <= cuenta_int + 1;
					if cuenta_int = 12500000 then
						cuenta_int <= (others => '0');
						interno <= not interno;
					end if;
				end if;
		end process;
		outclk <= interno;
end flujaso;		
						
						
