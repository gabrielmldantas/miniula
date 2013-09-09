library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
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
constant opcode_ghost : std_logic_vector (3 downto 0) := "0111";
constant opcode_pow : std_logic_vector (3 downto 0) := "1000";
constant opcode_modulo : std_logic_vector (3 downto 0) := "1001";
constant opcode_nand2 : std_logic_vector (3 downto 0) := "1010";
constant opcode_and2 : std_logic_vector (3 downto 0) := "1011";
constant opcode_or2 : std_logic_vector (3 downto 0) := "1100";
constant opcode_xor2 : std_logic_vector (3 downto 0) := "1101";
constant opcode_not2 : std_logic_vector (3 downto 0) := "1110";
constant opcode_comp : std_logic_vector (3 downto 0) := "1111";

begin
	process(a, b, opcode)
	begin
		case opcode is
			when opcode_add => s <= add(a,b);
			when opcode_sub => s <= sub(a,b);
			when opcode_div => s <= div(a,b);
			when opcode_mul => s <= mul(a(3 downto 0), b(3 downto 0));
			when opcode_inc => s <= inc(a);
			when opcode_dec => s <= dec(a);
			when opcode_ghost => s <= "XXXXXXXX";
			when opcode_pow => s <= "XXXXXXXX";--conv_int_bin(pow(conv_bin_int(a),conv_bin_int(b)));
			when opcode_modulo => s(0) <= modulo(a,b);
			when opcode_and2 => s <= and2(a,b);
			when opcode_or2 => s <= or2(a,b);
			when opcode_xor2 => s <= xor2(a,b);
			when opcode_not2 => s <= not2(a);
			when opcode_comp => s(0) <= comp(a,b);
			when opcode_nand2 => s <= nand2(a,b);
			when others => s <= "ZZZZZZZZ";
		end case;
	end process;
end arch;