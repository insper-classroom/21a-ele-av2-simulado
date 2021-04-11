library ieee;
use ieee.std_logic_1164.all;

library vunit_lib;
context vunit_lib.vunit_context;

entity tb_mipsULA is
  generic (runner_cfg : string);
end entity;

architecture tb of tb_mipsULA is

component mipsuLA is
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
end component;

 signal A         : STD_LOGIC_VECTOR(31 downto 0);
 signal B         : STD_LOGIC_VECTOR(31 downto 0);
 signal inverteA  : STD_LOGIC;
 signal inverteB  : STD_LOGIC;
 signal carryIn   : STD_LOGIC;
 signal carryOut  : STD_LOGIC;
 signal selecao   : STD_LOGIC_VECTOR(1 downto 0);
 signal zero      : STD_LOGIC;
 signal resultado : STD_LOGIC_VECTOR(31 downto 0);

begin

  u1 : mipsULA port map(A, B, inverteA, inverteB, carryIn, carryOut, selecao, zero, resultado);

  main : process
  begin
    test_runner_setup(runner, runner_cfg);

    A <= x"00000001"; B <= x"00000001";
    inverteA <= '0'; inverteB <='0'; carryIn <= '0'; selecao<="00";
    wait for 1 ns;
    assert(resultado = x"00000001" and zero = '0')  report "Falha em teste: 1" severity error;

    inverteA <= '1'; inverteB <='0'; carryIn <= '0'; selecao<="00";
    wait for 1 ns;
    assert(resultado = x"00000000" and zero = '1')  report "Falha em teste: 1" severity error;

    inverteA <= '0'; inverteB <='1'; carryIn <= '0'; selecao<="00";
    wait for 1 ns;
    assert(resultado = x"00000000" and zero = '1')  report "Falha em teste: 1" severity error;

    inverteA <= '1'; inverteB <='0'; carryIn <= '0'; selecao<="01";
    wait for 1 ns;
    assert(resultado = x"FFFFFFFF" and zero = '0')  report "Falha em teste: 1" severity error;

    inverteA <= '0'; inverteB <='1'; carryIn <= '0'; selecao<="01";
    wait for 1 ns;
    assert(resultado = x"FFFFFFFF" and zero = '0')  report "Falha em teste: 1" severity error;

    inverteA <= '0'; inverteB <='1'; carryIn <= '0'; selecao<="10";
    wait for 1 ns;
    assert(resultado = x"FFFFFFFF" and zero = '0' and carryOut = '0')  report "Falha em teste: 1" severity error;

    A <= x"F0000001"; B <= x"F0000001";
    inverteA <= '0'; inverteB <='0'; carryIn <= '0'; selecao<="10";
    wait for 1 ns;
    assert(resultado = x"E0000002" and zero = '0' and carryOut = '1')  report "Falha em teste: 1" severity error;

    inverteA <= '0'; inverteB <='0'; carryIn <= '0'; selecao<="11";
    wait for 1 ns;
    assert(resultado = x"00000000" and zero = '1' and carryOut = '1')  report "Falha em teste: 1" severity error;

    test_runner_cleanup(runner); -- Simulacao acaba aqui

  end process;
end architecture;
