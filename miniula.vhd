library IEEE;
use ieee.std_logic_1164.all;
use work.logic.all;
use work.arith.all;
use work.util.all;

entity miniula is
	port(a : in std_logic_vector(7 downto 0);
		  b : in std_logic_vector(7 downto 0);
		  s : out std_logic_vector(7 downto 0));
end miniula;

architecture arch of miniula is

function deslocador_esquerda_1bit (x : std_logic_vector (7 downto 0))
return std_logic_vector is
variable y : std_logic_vector (7 downto 0);
begin
for i in 7 downto 1 loop
 y(i) := x(i-1);
 end loop ;
 y(0) := '0';
return y;
end;

function div(a: std_logic_vector(7 downto 0); b: std_logic_vector(7 downto 0)) return std_logic_vector is
variable vq, vr : std_logic_vector (7 downto 0);
variable quoc, resto : std_logic;
begin
	vq := a;
	quoc := '0';
	resto := '0';
	vr := "00000000";
	for i in 0 to 7 loop
		quoc := vq(7);
		vq := deslocador_esquerda_1bit(vq);
		vq(0) := resto;
		vr := deslocador_esquerda_1bit(vr);
		vr(0) := quoc;
		resto := comp(vr, b);
		if resto = '1' then
			vr := sub (vr, b);
		end if;
	end loop;
	vq := deslocador_esquerda_1bit (vq);
	vq(0) := resto;
	return vq;
end div;
begin
process (a, b)
begin
	s <= div(a, b);
end process;
end arch;