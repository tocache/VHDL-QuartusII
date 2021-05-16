library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity divisor is
	port(	entrada:	in std_logic;
			salida:	out std_logic);
end divisor;

architecture secuencia of divisor is
signal	cuenta:	std_logic_vector(25 downto 0);
signal	pre_salida:	std_logic;
begin
	salida <= pre_salida;
	process(entrada)
	begin
		if rising_edge(entrada) then
			if cuenta = 25000000 then
				cuenta <= (others => '0');
				pre_salida <= not pre_salida;
			else
				cuenta <= cuenta + 1;
			end if;
		end if;
	end process;
end secuencia;
