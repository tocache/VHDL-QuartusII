library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity det_seq is
port ( clk, D: in std_logic;
           Q: out std_logic);
end det_seq;

architecture flujo of det_seq is

TYPE estados is (E0, E1, E2, E3, E4, E5);
SIGNAL es_p: estados;

begin
	process (clk)
	begin
		if rising_edge(clk) then
			case es_p is
				when E0 =>
					if D = '0' then
						es_p <= E0;
					else
						es_p <= E1;
					end if;
				when E1 =>
					if D = '0' then
						es_p <= E0;
					else
						es_p <= E2;
					end if;
				when E2 =>
					if D = '0' then
						es_p <= E3;
					else
						es_p <= E2;
					end if;
				when E3 =>
					if D = '0' then
						es_p <= E0;
					else
						es_p <= E4;
					end if;
				when E4 =>
					if D = '0' then
						es_p <= E0;
					else
						es_p <= E5;
					end if;
				when E5 =>
					if D = '0' then
						es_p <= E3;
					else
						es_p <= E2;
					end if;
				when others =>
					es_p <= E0;
			end case;
		end if;
	end process;
	
--	with es_p select
--		Q <= D when E5, '0' when others;
	
	process(D)
	begin
		if es_p = E5 then
			Q <= D;
		else
			Q <= '0';
		end if;
	end process;
end flujo;