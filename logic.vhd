library IEEE;
use ieee.std_logic_1164.all;

PACKAGE logic IS
	function and2(a: std_logic_vector(7 downto 0); b: std_logic_vector(7 downto 0)) return std_logic_vector;
	function or2(a: std_logic_vector(7 downto 0); b: std_logic_vector(7 downto 0)) return std_logic_vector;
	function xor2(a: std_logic_vector(7 downto 0); b: std_logic_vector(7 downto 0)) return std_logic_vector;
	function not2(a: std_logic_vector(7 downto 0)) return std_logic_vector;
	function comp(a: std_logic_vector(7 downto 0); b: std_logic_vector(7 downto 0)) return std_logic;
	function nand2(a: std_logic_vector(7 downto 0); b: std_logic_vector(7 downto 0)) return std_logic_vector;
	function is_maior_ou_igual (x : std_logic_vector; y : std_logic_vector) return std_logic;
END logic;

PACKAGE BODY logic IS
function and2(a: std_logic_vector(7 downto 0); b: std_logic_vector(7 downto 0)) return std_logic_vector is
variable c: std_logic_vector(7 downto 0);
begin
	for i in 7 downto 0 loop
		c(i) := a(i) and b(i);
	end loop;
	return c;
end and2;

function or2(a: std_logic_vector(7 downto 0); b: std_logic_vector(7 downto 0)) return std_logic_vector is
variable c: std_logic_vector(7 downto 0);
begin
	for i in 7 downto 0 loop
		c(i) := a(i) or b(i);
	end loop;
	return c;
end or2;

function xor2(a: std_logic_vector(7 downto 0); b: std_logic_vector(7 downto 0)) return std_logic_vector is
variable c: std_logic_vector(7 downto 0);
begin
	for i in 7 downto 0 loop
		c(i) := a(i) xor b(i);
	end loop;
	return c;
end xor2;

function not2(a: std_logic_vector(7 downto 0)) return std_logic_vector is
variable c: std_logic_vector(7 downto 0);
begin
	for i in 7 downto 0 loop
		c(i) := not a(i);
	end loop;
	return c;
end not2;

function comp(a: std_logic_vector(7 downto 0); b: std_logic_vector(7 downto 0)) return std_logic is
begin
	if a = b then
		return '1';
	else
		return '0';
	end if;
end comp;

function is_maior_ou_igual (x : std_logic_vector; y : std_logic_vector) return std_logic is
variable s : std_logic_vector (7 downto 0);
variable vaium : std_logic;
begin
	vaium := '0';
	for i in 0 to 7 loop
		s(i) := (x(i) xor y(i) xor vaium);
		vaium := ( y(i) and s(i) ) or ( y(i) and vaium) or (vaium and s(i) ) ;
	end loop;
	vaium := not vaium;
	return vaium;
end is_maior_ou_igual;

function nand2(a: std_logic_vector(7 downto 0); b: std_logic_vector(7 downto 0)) return std_logic_vector is
variable c : std_logic_vector(7 downto 0);
begin
	for i in 7 downto 0 loop
		c(i) := b(i) nand a(i);
	end loop;
	return c;
end nand2;
END logic;