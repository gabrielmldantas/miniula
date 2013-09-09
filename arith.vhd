library IEEE;
use ieee.std_logic_1164.all;
use work.logic.all;

PACKAGE arith IS
	function add(a: std_logic_vector(7 downto 0); b: std_logic_vector(7 downto 0)) return std_logic_vector;
	function sub(a: std_logic_vector(7 downto 0); b: std_logic_vector(7 downto 0)) return std_logic_vector;
	function div(a: std_logic_vector(7 downto 0); b: std_logic_vector(7 downto 0)) return std_logic_vector;
	function mul(a: std_logic_vector(3 downto 0); b: std_logic_vector(3 downto 0)) return std_logic_vector;
	
	function inc(a: in std_logic_vector(7 downto 0)) return std_logic_vector;
	function dec(a: in std_logic_vector(7 downto 0)) return std_logic_vector;

	function pow(b : integer; e : integer) return integer;
	function modulo(a: std_logic_vector(7 downto 0); b: std_logic_vector(7 downto 0)) return std_logic_vector;
	function mdc(a: std_logic_vector(7 downto 0); b: std_logic_vector(7 downto 0)) return std_logic_vector;
	
END arith;

PACKAGE BODY arith IS

function add(a: std_logic_vector(7 downto 0); b: std_logic_vector(7 downto 0)) return std_logic_vector is
variable soma : std_logic_vector(7 downto 0);
variable vaium : std_logic;
begin
	vaium := '0';
	for i in 0 to 7 loop
		soma(i) := a(i) xor b(i) xor vaium;
		vaium := ( a(i) and b(i) ) or ( b(i) and vaium) or (vaium and a(i) );
	end loop;
	return soma;
end add;

function sub(a: std_logic_vector(7 downto 0); b: std_logic_vector(7 downto 0)) return std_logic_vector is
variable result : std_logic_vector(7 downto 0);
variable vaium : std_logic;
begin
	vaium := '0';
	for i in 0 to 7 loop
		result(i) := (a(i) xor b(i) xor vaium);
		vaium := ( b(i) and result(i) ) or ( b(i) and vaium) or (vaium and result(i) );
	end loop ;
	return result;
end sub;

function sub4(a: std_logic_vector(3 downto 0); b: std_logic_vector(3 downto 0)) return std_logic_vector is
variable result : std_logic_vector(3 downto 0);
variable vaium : std_logic;
begin
	vaium := '0';
	for i in 0 to 3 loop
		result(i) := (a(i) xor b(i) xor vaium);
		vaium := ( b(i) and result(i) ) or ( b(i) and vaium) or (vaium and result(i) );
	end loop ;
	return result;
end sub4;

function deslocador (x : std_logic_vector (3 downto 0))
return std_logic_vector is
variable y : std_logic_vector (3 downto 0);
begin
	for i in 3 downto 1 loop
		y(i) := x(i-1);
	end loop ;
	y(0) := '0';
	return y;
end;

function deslocador8bits (x : std_logic_vector (7 downto 0)) return std_logic_vector is
variable y : std_logic_vector (7 downto 0);
begin
	for i in 7 downto 1 loop
		y(i) := x(i-1);
	end loop ;
	y(0) := '0';
	return y;
end;


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

function somador8bits (a : std_logic_vector (7 downto 0);
b : std_logic_vector (3 downto 0))
return std_logic_vector is
variable vaium : std_logic;
variable soma : std_logic_vector (7 downto 0);
variable aux : std_logic_vector (7 downto 0);
begin
	vaium := '0';
	aux := "00000000";
	aux(3 downto 0) := b;
	for i in 0 to 7 loop
		soma(i) := a(i) xor aux(i) xor vaium;
		vaium := ( a(i) and aux(i) ) or ( aux(i) and vaium) or
			(vaium and a(i) );
	end loop;
	return soma;
end;

function mul(a: std_logic_vector(3 downto 0); b: std_logic_vector(3 downto 0)) return std_logic_vector is

variable aux1 : std_logic_vector (7 downto 0);
variable aux2 : std_logic_vector (3 downto 0);
variable vaium : std_logic;
begin
	aux1 := "00000000";
	aux2 := a;
	vaium := '0';
	for i in 0 to 3 loop
		aux1 := deslocador8bits( aux1 );
		vaium := aux2(3);
		if vaium = '1' then
			aux1 := somador8bits( aux1, b );
		end if;
		aux2 := deslocador( aux2 );
	end loop;
	return aux1;
end mul;


function inc(a: std_logic_vector(7 downto 0)) return std_logic_vector is 
begin
	return add(a,"00000001");
end inc;


function dec(a: std_logic_vector(7 downto 0)) return std_logic_vector is
begin
	return sub(a,"00000001");
end dec;

function pow(b : integer; e : integer) return integer is
variable p : integer;
begin
	p := 1;
	for i in 1 to e loop
		p := p * b;
	end loop;
	return p;
end pow;

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

function modulo(a: std_logic_vector(7 downto 0); b: std_logic_vector(7 downto 0)) return std_logic_vector is 
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
	return vr;
end modulo;

function mdc(a: std_logic_vector(3 downto 0); b: std_logic_vector(3 downto 0)) return std_logic_vector is
variable x, y : std_logic_vector(3 downto 0);
begin
	x := a;
	y := b;
	for i in 0 to 15 loop
		if (x /= y) then
			if (x < y) then
				y := sub4(y, x);
			else
				x := sub4(x, y);
			end if;
		end if;
	end loop;
	return x;
end mdc;

END arith;