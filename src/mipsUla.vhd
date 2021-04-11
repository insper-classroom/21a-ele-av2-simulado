library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mipsUla is
  port (
    A           : in  STD_LOGIC_VECTOR(31 downto 0);
    B           : in  STD_LOGIC_VECTOR(31 downto 0);
    inverteA    : in  STD_LOGIC;
    inverteB    : in  STD_LOGIC;
    carryIn     : in  STD_LOGIC;
    carryOut    : out STD_LOGIC;
    selecao     : in  STD_LOGIC_VECTOR(1 downto 0);
    zero        : out STD_LOGIC;
    resultado   : out STD_LOGIC_VECTOR(31 downto 0)
    );
end entity;

architecture  rtl OF mipsUla IS

component add32 is
	port(
		a       : in  STD_LOGIC_VECTOR(31 downto 0);
		b       : in  STD_LOGIC_VECTOR(31 downto 0);
    carryIn : in  STD_LOGIC;
    carryOut: out STD_LOGIC;
		q       : out STD_LOGIC_VECTOR(31 downto 0)
	);
end component;

component Mux2Way32 is
	port (
			a:   in  STD_LOGIC_VECTOR(31 downto 0);
			b:   in  STD_LOGIC_VECTOR(31 downto 0);
			sel: in  STD_LOGIC;
			q:   out STD_LOGIC_VECTOR(31 downto 0));
end component;

component Mux4Way32 is
	port (
			a:   in  STD_LOGIC_VECTOR(31 downto 0);
			b:   in  STD_LOGIC_VECTOR(31 downto 0);
			c:   in  STD_LOGIC_VECTOR(31 downto 0);
			d:   in  STD_LOGIC_VECTOR(31 downto 0);
			sel: in  STD_LOGIC_VECTOR(1 downto 0);
			q:   out STD_LOGIC_VECTOR(31 downto 0));
end component;

signal notA, notB       : STD_LOGIC_VECTOR(31 downto 0);
signal muxAout, muxBout : STD_LOGIC_VECTOR(31 downto 0);
signal orOut, andOut    : STD_LOGIC_VECTOR(31 downto 0);
signal addOut           : STD_LOGIC_VECTOR(31 downto 0);
signal muxSelOut        : STD_LOGIC_VECTOR(31 downto 0);

begin

end architecture;
