library IEEE;
use ieee.std_logic_1164.all;

PACKAGE util IS
	PROCEDURE halt (SIGNAL s: OUT BIT);
--	PROCEDURE jmp (SIGNAL a : IN STD_LOGIC_VECTOR(7 downto 0), SIGNAL s: OUT BIT);
-- PROCEDURE je (SIGNAL a : IN STD_LOGIC_VECTOR(7 downto 0), SIGNAL s: OUT BIT);
--	PROCEDURE jne (SIGNAL a : IN STD_LOGIC_VECTOR(7 downto 0), SIGNAL s: OUT BIT);
END util;

PACKAGE BODY util IS
	PROCEDURE halt (SIGNAL s: OUT BIT) IS
	BEGIN
		s <= '1';
	END halt;
END util;
