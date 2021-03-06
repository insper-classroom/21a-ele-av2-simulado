library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux2Way32 is
	port ( 
			a:   in  STD_LOGIC_VECTOR(31 downto 0);
			b:   in  STD_LOGIC_VECTOR(31 downto 0);
			sel: in  STD_LOGIC;
			q:   out STD_LOGIC_VECTOR(31 downto 0));
end entity;

architecture arch of Mux2Way32 is

begin

  q <= a when sel = '0' else
	   b;

end architecture;
