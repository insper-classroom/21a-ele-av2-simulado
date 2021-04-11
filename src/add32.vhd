Library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.all;

entity add32 is
	port(
		a       : in  STD_LOGIC_VECTOR(31 downto 0);
		b       : in  STD_LOGIC_VECTOR(31 downto 0);
    carryIn : in  STD_LOGIC;
    carryOut: out STD_LOGIC;
		q       : out STD_LOGIC_VECTOR(31 downto 0)
	);
end entity;

architecture rtl of add32 is

  signal r : STD_LOGIC_VECTOR(32 downto 0);

begin

  r <= std_logic_vector(('0' & signed(a)) + ('0' & signed(b)) + carryIn);
  q <= r(31 downto 0);
  carryOut <= r(32);

end architecture;
