library IEEE;
use ieee.std_logic_1164.all;
use work.logic.all;
use work.arith.all;

entity miniula is
	port(a : in std_logic_vector(7 downto 0);
		  b : in std_logic_vector(7 downto 0);
		  opcode : in std_logic_vector(3 downto 0);
		  s : out std_logic_vector(7 downto 0));
end miniula;

architecture arch of miniula is
constant opcode_add : std_logic_vector (3 downto 0) := "0000";
constant opcode_sub : std_logic_vector (3 downto 0) := "0001";
constant opcode_div : std_logic_vector (3 downto 0) := "0010";
constant opcode_mul : std_logic_vector (3 downto 0) := "0011";
constant opcode_inc : std_logic_vector (3 downto 0) := "0100";
constant opcode_dec : std_logic_vector (3 downto 0) := "0101";
constant opcode_conv_bin_int : std_logic_vector (3 downto 0) := "0110";
constant opcode_pow : std_logic_vector (3 downto 0) := "0111";
constant opcode_modulo : std_logic_vector (3 downto 0) := "1000";
constant opcode_mdc : std_logic_vector (3 downto 0) := "1001";
constant opcode_and2 : std_logic_vector (3 downto 0) := "1010";
constant opcode_or2 : std_logic_vector (3 downto 0) := "1011";
constant opcode_xor2 : std_logic_vector (3 downto 0) := "1100";
constant opcode_not2 : std_logic_vector (3 downto 0) := "1101";
constant opcode_comp : std_logic_vector (3 downto 0) := "1110";

begin
end arch;