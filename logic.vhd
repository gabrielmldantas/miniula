library IEEE;
use ieee.std_logic_1164.all;

PACKAGE logic IS
	function and2(a: std_logic_vector(7 downto 0); b: std_logic_vector(7 downto 0)) return std_logic_vector;
	function or2(a: std_logic_vector(7 downto 0); b: std_logic_vector(7 downto 0)) return std_logic_vector;
	function xor2(a: std_logic_vector(7 downto 0); b: std_logic_vector(7 downto 0)) return std_logic_vector;
	function not2(a: std_logic_vector(7 downto 0)) return std_logic_vector;
	function comp(a: std_logic_vector(7 downto 0); b: std_logic_vector(7 downto 0)) return std_logic;
	function nand2(a: std_logic_vector(7 downto 0); b: std_logic_vector(7 downto 0)) return std_logic_vector;
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

function nand2(a: std_logic_vector(7 downto 0); b: std_logic_vector(7 downto 0)) return std_logic_vector is
variable c : std_logic_vector(7 downto 0);
begin
	for i in 7 downto 0 loop
		c(i) := b(i) nand a(i);
	end loop;
	return c;
end nand2;
END logic;