library ieee;
use ieee.std_logic_1164.all;

library vunit_lib;
context vunit_lib.vunit_context;

entity tb_compare is
  generic (runner_cfg : string);
end entity;

architecture tb of tb_compare is

component compare is port (
  x : in  STD_LOGIC_VECTOR(1 downto 0);
  y : in  STD_LOGIC_VECTOR(1 downto 0);
  xeqy : out STD_LOGIC;
  xlty : out STD_LOGIC);
end component;

signal X,Y : std_logic_vector(1 downto 0);
signal o : STD_LOGIC_vector(1 downto 0);

begin

  u1 : compare port map(X,Y,o(1),o(0));

  main : process
  begin
    test_runner_setup(runner, runner_cfg);

    X<= "00"; Y<= "00";  wait for 200 ps;
    assert(o = "10")  report "Falha em teste: 1" severity error;

    X<= "10"; Y<= "10";  wait for 200 ps;
    assert(o = "10")  report "Falha em teste: 1" severity error;

    X<= "11"; Y<= "11";  wait for 200 ps;
    assert(o = "10")  report "Falha em teste: 1" severity error;

    X<= "10"; Y<= "00";  wait for 200 ps;
    assert(o = "00")  report "Falha em teste: 1" severity error;

    X<= "00"; Y<= "10";  wait for 200 ps;
    assert(o = "01")  report "Falha em teste: 1" severity error;

    X<= "01"; Y<= "10";  wait for 200 ps;
    assert(o = "01")  report "Falha em teste: 1" severity error;

    X<= "01"; Y<= "11";  wait for 200 ps;
    assert(o = "01")  report "Falha em teste: 1" severity error;
    test_runner_cleanup(runner); -- Simulacao acaba aqui

  end process;
end architecture;
