library ieee;
use ieee.std_logic_1164.all;

library vunit_lib;
context vunit_lib.vunit_context;

entity tb_controlUnit is
  generic (runner_cfg : string);
end entity;

architecture tb of tb_controlUnit is

  component controlUnit is
	port (
    instruction : in STD_LOGIC_VECTOR(3 downto 0);
    en      : out std_logic;
    inverteA: out STD_LOGIC;
    inverteB: out STD_LOGIC;
    carryIn : out STD_LOGIC;
    carryOut: in  STD_LOGIC;
    selecao : out STD_LOGIC_VECTOR(1 downto 0);
    zero    : in  STD_LOGIC
	);
end component;

    signal instruction : STD_LOGIC_VECTOR(3 downto 0);
    signal en          : std_logic;
    signal inverteA    : STD_LOGIC;
    signal inverteB    : STD_LOGIC;
    signal carryIn     : STD_LOGIC;
    signal carryOut    : STD_LOGIC := '0';
    signal selecao     : STD_LOGIC_VECTOR(1 downto 0);
    signal zero        : STD_LOGIC := '0';

begin

  u1 : controlUnit port map (instruction, en, inverteA, inverteB, carryIn, carryOut, selecao, zero);

  main : process
  begin
    test_runner_setup(runner, runner_cfg);

    instruction <= "0000";
    wait for 1 ns;
    assert(en = '1' and inverteA = '0' and inverteB = '0' and carryIn = '0' and selecao = "01")  report "Falha em teste." severity error;


    instruction <= "0001";
    wait for 1 ns;
    assert(en = '1' and inverteA = '0' and inverteB = '1' and carryIn = '0' and selecao = "01")  report "Falha em teste." severity error;


    instruction <= "0010";
    wait for 1 ns;
    assert(en = '1' and inverteA = '1' and inverteB = '1' and carryIn = '0' and selecao = "01")  report "Falha em teste." severity error;


    instruction <= "0011";
    wait for 1 ns;
    assert(en = '1' and inverteA = '1' and inverteB = '1' and carryIn = '0' and selecao = "00")  report "Falha em teste." severity error;

    instruction <= "0100";
    wait for 1 ns;
    assert(en = '1' and inverteA = '0' and inverteB = '0' and carryIn = '1' and selecao = "10")  report "Falha em teste." severity error;

    instruction <= "0101";
    wait for 1 ns;
    assert(en = '1' and inverteA = '0' and inverteB = '1' and carryIn = '1' and selecao = "10")  report "Falha em teste." severity error;

    instruction <= "0110";
    wait for 1 ns;
    assert(en = '1' and selecao = "11")  report "Falha em teste." severity error;

    test_runner_cleanup(runner); -- Simulacao acaba aqui

  end process;
end architecture;
