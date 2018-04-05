--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : ppmmvsh.vhf
-- /___/   /\     Timestamp : 12/15/2017 17:09:46
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -intstyle ise -family artix7 -flat -suppress -vhdl "S:/Exp 3 - Copy/ppmmvsh/ppmmvsh.vhf" -w "S:/Exp 3 - Copy/ppmmvsh/ppmmvsh.sch"
--Design Name: ppmmvsh
--Device: artix7
--Purpose:
--    This vhdl netlist is translated from an ECS schematic. It can be 
--    synthesized and simulated, but it should not be modified. 
--
----- CELL COMPM2_HXILINX_ppmmvsh -----
  
library IEEE;
use IEEE.STD_LOGIC_1164.all;
--use IEEE.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity COMPM2_HXILINX_ppmmvsh is
  
port(
    GT  : out std_logic;
    LT  : out std_logic;

    A0  : in std_logic;
    A1  : in std_logic;
    B0  : in std_logic;
    B1  : in std_logic
  );
end COMPM2_HXILINX_ppmmvsh;

architecture COMPM2_HXILINX_ppmmvsh_V of COMPM2_HXILINX_ppmmvsh is

  signal a_tmp: std_logic_vector(1 downto 0);
  signal b_tmp: std_logic_vector(1 downto 0);

begin

 a_tmp <= A1&A0;
 b_tmp <= B1&B0; 
 GT <= '1' when (a_tmp > b_tmp) else '0';
 LT <= '1' when (a_tmp < b_tmp) else '0';
     
end COMPM2_HXILINX_ppmmvsh_V;
----- CELL COMPM4_HXILINX_ppmmvsh -----
  
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.std_logic_unsigned.all;

entity COMPM4_HXILINX_ppmmvsh is
  
port(
    GT  : out std_logic;
    LT  : out std_logic;

    A0  : in std_logic;
    A1  : in std_logic;
    A2  : in std_logic;
    A3  : in std_logic;
    B0  : in std_logic;
    B1  : in std_logic;
    B2  : in std_logic;
    B3  : in std_logic
  );
end COMPM4_HXILINX_ppmmvsh;

architecture COMPM4_HXILINX_ppmmvsh_V of COMPM4_HXILINX_ppmmvsh is
  signal a_tmp: std_logic_vector(3 downto 0);
  signal b_tmp: std_logic_vector(3 downto 0);

begin

   a_tmp <= A3&A2&A1&A0;
   b_tmp <= B3&B2&B1&B0;
   
   GT <= '1' when (a_tmp > b_tmp ) else '0';
   LT <= '1' when (a_tmp < b_tmp ) else '0';
     
end COMPM4_HXILINX_ppmmvsh_V;
----- CELL COMPM8_HXILINX_ppmmvsh -----
  
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.std_logic_unsigned.all;

entity COMPM8_HXILINX_ppmmvsh is
port(
    GT  : out std_logic;
    LT  : out std_logic;

    A   : in std_logic_vector(7 downto 0);
    B   : in std_logic_vector(7 downto 0)
  );
end COMPM8_HXILINX_ppmmvsh;

architecture COMPM8_HXILINX_ppmmvsh_V of COMPM8_HXILINX_ppmmvsh is
begin
     
  GT <= '1' when (A > B) else '0';
  LT <= '1' when (A < B) else '0';
 
end COMPM8_HXILINX_ppmmvsh_V;
----- CELL FD8CE_HXILINX_ppmmvsh -----


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FD8CE_HXILINX_ppmmvsh is
port (
    Q   : out STD_LOGIC_VECTOR(7 downto 0) := (others => '0');

    C   : in STD_LOGIC;
    CE  : in STD_LOGIC;
    CLR : in STD_LOGIC;
    D   : in STD_LOGIC_VECTOR(7 downto 0)
    );
end FD8CE_HXILINX_ppmmvsh;

architecture Behavioral of FD8CE_HXILINX_ppmmvsh is

begin

process(C, CLR)
begin
  if (CLR='1') then
    Q <= (others => '0');
  elsif (C'event and C = '1') then
    if (CE='1') then 
      Q <= D;
    end if;
  end if;
end process;


end Behavioral;

----- CELL CB4CE_HXILINX_ppmmvsh -----


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity CB4CE_HXILINX_ppmmvsh is
  
port (
    CEO  : out STD_LOGIC;
    Q0   : out STD_LOGIC;
    Q1   : out STD_LOGIC;
    Q2   : out STD_LOGIC;
    Q3   : out STD_LOGIC;
    TC   : out STD_LOGIC;
    C    : in STD_LOGIC;
    CE   : in STD_LOGIC;
    CLR  : in STD_LOGIC
    );
end CB4CE_HXILINX_ppmmvsh;

architecture Behavioral of CB4CE_HXILINX_ppmmvsh is

  signal COUNT : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
  constant TERMINAL_COUNT : STD_LOGIC_VECTOR(3 downto 0) := (others => '1');
  
begin

process(C, CLR)
begin
  if (CLR='1') then
    COUNT <= (others => '0');
  elsif (C'event and C = '1') then
    if (CE='1') then 
      COUNT <= COUNT+1;
    end if;
  end if;
end process;

TC   <= '1' when (COUNT = TERMINAL_COUNT) else '0';
CEO  <= '1' when ((COUNT = TERMINAL_COUNT) and CE='1') else '0';

Q3 <= COUNT(3);
Q2 <= COUNT(2);
Q1 <= COUNT(1);
Q0 <= COUNT(0);

end Behavioral;

----- CELL M2_1E_HXILINX_ppmmvsh -----
  
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity M2_1E_HXILINX_ppmmvsh is
  
port(
    O   : out std_logic;

    D0  : in std_logic;
    D1  : in std_logic;
    E   : in std_logic;
    S0  : in std_logic
  );
end M2_1E_HXILINX_ppmmvsh;

architecture M2_1E_HXILINX_ppmmvsh_V of M2_1E_HXILINX_ppmmvsh is
begin
  process (D0, D1, E, S0)
  begin
    if( E = '0') then
    O <= '0';
    else
      case S0 is
      when '0' => O <= D0;
      when '1' => O <= D1;
      when others => NULL;
      end case;
    end if;
    end process; 
end M2_1E_HXILINX_ppmmvsh_V;
----- CELL ADD4_HXILINX_ppmmvsh -----
  
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity ADD4_HXILINX_ppmmvsh is
  port(
    CO  : out std_logic;
    OFL : out std_logic;
    S0  : out std_logic;
    S1  : out std_logic;
    S2  : out std_logic;
    S3  : out std_logic;

    A0  : in std_logic;
    A1  : in std_logic;
    A2  : in std_logic;
    A3  : in std_logic;
    B0  : in std_logic;
    B1  : in std_logic;
    B2  : in std_logic;
    B3  : in std_logic;
    CI  : in std_logic
  );
end ADD4_HXILINX_ppmmvsh;

architecture ADD4_HXILINX_ppmmvsh_V of ADD4_HXILINX_ppmmvsh is
begin
 adsu_p : process (A0, A1, A2, A3, B0, B1, B2, B3, CI)
    variable adsu_tmp : std_logic_vector(4 downto 0);
    variable a_tmp    : std_logic_vector(3 downto 0);
    variable b_tmp    : std_logic_vector(3 downto 0);
  begin
    a_tmp := A3 & A2 & A1 & A0;
    b_tmp := B3 & B2 & B1 & B0;
    adsu_tmp := conv_std_logic_vector((conv_integer(a_tmp) + conv_integer(b_tmp) + conv_integer(CI)),5);
      
    S3 <= adsu_tmp(3);
    S2 <= adsu_tmp(2);
    S1 <= adsu_tmp(1);
    S0 <= adsu_tmp(0);
    CO <= adsu_tmp(4);
    OFL <= ( A3 and B3 and (not adsu_tmp(3)) ) or ( (not A3) and (not B3) and adsu_tmp(3) ); 
  end process; 

end ADD4_HXILINX_ppmmvsh_V;
----- CELL ADD8_HXILINX_ppmmvsh -----
  
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity ADD8_HXILINX_ppmmvsh is
port(
    CO  : out std_logic;
    OFL : out std_logic;
    S   : out std_logic_vector(7 downto 0);
    A   : in std_logic_vector(7 downto 0);
    B   : in std_logic_vector(7 downto 0);
    CI  : in std_logic
  );
end ADD8_HXILINX_ppmmvsh;

architecture ADD8_HXILINX_ppmmvsh_V of ADD8_HXILINX_ppmmvsh is
  signal adder_tmp: std_logic_vector(8 downto 0);
begin
  adder_tmp <= conv_std_logic_vector((conv_integer(A) + conv_integer(B) + conv_integer(CI)),9);
  S  <= adder_tmp(7 downto 0);
  CO <= adder_tmp(8);
  OFL <=  ( A(7) and B(7) and (not adder_tmp(7)) ) or ( (not A(7)) and (not B(7)) and adder_tmp(7) );  
end ADD8_HXILINX_ppmmvsh_V;
----- CELL COMP4_HXILINX_ppmmvsh -----
  
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity COMP4_HXILINX_ppmmvsh is
  
port(
    EQ  : out std_logic;

    A0  : in std_logic;
    A1  : in std_logic;
    A2  : in std_logic;
    A3  : in std_logic;
    B0  : in std_logic;
    B1  : in std_logic;
    B2  : in std_logic;
    B3  : in std_logic
  );
end COMP4_HXILINX_ppmmvsh;

architecture COMP4_HXILINX_ppmmvsh_V of COMP4_HXILINX_ppmmvsh is
begin
  EQ <= '1' when (A0=B0 and A1=B1 and A2=B2 and A3=B3) else '0';
end COMP4_HXILINX_ppmmvsh_V;
----- CELL CB4CLED_HXILINX_ppmmvsh -----

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity CB4CLED_HXILINX_ppmmvsh is
	
port (
        CEO : out STD_LOGIC;
        Q0  : out STD_LOGIC;
        Q1  : out STD_LOGIC;
        Q2  : out STD_LOGIC;
        Q3  : out STD_LOGIC;
        TC  : out STD_LOGIC;
        C   : in STD_LOGIC;
        CE  : in STD_LOGIC;
        CLR : in STD_LOGIC;
        D0  : in STD_LOGIC;	
        D1  : in STD_LOGIC;	
        D2  : in STD_LOGIC;	
        D3  : in STD_LOGIC;	
        L   : in STD_LOGIC;
        UP  : in STD_LOGIC );
end CB4CLED_HXILINX_ppmmvsh;

architecture Behavioral of CB4CLED_HXILINX_ppmmvsh is

  signal COUNT : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');

  constant TERMINAL_COUNT_UP : STD_LOGIC_VECTOR(3 downto 0) := (others => '1');
  constant TERMINAL_COUNT_DOWN : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');

begin

process(C, CLR)
begin
  if (CLR='1') then
    COUNT <= (others => '0');
  elsif (C'event and C = '1') then
    if (L = '1') then
      COUNT <= D3&D2&D1&D0;
    elsif (CE='1') then
      if (UP='1') then
        COUNT <= COUNT+1;
      elsif (UP='0') then
        COUNT <= COUNT-1;
      end if;
    end if;
  end if;
end process;

TC  <= '0' when  (CLR = '1') else 
       '1' when  (((COUNT = TERMINAL_COUNT_UP) and (UP = '1')) or 
        ((COUNT = TERMINAL_COUNT_DOWN) and (UP = '0'))) else '0'; 
CEO <= '1' when  ((((COUNT = TERMINAL_COUNT_UP) and (UP = '1')) or 
        ((COUNT = TERMINAL_COUNT_DOWN) and (UP = '0'))) and CE='1') else '0'; 

Q3  <= COUNT(3);
Q2  <= COUNT(2);
Q1  <= COUNT(1);
Q0  <= COUNT(0);

end Behavioral;
----- CELL M8_1E_HXILINX_ppmmvsh -----
  
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity M8_1E_HXILINX_ppmmvsh is
  
port(
    O   : out std_logic;

    D0  : in std_logic;
    D1  : in std_logic;
    D2  : in std_logic;
    D3  : in std_logic;
    D4  : in std_logic;
    D5  : in std_logic;
    D6  : in std_logic;
    D7  : in std_logic;
    E   : in std_logic;
    S0  : in std_logic;
    S1  : in std_logic;
    S2  : in std_logic
  );
end M8_1E_HXILINX_ppmmvsh;

architecture M8_1E_HXILINX_ppmmvsh_V of M8_1E_HXILINX_ppmmvsh is
begin
  process (D0, D1, D2, D3, D4, D5, D6, D7, E, S0, S1, S2)
  variable sel : std_logic_vector(2 downto 0);
  begin
    sel := S2&S1&S0;
    if( E = '0') then
    O <= '0';
    else
      case sel is
      when "000" => O <= D0;
      when "001" => O <= D1;
      when "010" => O <= D2;
      when "011" => O <= D3;
      when "100" => O <= D4;
      when "101" => O <= D5;
      when "110" => O <= D6;
      when "111" => O <= D7;
      when others => NULL;
      end case;
    end if;
    end process; 
end M8_1E_HXILINX_ppmmvsh_V;
----- CELL CD4CE_HXILINX_ppmmvsh -----


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity CD4CE_HXILINX_ppmmvsh is
  
port (
    CEO  : out STD_LOGIC;
    Q0   : out STD_LOGIC;
    Q1   : out STD_LOGIC;
    Q2   : out STD_LOGIC;
    Q3   : out STD_LOGIC;
    TC   : out STD_LOGIC;
    C    : in STD_LOGIC;
    CE   : in STD_LOGIC;
    CLR  : in STD_LOGIC
    );
end CD4CE_HXILINX_ppmmvsh;

architecture Behavioral of CD4CE_HXILINX_ppmmvsh is

  signal COUNT : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
  constant TERMINAL_COUNT : STD_LOGIC_VECTOR(3 downto 0) := "1001";
  
begin

process(C, CLR)
begin
  if (CLR='1') then
    COUNT <= (others => '0');
  elsif (C'event and C = '1') then
    if (CE='1') then 

      if (COUNT = "1001") then
        COUNT <= "0000";
      elsif (COUNT = "1011") then
        COUNT <= "0110";
      elsif (COUNT = "1101") then
        COUNT <= "0100";
      elsif (COUNT = "1111") then
        COUNT <= "0010";
      else
        COUNT <= COUNT+1;
      end if;

    end if;
  end if;
end process;

TC   <= '0' when (CLR = '1') else
        '1' when (COUNT = TERMINAL_COUNT) else '0';
CEO  <= '1' when ((COUNT = TERMINAL_COUNT) and CE='1') else '0';

Q3   <= COUNT(3);
Q2   <= COUNT(2);
Q1   <= COUNT(1);
Q0   <= COUNT(0);

end Behavioral;

----- CELL FD4CE_HXILINX_ppmmvsh -----


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FD4CE_HXILINX_ppmmvsh is
port (
    Q0  : out STD_LOGIC := '0';
    Q1  : out STD_LOGIC := '0';
    Q2  : out STD_LOGIC := '0';
    Q3  : out STD_LOGIC := '0';

    C   : in STD_LOGIC;
    CE  : in STD_LOGIC;
    CLR : in STD_LOGIC;
    D0  : in STD_LOGIC;
    D1  : in STD_LOGIC;
    D2  : in STD_LOGIC;
    D3  : in STD_LOGIC
    );
end FD4CE_HXILINX_ppmmvsh;

architecture Behavioral of FD4CE_HXILINX_ppmmvsh is

begin

process(C, CLR)
begin
  if (CLR='1') then
    Q3 <= '0';
    Q2 <= '0';
    Q1 <= '0';
    Q0 <= '0';
  elsif (C'event and C = '1') then
    if (CE='1') then 
      Q3 <= D3;
      Q2 <= D2;
      Q1 <= D1;
      Q0 <= D0;
    end if;
  end if;
end process;


end Behavioral;

----- CELL CB16CE_HXILINX_ppmmvsh -----


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity CB16CE_HXILINX_ppmmvsh is
port (
    CEO : out STD_LOGIC;
    Q   : out STD_LOGIC_VECTOR(15 downto 0);
    TC  : out STD_LOGIC;
    C   : in STD_LOGIC;
    CE  : in STD_LOGIC;
    CLR : in STD_LOGIC
    );
end CB16CE_HXILINX_ppmmvsh;

architecture Behavioral of CB16CE_HXILINX_ppmmvsh is

  signal COUNT : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
  constant TERMINAL_COUNT : STD_LOGIC_VECTOR(15 downto 0) := (others => '1');
  
begin

process(C, CLR)
begin
  if (CLR='1') then
    COUNT <= (others => '0');
  elsif (C'event and C = '1') then
    if (CE='1') then 
      COUNT <= COUNT+1;
    end if;
  end if;
end process;

TC  <= '1' when (COUNT = TERMINAL_COUNT) else '0';
CEO <= '1' when ((COUNT = TERMINAL_COUNT) and CE='1') else '0';
Q   <= COUNT;

end Behavioral;

----- CELL D3_8E_HXILINX_ppmmvsh -----
  
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity D3_8E_HXILINX_ppmmvsh is
  
port(
    D0  : out std_logic;
    D1  : out std_logic;
    D2  : out std_logic;
    D3  : out std_logic;
    D4  : out std_logic;
    D5  : out std_logic;
    D6  : out std_logic;
    D7  : out std_logic;

    A0  : in std_logic;
    A1  : in std_logic;
    A2  : in std_logic;
    E   : in std_logic
  );
end D3_8E_HXILINX_ppmmvsh;

architecture D3_8E_HXILINX_ppmmvsh_V of D3_8E_HXILINX_ppmmvsh is
  signal d_tmp : std_logic_vector(7 downto 0);
begin
  process (A0, A1, A2, E)
  variable sel   : std_logic_vector(2 downto 0);
  begin
    sel := A2&A1&A0;
    if( E = '0') then
    d_tmp <= "00000000";
    else
      case sel is
      when "000" => d_tmp <= "00000001";
      when "001" => d_tmp <= "00000010";
      when "010" => d_tmp <= "00000100";
      when "011" => d_tmp <= "00001000";
      when "100" => d_tmp <= "00010000";
      when "101" => d_tmp <= "00100000";
      when "110" => d_tmp <= "01000000";
      when "111" => d_tmp <= "10000000";
      when others => NULL;
      end case;
    end if;
  end process; 

    D7 <= d_tmp(7);
    D6 <= d_tmp(6);
    D5 <= d_tmp(5);
    D4 <= d_tmp(4);
    D3 <= d_tmp(3);
    D2 <= d_tmp(2);
    D1 <= d_tmp(1);
    D0 <= d_tmp(0);

end D3_8E_HXILINX_ppmmvsh_V;
----- CELL M4_1E_HXILINX_ppmmvsh -----
  
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity M4_1E_HXILINX_ppmmvsh is
  
port(
    O   : out std_logic;

    D0  : in std_logic;
    D1  : in std_logic;
    D2  : in std_logic;
    D3  : in std_logic;
    E   : in std_logic;
    S0  : in std_logic;
    S1  : in std_logic
  );
end M4_1E_HXILINX_ppmmvsh;

architecture M4_1E_HXILINX_ppmmvsh_V of M4_1E_HXILINX_ppmmvsh is
begin
  process (D0, D1, D2, D3, E, S0, S1)
  variable sel : std_logic_vector(1 downto 0);
  begin
    sel := S1&S0;
    if( E = '0') then
    O <= '0';
    else
      case sel is
      when "00" => O <= D0;
      when "01" => O <= D1;
      when "10" => O <= D2;
      when "11" => O <= D3;
      when others => NULL;
      end case;
    end if;
    end process; 
end M4_1E_HXILINX_ppmmvsh_V;
----- CELL CB4CLE_HXILINX_ppmmvsh -----

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity CB4CLE_HXILINX_ppmmvsh is
  
port (
    CEO : out STD_LOGIC;
    Q0  : out STD_LOGIC;
    Q1  : out STD_LOGIC;
    Q2  : out STD_LOGIC;
    Q3  : out STD_LOGIC;
    TC  : out STD_LOGIC;
    C   : in STD_LOGIC;
    CE  : in STD_LOGIC;
    CLR : in STD_LOGIC;
    D0  : in STD_LOGIC;	
    D1  : in STD_LOGIC;	
    D2  : in STD_LOGIC;	
    D3  : in STD_LOGIC;	
    L   : in STD_LOGIC );
end CB4CLE_HXILINX_ppmmvsh;

architecture Behavioral of CB4CLE_HXILINX_ppmmvsh is

  signal COUNT : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
  constant TERMINAL_COUNT : STD_LOGIC_VECTOR(3 downto 0) := (others => '1');

begin

process(C, CLR)
begin
  if (CLR='1') then
    COUNT <= (others => '0');
  elsif (C'event and C ='1') then
    if (L = '1') then
      COUNT <= D3&D2&D1&D0;
    elsif (CE='1') then 
      COUNT <= COUNT+1;
    end if;
  end if;
end process;

TC  <=  '0' when (CLR = '1') else
        '1' when (COUNT = TERMINAL_COUNT) else '0'; 
CEO <= '1' when ((COUNT = TERMINAL_COUNT) and CE='1') else '0';
 
Q3  <= COUNT(3);
Q2  <= COUNT(2);
Q1  <= COUNT(1);
Q0  <= COUNT(0);

end Behavioral;
----- CELL D2_4E_HXILINX_ppmmvsh -----
  
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity D2_4E_HXILINX_ppmmvsh is
  
port(
    D0  : out std_logic;
    D1  : out std_logic;
    D2  : out std_logic;
    D3  : out std_logic;

    A0  : in std_logic;
    A1  : in std_logic;
    E   : in std_logic
  );
end D2_4E_HXILINX_ppmmvsh;

architecture D2_4E_HXILINX_ppmmvsh_V of D2_4E_HXILINX_ppmmvsh is
  signal d_tmp : std_logic_vector(3 downto 0);
begin
  process (A0, A1, E)
  variable sel   : std_logic_vector(1 downto 0);
  begin
    sel := A1&A0;
    if( E = '0') then
    d_tmp <= "0000";
    else
      case sel is
      when "00" => d_tmp <= "0001";
      when "01" => d_tmp <= "0010";
      when "10" => d_tmp <= "0100";
      when "11" => d_tmp <= "1000";
      when others => NULL;
      end case;
    end if;
  end process; 

    D3 <= d_tmp(3);
    D2 <= d_tmp(2);
    D1 <= d_tmp(1);
    D0 <= d_tmp(0);

end D2_4E_HXILINX_ppmmvsh_V;
----- CELL M2_1_HXILINX_ppmmvsh -----
  
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity M2_1_HXILINX_ppmmvsh is
  
port(
    O   : out std_logic;

    D0  : in std_logic;
    D1  : in std_logic;
    S0  : in std_logic
  );
end M2_1_HXILINX_ppmmvsh;

architecture M2_1_HXILINX_ppmmvsh_V of M2_1_HXILINX_ppmmvsh is
begin
  process (D0, D1, S0)
  begin
    case S0 is
    when '0' => O <= D0;
    when '1' => O <= D1;
    when others => NULL;
    end case;
    end process; 
end M2_1_HXILINX_ppmmvsh_V;
----- CELL CB2CE_HXILINX_ppmmvsh -----


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity CB2CE_HXILINX_ppmmvsh is
  
port (
    CEO  : out STD_LOGIC;
    Q0   : out STD_LOGIC;
    Q1   : out STD_LOGIC;
    TC   : out STD_LOGIC;
    C    : in STD_LOGIC;
    CE   : in STD_LOGIC;
    CLR  : in STD_LOGIC
    );
end CB2CE_HXILINX_ppmmvsh;

architecture Behavioral of CB2CE_HXILINX_ppmmvsh is

  signal COUNT : STD_LOGIC_VECTOR(1 downto 0) := (others => '0');
  constant TERMINAL_COUNT : STD_LOGIC_VECTOR(1 downto 0) := (others => '1');
  
begin

process(C, CLR)
begin
  if (CLR='1') then
    COUNT <= (others => '0');
  elsif (C'event and C = '1') then
    if (CE='1') then 
      COUNT <= COUNT+1;
    end if;
  end if;
end process;

TC   <= '1' when (COUNT = TERMINAL_COUNT) else '0';
CEO  <= '1' when ((COUNT = TERMINAL_COUNT) and CE='1') else '0';

Q1 <= COUNT(1);
Q0 <= COUNT(0);

end Behavioral;

----- CELL COMPMC8_HXILINX_ppmmvsh -----
  
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.std_logic_unsigned.all;

entity COMPMC8_HXILINX_ppmmvsh is
port(
    GT  : out std_logic;
    LT  : out std_logic;

    A   : in std_logic_vector(7 downto 0);
    B   : in std_logic_vector(7 downto 0)
  );
end COMPMC8_HXILINX_ppmmvsh;

architecture COMPMC8_HXILINX_ppmmvsh_V of COMPMC8_HXILINX_ppmmvsh is
begin
     
  GT <= '1' when ( A > B ) else '0';
  LT <= '1' when ( A < B ) else '0';

end COMPMC8_HXILINX_ppmmvsh_V;

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity X74_157_MUSER_ppmmvsh is
   port ( A0 : in    std_logic; 
          A1 : in    std_logic; 
          A2 : in    std_logic; 
          A3 : in    std_logic; 
          B0 : in    std_logic; 
          B1 : in    std_logic; 
          B2 : in    std_logic; 
          B3 : in    std_logic; 
          G  : in    std_logic; 
          S  : in    std_logic; 
          Y0 : out   std_logic; 
          Y1 : out   std_logic; 
          Y2 : out   std_logic; 
          Y3 : out   std_logic);
end X74_157_MUSER_ppmmvsh;

architecture BEHAVIORAL of X74_157_MUSER_ppmmvsh is
   attribute HU_SET     : string ;
   attribute BOX_TYPE   : string ;
   signal XLXN_196 : std_logic;
   component M2_1E_HXILINX_ppmmvsh
      port ( D0 : in    std_logic; 
             D1 : in    std_logic; 
             E  : in    std_logic; 
             S0 : in    std_logic; 
             O  : out   std_logic);
   end component;
   
   component INV
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";
   
   attribute HU_SET of XLXI_114 : label is "XLXI_114_0";
   attribute HU_SET of XLXI_115 : label is "XLXI_115_1";
   attribute HU_SET of XLXI_116 : label is "XLXI_116_2";
   attribute HU_SET of XLXI_117 : label is "XLXI_117_3";
begin
   XLXI_114 : M2_1E_HXILINX_ppmmvsh
      port map (D0=>A0,
                D1=>B0,
                E=>XLXN_196,
                S0=>S,
                O=>Y0);
   
   XLXI_115 : M2_1E_HXILINX_ppmmvsh
      port map (D0=>A1,
                D1=>B1,
                E=>XLXN_196,
                S0=>S,
                O=>Y1);
   
   XLXI_116 : M2_1E_HXILINX_ppmmvsh
      port map (D0=>A2,
                D1=>B2,
                E=>XLXN_196,
                S0=>S,
                O=>Y2);
   
   XLXI_117 : M2_1E_HXILINX_ppmmvsh
      port map (D0=>A3,
                D1=>B3,
                E=>XLXN_196,
                S0=>S,
                O=>Y3);
   
   XLXI_118 : INV
      port map (I=>G,
                O=>XLXN_196);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity X74_153_MUSER_ppmmvsh is
   port ( A    : in    std_logic; 
          B    : in    std_logic; 
          G1   : in    std_logic; 
          G2   : in    std_logic; 
          I1C0 : in    std_logic; 
          I1C1 : in    std_logic; 
          I1C2 : in    std_logic; 
          I1C3 : in    std_logic; 
          I2C0 : in    std_logic; 
          I2C1 : in    std_logic; 
          I2C2 : in    std_logic; 
          I2C3 : in    std_logic; 
          Y1   : out   std_logic; 
          Y2   : out   std_logic);
end X74_153_MUSER_ppmmvsh;

architecture BEHAVIORAL of X74_153_MUSER_ppmmvsh is
   attribute HU_SET     : string ;
   attribute BOX_TYPE   : string ;
   signal XLXN_1  : std_logic;
   signal XLXN_2  : std_logic;
   signal XLXN_13 : std_logic;
   signal XLXN_14 : std_logic;
   signal XLXN_15 : std_logic;
   signal XLXN_22 : std_logic;
   component M2_1_HXILINX_ppmmvsh
      port ( D0 : in    std_logic; 
             D1 : in    std_logic; 
             S0 : in    std_logic; 
             O  : out   std_logic);
   end component;
   
   component M2_1E_HXILINX_ppmmvsh
      port ( D0 : in    std_logic; 
             D1 : in    std_logic; 
             E  : in    std_logic; 
             S0 : in    std_logic; 
             O  : out   std_logic);
   end component;
   
   component INV
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";
   
   attribute HU_SET of XLXI_1 : label is "XLXI_1_4";
   attribute HU_SET of XLXI_2 : label is "XLXI_2_5";
   attribute HU_SET of XLXI_3 : label is "XLXI_3_6";
   attribute HU_SET of XLXI_4 : label is "XLXI_4_7";
   attribute HU_SET of XLXI_5 : label is "XLXI_5_8";
   attribute HU_SET of XLXI_6 : label is "XLXI_6_9";
begin
   XLXI_1 : M2_1_HXILINX_ppmmvsh
      port map (D0=>I1C0,
                D1=>I1C1,
                S0=>A,
                O=>XLXN_1);
   
   XLXI_2 : M2_1_HXILINX_ppmmvsh
      port map (D0=>I1C2,
                D1=>I1C3,
                S0=>A,
                O=>XLXN_2);
   
   XLXI_3 : M2_1_HXILINX_ppmmvsh
      port map (D0=>I2C0,
                D1=>I2C1,
                S0=>A,
                O=>XLXN_13);
   
   XLXI_4 : M2_1_HXILINX_ppmmvsh
      port map (D0=>I2C2,
                D1=>I2C3,
                S0=>A,
                O=>XLXN_14);
   
   XLXI_5 : M2_1E_HXILINX_ppmmvsh
      port map (D0=>XLXN_1,
                D1=>XLXN_2,
                E=>XLXN_22,
                S0=>B,
                O=>Y1);
   
   XLXI_6 : M2_1E_HXILINX_ppmmvsh
      port map (D0=>XLXN_13,
                D1=>XLXN_14,
                E=>XLXN_15,
                S0=>B,
                O=>Y2);
   
   XLXI_7 : INV
      port map (I=>G1,
                O=>XLXN_22);
   
   XLXI_8 : INV
      port map (I=>G2,
                O=>XLXN_15);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity ppmmvsh is
   port ( CLOCK_NP2B  : in    std_logic; 
          P1PLAY_NP2B : in    std_logic; 
          P2ADD_NP2B  : in    std_logic; 
          P2PLAY_NP2B : in    std_logic; 
          P2SEL0_NP2B : in    std_logic; 
          P2SEL1_NP2B : in    std_logic; 
          P2SEL2_NP2B : in    std_logic; 
          P2SEL3_NP2B : in    std_logic; 
          RESET_NP2B  : in    std_logic; 
          SHPTS_NP2B  : in    std_logic; 
          sw15        : in    std_logic; 
          AA          : out   std_logic; 
          AB          : out   std_logic; 
          AC          : out   std_logic; 
          AD          : out   std_logic; 
          ADD_NB2P    : out   std_logic; 
          AE          : out   std_logic; 
          AF          : out   std_logic; 
          AG          : out   std_logic; 
          A0_NB2P     : out   std_logic; 
          A1_NB2P     : out   std_logic; 
          A2_NB2P     : out   std_logic; 
          A3_NB2P     : out   std_logic; 
          A4_NB2P     : out   std_logic; 
          A5_NB2P     : out   std_logic; 
          A6_NB2P     : out   std_logic; 
          A7_NB2P     : out   std_logic; 
          CA_NB2P     : out   std_logic; 
          CB_NB2P     : out   std_logic; 
          CC_NB2P     : out   std_logic; 
          CD_NB2P     : out   std_logic; 
          CE_NB2P     : out   std_logic; 
          CF_NB2P     : out   std_logic; 
          CG_NB2P     : out   std_logic; 
          DIGSEL      : out   std_logic; 
          LED8        : out   std_logic; 
          LED9        : out   std_logic; 
          LED10       : out   std_logic; 
          LED11       : out   std_logic; 
          LED12       : out   std_logic; 
          LED13       : out   std_logic; 
          LED14       : out   std_logic; 
          LED15       : out   std_logic; 
          RD0_NB2P    : out   std_logic; 
          RD1_NB2P    : out   std_logic; 
          RD2_NB2P    : out   std_logic; 
          RD3_NB2P    : out   std_logic; 
          STR0_NB2P   : out   std_logic; 
          STR1_NB2P   : out   std_logic; 
          STR2_NB2P   : out   std_logic; 
          KEYINPOUT   : inout std_logic_vector (7 downto 0));
end ppmmvsh;

architecture BEHAVIORAL of ppmmvsh is
   attribute IOSTANDARD  : string ;
   attribute CAPACITANCE : string ;
   attribute SLEW        : string ;
   attribute DRIVE       : string ;
   attribute BOX_TYPE    : string ;
   attribute HU_SET      : string ;
   attribute INIT        : string ;
   signal ADD              : std_logic;
   signal APOSZERO         : std_logic;
   signal BPDF             : std_logic;
   signal BPDS             : std_logic;
   signal BRWD0            : std_logic;
   signal BRWD1            : std_logic;
   signal BRWD2            : std_logic;
   signal BRWD3            : std_logic;
   signal CALCPTS          : std_logic;
   signal CENLD            : std_logic;
   signal CLEAR            : std_logic;
   signal CLEARP1FFS       : std_logic;
   signal CLEARP2FFS       : std_logic;
   signal CLFF             : std_logic;
   signal CLKEN            : std_logic;
   signal CLOCK            : std_logic;
   signal CLPXNSDFF        : std_logic;
   signal CLRRDREGS        : std_logic;
   signal CLRSHFTREG       : std_logic;
   signal CLRTOPLAY        : std_logic;
   signal CODERWD          : std_logic_vector (0 to 7);
   signal CRNTADJ          : std_logic;
   signal DCDEN0           : std_logic;
   signal DCDEN1           : std_logic;
   signal DCDEN2           : std_logic;
   signal DCDEN3           : std_logic;
   signal DCDEN4           : std_logic;
   signal DCDEN5           : std_logic;
   signal DCDEN6           : std_logic;
   signal DCDEN7           : std_logic;
   signal DDISP0           : std_logic;
   signal DDISP1           : std_logic;
   signal DDISP2           : std_logic;
   signal DDISP3           : std_logic;
   signal DDISP4           : std_logic;
   signal DDISP5           : std_logic;
   signal DDISP6           : std_logic;
   signal DDISP7           : std_logic;
   signal DDISP8           : std_logic;
   signal DDISP9           : std_logic;
   signal DDISP10          : std_logic;
   signal DDISP11          : std_logic;
   signal DDISP12          : std_logic;
   signal DDISP13          : std_logic;
   signal DDISP14          : std_logic;
   signal DDISP15          : std_logic;
   signal DECISION0        : std_logic;
   signal DECISION1        : std_logic;
   signal DECISION2        : std_logic;
   signal DISPEN           : std_logic_vector (3 downto 0);
   signal DISPSEL0         : std_logic;
   signal DISPSEL1         : std_logic;
   signal DISP0            : std_logic;
   signal DISP0LESDISP1    : std_logic;
   signal DISP1            : std_logic;
   signal DISP2            : std_logic;
   signal DISP2LESDISP3    : std_logic;
   signal DISP3            : std_logic;
   signal DISP4            : std_logic;
   signal DISP4INP0        : std_logic;
   signal DISP4INP1        : std_logic;
   signal DISP4INP2        : std_logic;
   signal DISP4INP3        : std_logic;
   signal DISP5            : std_logic;
   signal DISP5INP0        : std_logic;
   signal DISP5INP1        : std_logic;
   signal DISP5INP2        : std_logic;
   signal DISP5INP3        : std_logic;
   signal DISP6            : std_logic;
   signal DISP6INP0        : std_logic;
   signal DISP6INP1        : std_logic;
   signal DISP6INP2        : std_logic;
   signal DISP6INP3        : std_logic;
   signal DISP7            : std_logic;
   signal DISP7INP0        : std_logic;
   signal DISP7INP1        : std_logic;
   signal DISP7INP2        : std_logic;
   signal DISP7INP3        : std_logic;
   signal DISP8            : std_logic;
   signal DISP9            : std_logic;
   signal DISP10           : std_logic;
   signal DISP11           : std_logic;
   signal DISP12           : std_logic;
   signal DISP13           : std_logic;
   signal DISP14           : std_logic;
   signal DISP15           : std_logic;
   signal EA0              : std_logic;
   signal EA1              : std_logic;
   signal EA2              : std_logic;
   signal EA3              : std_logic;
   signal ENCPSEL0         : std_logic;
   signal ENCPSEL1         : std_logic;
   signal EQ0              : std_logic;
   signal EQ1              : std_logic;
   signal EQ2              : std_logic;
   signal EQ3              : std_logic;
   signal GETCODE          : std_logic;
   signal GRD              : std_logic;
   signal INITIALSHIFT     : std_logic;
   signal INT_NET0         : std_logic;
   signal INT_NET1         : std_logic;
   signal INT_NET2         : std_logic;
   signal INT_NET6         : std_logic;
   signal INT_NET8         : std_logic;
   signal INT_NET10        : std_logic;
   signal INT_NET11        : std_logic;
   signal isgtsf           : std_logic;
   signal isnsdnotzero     : std_logic;
   signal KEYPAD           : std_logic_vector (3 downto 0);
   signal KSBUS            : std_logic_vector (3 downto 0);
   signal LARGESTNSD0      : std_logic;
   signal LARGESTNSD1      : std_logic;
   signal LARGESTPTADDSIG  : std_logic;
   signal LARGESTPTPOSEL0  : std_logic;
   signal LARGESTPTPOSEL1  : std_logic;
   signal LARGESTRWD       : std_logic_vector (7 downto 0);
   signal LGADJADD         : std_logic;
   signal LGADJSELECTPOS0  : std_logic;
   signal LGADJSELECTPOS1  : std_logic;
   signal LPDPRD           : std_logic;
   signal LPSEL0           : std_logic;
   signal LPSEL1           : std_logic;
   signal LPSEL2           : std_logic;
   signal LPSEL3           : std_logic;
   signal LPTOVF           : std_logic;
   signal LP1NSD           : std_logic;
   signal LP2NSD           : std_logic;
   signal LRGDISPPOS0      : std_logic;
   signal LRGDISPPOS1      : std_logic;
   signal MC0              : std_logic;
   signal MC1              : std_logic;
   signal MC2              : std_logic;
   signal NEXTPLAY         : std_logic;
   signal NPDISP0          : std_logic;
   signal NPDISP1          : std_logic;
   signal NPDISP2          : std_logic;
   signal NPDISP3          : std_logic;
   signal NPDISP4          : std_logic;
   signal NPDISP5          : std_logic;
   signal NPDISP6          : std_logic;
   signal NPDISP7          : std_logic;
   signal NPDISP8          : std_logic;
   signal NPDISP9          : std_logic;
   signal NPDISP10         : std_logic;
   signal NPDISP11         : std_logic;
   signal NPDISP12         : std_logic;
   signal NPDISP13         : std_logic;
   signal NPDISP14         : std_logic;
   signal NPDISP15         : std_logic;
   signal NPSELDISP0       : std_logic;
   signal NPSELDISP1       : std_logic;
   signal NPSELDISP2       : std_logic;
   signal NPSELDISP3       : std_logic;
   signal NPT              : std_logic_vector (7 downto 0);
   signal NSDGT            : std_logic;
   signal NSD0             : std_logic;
   signal NSD1             : std_logic;
   signal OUTCOME0         : std_logic;
   signal OUTCOME1         : std_logic;
   signal OUTCOME2         : std_logic;
   signal PDPRD            : std_logic;
   signal PD0PRD           : std_logic;
   signal PD1PRD           : std_logic;
   signal PD2PRD           : std_logic;
   signal PD3PRD           : std_logic;
   signal POS0ZERO         : std_logic;
   signal POS1ZERO         : std_logic;
   signal POS2ZERO         : std_logic;
   signal POS3ZERO         : std_logic;
   signal PSEL0            : std_logic;
   signal PSEL1            : std_logic;
   signal PSEL2            : std_logic;
   signal PSEL3            : std_logic;
   signal PT               : std_logic_vector (7 downto 0);
   signal PTOVF            : std_logic;
   signal P1ADD            : std_logic;
   signal P1PLAY           : std_logic;
   signal P1PLAYED         : std_logic;
   signal P1PLAYSYNCH      : std_logic;
   signal P1PT             : std_logic_vector (7 downto 0);
   signal P1SEL0           : std_logic;
   signal P1SEL0EA0        : std_logic;
   signal P1SEL0EA1        : std_logic;
   signal P1SEL0EA23       : std_logic;
   signal P1SEL1           : std_logic;
   signal P1SEL1EA0        : std_logic;
   signal P1SEL1EA1        : std_logic;
   signal P1SEL1EA23       : std_logic;
   signal P1SEL2           : std_logic;
   signal P1SEL2EA0        : std_logic;
   signal P1SEL2EA1        : std_logic;
   signal P1SEL2EA23       : std_logic;
   signal P1SEL3           : std_logic;
   signal P1SEL3EA0        : std_logic;
   signal P1SEL3EA1        : std_logic;
   signal P1SEL3EA23       : std_logic;
   signal P1SKIP           : std_logic;
   signal P1STURN          : std_logic;
   signal P2ADD            : std_logic;
   signal P2CLK            : std_logic;
   signal P2CODE0          : std_logic;
   signal P2CODE1          : std_logic;
   signal P2CODE2          : std_logic;
   signal P2CODE3          : std_logic;
   signal P2CODE4          : std_logic;
   signal P2CODE5          : std_logic;
   signal P2CODE6          : std_logic;
   signal P2CODE7          : std_logic;
   signal P2PLAY           : std_logic;
   signal P2PLAYED         : std_logic;
   signal P2PLAYSYNCH      : std_logic;
   signal P2PT             : std_logic_vector (7 downto 0);
   signal P2SEL            : std_logic_vector (3 downto 0);
   signal P2SKIP           : std_logic;
   signal P2STURN          : std_logic;
   signal Q                : std_logic_vector (15 downto 0);
   signal QA               : std_logic_vector (15 downto 0);
   signal RDCLK            : std_logic;
   signal RDC0             : std_logic;
   signal RDC1             : std_logic;
   signal RDC2             : std_logic;
   signal RDC3             : std_logic;
   signal RDISNOT0         : std_logic;
   signal RDP0EQ0          : std_logic;
   signal RDP0EQ1          : std_logic;
   signal RDP0EQ2          : std_logic;
   signal RDP1EQ0          : std_logic;
   signal RDP1EQ1          : std_logic;
   signal RDP1EQ2          : std_logic;
   signal RDP2EQ0          : std_logic;
   signal RDP2EQ1          : std_logic;
   signal RDP2EQ2          : std_logic;
   signal RDP3EQ0          : std_logic;
   signal RDP3EQ1          : std_logic;
   signal RDP3EQ2          : std_logic;
   signal RD0              : std_logic;
   signal RD1              : std_logic;
   signal RD2              : std_logic;
   signal RD3              : std_logic;
   signal RESET            : std_logic;
   signal RWD              : std_logic_vector (7 downto 0);
   signal RWDCOT           : std_logic;
   signal RWDGTRDLAR       : std_logic;
   signal RWDWINS          : std_logic;
   signal R0D0             : std_logic;
   signal R0D1             : std_logic;
   signal R0D2             : std_logic;
   signal R0D3             : std_logic;
   signal R1D0             : std_logic;
   signal R1D1             : std_logic;
   signal R1D2             : std_logic;
   signal R1D3             : std_logic;
   signal R2D0             : std_logic;
   signal R2D1             : std_logic;
   signal R2D2             : std_logic;
   signal R2D3             : std_logic;
   signal SBUS             : std_logic_vector (6 downto 0);
   signal SB0              : std_logic;
   signal SB1              : std_logic;
   signal SB2              : std_logic;
   signal SB3              : std_logic;
   signal SELPLYR          : std_logic;
   signal seven            : std_logic_vector (7 downto 0);
   signal sf               : std_logic_vector (7 downto 0);
   signal SHNXRDS          : std_logic;
   signal SHPTS            : std_logic;
   signal STDISP0          : std_logic;
   signal STDISP1          : std_logic;
   signal STDISP2          : std_logic;
   signal STDISP3          : std_logic;
   signal STP1PT           : std_logic;
   signal STP2PT           : std_logic;
   signal STR0             : std_logic;
   signal STR1             : std_logic;
   signal STR2             : std_logic;
   signal SYSCLK           : std_logic;
   signal S0               : std_logic;
   signal S0P1PLAYSYNCH    : std_logic;
   signal S1               : std_logic;
   signal S1P1PLAYED       : std_logic;
   signal S1P1SKIP         : std_logic;
   signal S1S4S6COND       : std_logic;
   signal S2               : std_logic;
   signal S2ORS5           : std_logic;
   signal S3               : std_logic;
   signal S3P1PLAYSYNCHADJ : std_logic;
   signal S3P2PLAYSYNCH    : std_logic;
   signal S3S6COND         : std_logic;
   signal S4               : std_logic;
   signal S4P2PLAYED       : std_logic;
   signal S4P2SKIP         : std_logic;
   signal S5               : std_logic;
   signal S6               : std_logic;
   signal S6P1PLAYSYNCH    : std_logic;
   signal S6P2PLAYSYNCHADJ : std_logic;
   signal TESTPOS0         : std_logic;
   signal TESTPOS1         : std_logic;
   signal TESTPOS2         : std_logic;
   signal TESTPOS3         : std_logic;
   signal Testrd           : std_logic;
   signal TOTRWD           : std_logic_vector (7 downto 0);
   signal TSCASE0          : std_logic;
   signal TSCASE1          : std_logic;
   signal TSCASE2          : std_logic;
   signal TSCASE3          : std_logic;
   signal TSCASE4          : std_logic;
   signal TSCASE5          : std_logic;
   signal TSCASE6          : std_logic;
   signal TSCASE7          : std_logic;
   signal UNENCNSD0        : std_logic;
   signal UNENCNSD1        : std_logic;
   signal UNENCNSD2        : std_logic;
   signal UPDATENSD        : std_logic;
   signal UPDATERWD        : std_logic;
   signal XLXN_1           : std_logic;
   signal XLXN_4           : std_logic;
   signal XLXN_7           : std_logic;
   signal XLXN_8           : std_logic;
   signal XLXN_74          : std_logic;
   signal XLXN_88          : std_logic;
   signal XLXN_102         : std_logic;
   signal XLXN_181         : std_logic;
   signal XLXN_193         : std_logic;
   signal XLXN_194         : std_logic;
   signal XLXN_195         : std_logic;
   signal XLXN_202         : std_logic;
   signal XLXN_203         : std_logic;
   signal XLXN_210         : std_logic;
   signal XLXN_211         : std_logic;
   signal XLXN_213         : std_logic;
   signal XLXN_1195        : std_logic;
   signal XLXN_1196        : std_logic;
   signal XLXN_1361        : std_logic;
   signal XLXN_1363        : std_logic;
   signal XLXN_1577        : std_logic;
   signal XLXN_1595        : std_logic;
   signal XLXN_1615        : std_logic;
   signal XLXN_1623        : std_logic;
   signal XLXN_1635        : std_logic;
   signal XLXN_1738        : std_logic;
   signal XLXN_1754        : std_logic;
   signal XLXN_1764        : std_logic;
   signal XLXN_1771        : std_logic;
   signal XLXN_1785        : std_logic;
   signal XLXN_1801        : std_logic;
   signal XLXN_1802        : std_logic;
   signal XLXN_1809        : std_logic;
   signal XLXN_1811        : std_logic;
   signal XLXN_1823        : std_logic;
   signal XLXN_2370        : std_logic;
   signal XLXN_2372        : std_logic;
   signal XLXN_10394       : std_logic;
   signal XLXN_10395       : std_logic;
   signal XLXN_10400       : std_logic;
   signal XLXN_10402       : std_logic;
   signal XLXN_10403       : std_logic;
   signal XLXN_10404       : std_logic;
   signal XLXN_10405       : std_logic;
   signal XLXN_10406       : std_logic;
   signal XLXN_10482       : std_logic;
   signal XLXN_10484       : std_logic;
   signal XLXN_10495       : std_logic;
   signal XLXN_10716       : std_logic;
   signal XLXN_10958       : std_logic;
   signal XLXN_10960       : std_logic;
   signal XLXN_10962       : std_logic;
   signal XLXN_10993       : std_logic;
   signal XLXN_11110       : std_logic;
   signal XLXN_11259       : std_logic;
   signal XLXN_11260       : std_logic;
   signal XLXN_11261       : std_logic;
   signal XLXN_11263       : std_logic;
   signal XLXN_11941       : std_logic;
   signal XLXN_11980       : std_logic;
   signal XLXN_11981       : std_logic;
   signal XLXN_11982       : std_logic;
   signal XLXN_12041       : std_logic;
   signal XLXN_12042       : std_logic;
   signal XLXN_12043       : std_logic;
   signal XLXN_12049       : std_logic;
   signal XLXN_12167       : std_logic;
   signal XLXN_12173       : std_logic;
   signal XLXN_12183       : std_logic;
   signal XLXN_12199       : std_logic;
   signal XLXN_12205       : std_logic;
   signal XLXN_12212       : std_logic;
   signal XLXN_12213       : std_logic;
   signal XLXN_12236       : std_logic;
   signal XLXN_12237       : std_logic;
   signal XLXN_12238       : std_logic;
   signal XLXN_12247       : std_logic;
   signal XLXN_12248       : std_logic;
   signal XLXN_12257       : std_logic;
   signal XLXN_12297       : std_logic;
   signal XLXN_12299       : std_logic;
   signal XLXN_12324       : std_logic;
   signal XLXN_12325       : std_logic;
   signal XLXN_12333       : std_logic;
   signal XLXN_12334       : std_logic;
   signal XLXN_12335       : std_logic;
   signal XLXN_12343       : std_logic;
   signal XLXN_12433       : std_logic;
   signal XLXN_12434       : std_logic;
   signal XLXN_12449       : std_logic;
   signal XLXN_12450       : std_logic;
   signal XLXN_12451       : std_logic;
   signal XLXN_12453       : std_logic;
   signal XLXN_12454       : std_logic;
   signal XLXN_12504       : std_logic;
   signal XLXN_12505       : std_logic;
   signal XLXN_12548       : std_logic;
   signal XLXN_12550       : std_logic;
   signal XLXN_12551       : std_logic;
   signal XLXN_12552       : std_logic;
   signal XLXN_12553       : std_logic;
   signal XLXN_12554       : std_logic;
   signal XLXN_12555       : std_logic;
   signal XLXN_12556       : std_logic;
   signal XLXN_12562       : std_logic;
   signal XLXN_12621       : std_logic;
   signal XLXN_12682       : std_logic;
   signal XLXN_12684       : std_logic;
   signal XLXN_12718       : std_logic;
   signal XLXN_12719       : std_logic;
   signal XLXN_12720       : std_logic;
   signal XLXN_12721       : std_logic;
   signal XLXN_12732       : std_logic;
   signal XLXN_12733       : std_logic;
   signal XLXN_12734       : std_logic;
   signal XLXN_12735       : std_logic;
   signal XLXN_12736       : std_logic;
   signal XLXN_12769       : std_logic;
   signal XLXN_13036       : std_logic;
   signal XLXN_13037       : std_logic;
   signal XLXN_13044       : std_logic;
   signal XLXN_13052       : std_logic;
   signal XLXN_13057       : std_logic;
   signal XLXN_13058       : std_logic;
   signal XLXN_13059       : std_logic;
   signal XLXN_13060       : std_logic;
   signal XLXN_13061       : std_logic;
   signal XLXN_13062       : std_logic;
   signal XLXN_13073       : std_logic;
   signal XLXN_13141       : std_logic;
   signal XLXN_13158       : std_logic;
   signal XLXN_13175       : std_logic;
   signal XLXN_13184       : std_logic;
   signal XLXN_13185       : std_logic;
   signal XLXN_13467       : std_logic;
   signal XLXN_13471       : std_logic;
   signal XLXN_13484       : std_logic;
   signal XLXN_14003       : std_logic;
   signal ZERODISP0        : std_logic;
   signal ZERODISP1        : std_logic;
   component OBUF
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute IOSTANDARD of OBUF : component is "DEFAULT";
   attribute CAPACITANCE of OBUF : component is "DONT_CARE";
   attribute SLEW of OBUF : component is "SLOW";
   attribute DRIVE of OBUF : component is "12";
   attribute BOX_TYPE of OBUF : component is "BLACK_BOX";
   
   component BUF
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of BUF : component is "BLACK_BOX";
   
   component IBUF
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute IOSTANDARD of IBUF : component is "DEFAULT";
   attribute CAPACITANCE of IBUF : component is "DONT_CARE";
   attribute BOX_TYPE of IBUF : component is "BLACK_BOX";
   
   component BUFG
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of BUFG : component is "BLACK_BOX";
   
   component CODEGEN
      port ( PSEL0     : in    std_logic; 
             PSEL1     : in    std_logic; 
             CALCPTS   : in    std_logic; 
             CLRRDREGS : in    std_logic; 
             GETCODE   : in    std_logic; 
             SYSCLK    : in    std_logic; 
             CODERWD   : out   std_logic_vector (0 to 7); 
             R2D1      : in    std_logic; 
             R2D2      : in    std_logic; 
             R1D1      : in    std_logic; 
             R1D0      : in    std_logic; 
             RDC1      : in    std_logic; 
             R1D3      : in    std_logic; 
             R2D0      : in    std_logic; 
             RDC3      : in    std_logic; 
             DISP0     : in    std_logic; 
             DISP1     : in    std_logic; 
             DISP2     : in    std_logic; 
             DISP3     : in    std_logic; 
             DISP4     : in    std_logic; 
             DISP5     : in    std_logic; 
             DISP6     : in    std_logic; 
             DISP7     : in    std_logic; 
             BRWD0     : in    std_logic; 
             BRWD1     : in    std_logic; 
             BRWD2     : in    std_logic; 
             BRWD3     : in    std_logic);
   end component;
   
   component SEVENSEGMENTDECODER
      port ( ANUM0  : in    std_logic; 
             BNUM0  : in    std_logic; 
             ANUM1  : in    std_logic; 
             BNUM1  : in    std_logic; 
             ANUM2  : in    std_logic; 
             BNUM2  : in    std_logic; 
             BNUM3  : in    std_logic; 
             ANUM3  : in    std_logic; 
             CLKINP : in    std_logic; 
             AC     : out   std_logic; 
             AE     : out   std_logic; 
             AF     : out   std_logic; 
             AG     : out   std_logic; 
             AA     : out   std_logic; 
             AB     : out   std_logic; 
             AD     : out   std_logic; 
             DIGSEL : out   std_logic);
   end component;
   
   component M2_1_HXILINX_ppmmvsh
      port ( D0 : in    std_logic; 
             D1 : in    std_logic; 
             S0 : in    std_logic; 
             O  : out   std_logic);
   end component;
   
   component OR2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR2 : component is "BLACK_BOX";
   
   component AND2B1
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2B1 : component is "BLACK_BOX";
   
   component AND2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2 : component is "BLACK_BOX";
   
   component AND3B1
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND3B1 : component is "BLACK_BOX";
   
   component CB2CE_HXILINX_ppmmvsh
      port ( C   : in    std_logic; 
             CE  : in    std_logic; 
             CLR : in    std_logic; 
             CEO : out   std_logic; 
             Q0  : out   std_logic; 
             Q1  : out   std_logic; 
             TC  : out   std_logic);
   end component;
   
   component FDC
      generic( INIT : bit :=  '0');
      port ( C   : in    std_logic; 
             CLR : in    std_logic; 
             D   : in    std_logic; 
             Q   : out   std_logic);
   end component;
   attribute BOX_TYPE of FDC : component is "BLACK_BOX";
   
   component OR3
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR3 : component is "BLACK_BOX";
   
   component AND3B2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND3B2 : component is "BLACK_BOX";
   
   component FDCE
      generic( INIT : bit :=  '0');
      port ( C   : in    std_logic; 
             CE  : in    std_logic; 
             CLR : in    std_logic; 
             D   : in    std_logic; 
             Q   : out   std_logic);
   end component;
   attribute BOX_TYPE of FDCE : component is "BLACK_BOX";
   
   component OR4
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR4 : component is "BLACK_BOX";
   
   component NOR2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of NOR2 : component is "BLACK_BOX";
   
   component AND3
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND3 : component is "BLACK_BOX";
   
   component CB4CLE_HXILINX_ppmmvsh
      port ( C   : in    std_logic; 
             CE  : in    std_logic; 
             CLR : in    std_logic; 
             D0  : in    std_logic; 
             D1  : in    std_logic; 
             D2  : in    std_logic; 
             D3  : in    std_logic; 
             L   : in    std_logic; 
             CEO : out   std_logic; 
             Q0  : out   std_logic; 
             Q1  : out   std_logic; 
             Q2  : out   std_logic; 
             Q3  : out   std_logic; 
             TC  : out   std_logic);
   end component;
   
   component D3_8E_HXILINX_ppmmvsh
      port ( A0 : in    std_logic; 
             A1 : in    std_logic; 
             A2 : in    std_logic; 
             E  : in    std_logic; 
             D0 : out   std_logic; 
             D1 : out   std_logic; 
             D2 : out   std_logic; 
             D3 : out   std_logic; 
             D4 : out   std_logic; 
             D5 : out   std_logic; 
             D6 : out   std_logic; 
             D7 : out   std_logic);
   end component;
   
   component CB16CE_HXILINX_ppmmvsh
      port ( C   : in    std_logic; 
             CE  : in    std_logic; 
             CLR : in    std_logic; 
             CEO : out   std_logic; 
             Q   : out   std_logic_vector (15 downto 0); 
             TC  : out   std_logic);
   end component;
   
   component FD4CE_HXILINX_ppmmvsh
      port ( C   : in    std_logic; 
             CE  : in    std_logic; 
             CLR : in    std_logic; 
             D0  : in    std_logic; 
             D1  : in    std_logic; 
             D2  : in    std_logic; 
             D3  : in    std_logic; 
             Q0  : out   std_logic; 
             Q1  : out   std_logic; 
             Q2  : out   std_logic; 
             Q3  : out   std_logic);
   end component;
   
   component X74_157_MUSER_ppmmvsh
      port ( A0 : in    std_logic; 
             A1 : in    std_logic; 
             A2 : in    std_logic; 
             A3 : in    std_logic; 
             B0 : in    std_logic; 
             B1 : in    std_logic; 
             B2 : in    std_logic; 
             B3 : in    std_logic; 
             G  : in    std_logic; 
             S  : in    std_logic; 
             Y0 : out   std_logic; 
             Y3 : out   std_logic; 
             Y1 : out   std_logic; 
             Y2 : out   std_logic);
   end component;
   
   component X74_153_MUSER_ppmmvsh
      port ( I1C0 : in    std_logic; 
             I1C1 : in    std_logic; 
             I1C2 : in    std_logic; 
             I1C3 : in    std_logic; 
             G1   : in    std_logic; 
             I2C0 : in    std_logic; 
             I2C1 : in    std_logic; 
             I2C2 : in    std_logic; 
             I2C3 : in    std_logic; 
             G2   : in    std_logic; 
             A    : in    std_logic; 
             B    : in    std_logic; 
             Y1   : out   std_logic; 
             Y2   : out   std_logic);
   end component;
   
   component CB4CE_HXILINX_ppmmvsh
      port ( C   : in    std_logic; 
             CE  : in    std_logic; 
             CLR : in    std_logic; 
             CEO : out   std_logic; 
             Q0  : out   std_logic; 
             Q1  : out   std_logic; 
             Q2  : out   std_logic; 
             Q3  : out   std_logic; 
             TC  : out   std_logic);
   end component;
   
   component OR2B1
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR2B1 : component is "BLACK_BOX";
   
   component NAND2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of NAND2 : component is "BLACK_BOX";
   
   component ROM16X1
      -- synopsys translate_off
      generic( INIT : bit_vector :=  x"0000");
      -- synopsys translate_on
      port ( A0 : in    std_logic; 
             A1 : in    std_logic; 
             A2 : in    std_logic; 
             A3 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute INIT of ROM16X1 : component is "0000";
   attribute BOX_TYPE of ROM16X1 : component is "BLACK_BOX";
   
   component INV
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";
   
   component M8_1E_HXILINX_ppmmvsh
      port ( D0 : in    std_logic; 
             D1 : in    std_logic; 
             D2 : in    std_logic; 
             D3 : in    std_logic; 
             D4 : in    std_logic; 
             D5 : in    std_logic; 
             D6 : in    std_logic; 
             D7 : in    std_logic; 
             E  : in    std_logic; 
             S0 : in    std_logic; 
             S1 : in    std_logic; 
             S2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   
   component FD8CE_HXILINX_ppmmvsh
      port ( C   : in    std_logic; 
             CE  : in    std_logic; 
             CLR : in    std_logic; 
             D   : in    std_logic_vector (7 downto 0); 
             Q   : out   std_logic_vector (7 downto 0));
   end component;
   
   component CD4CE_HXILINX_ppmmvsh
      port ( C   : in    std_logic; 
             CE  : in    std_logic; 
             CLR : in    std_logic; 
             CEO : out   std_logic; 
             Q0  : out   std_logic; 
             Q1  : out   std_logic; 
             Q2  : out   std_logic; 
             Q3  : out   std_logic; 
             TC  : out   std_logic);
   end component;
   
   component ADD4_HXILINX_ppmmvsh
      port ( A0  : in    std_logic; 
             A1  : in    std_logic; 
             A2  : in    std_logic; 
             A3  : in    std_logic; 
             B0  : in    std_logic; 
             B1  : in    std_logic; 
             B2  : in    std_logic; 
             B3  : in    std_logic; 
             CI  : in    std_logic; 
             CO  : out   std_logic; 
             OFL : out   std_logic; 
             S0  : out   std_logic; 
             S1  : out   std_logic; 
             S2  : out   std_logic; 
             S3  : out   std_logic);
   end component;
   
   component M4_1E_HXILINX_ppmmvsh
      port ( D0 : in    std_logic; 
             D1 : in    std_logic; 
             D2 : in    std_logic; 
             D3 : in    std_logic; 
             E  : in    std_logic; 
             S0 : in    std_logic; 
             S1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   
   component COMP4_HXILINX_ppmmvsh
      port ( A0 : in    std_logic; 
             A1 : in    std_logic; 
             A2 : in    std_logic; 
             A3 : in    std_logic; 
             B0 : in    std_logic; 
             B1 : in    std_logic; 
             B2 : in    std_logic; 
             B3 : in    std_logic; 
             EQ : out   std_logic);
   end component;
   
   component M2_1E_HXILINX_ppmmvsh
      port ( D0 : in    std_logic; 
             D1 : in    std_logic; 
             E  : in    std_logic; 
             S0 : in    std_logic; 
             O  : out   std_logic);
   end component;
   
   component ADD8_HXILINX_ppmmvsh
      port ( A   : in    std_logic_vector (7 downto 0); 
             B   : in    std_logic_vector (7 downto 0); 
             CI  : in    std_logic; 
             CO  : out   std_logic; 
             OFL : out   std_logic; 
             S   : out   std_logic_vector (7 downto 0));
   end component;
   
   component VCC
      port ( P : out   std_logic);
   end component;
   attribute BOX_TYPE of VCC : component is "BLACK_BOX";
   
   component GND
      port ( G : out   std_logic);
   end component;
   attribute BOX_TYPE of GND : component is "BLACK_BOX";
   
   component PmodKEYPAD
      port ( JA        : inout std_logic_vector (7 downto 0); 
             Keypadout : out   std_logic_vector (3 downto 0); 
             Clk       : in    std_logic);
   end component;
   
   component COMPM4_HXILINX_ppmmvsh
      port ( A0 : in    std_logic; 
             A1 : in    std_logic; 
             A2 : in    std_logic; 
             A3 : in    std_logic; 
             B0 : in    std_logic; 
             B1 : in    std_logic; 
             B2 : in    std_logic; 
             B3 : in    std_logic; 
             GT : out   std_logic; 
             LT : out   std_logic);
   end component;
   
   component NOR4
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of NOR4 : component is "BLACK_BOX";
   
   component D2_4E_HXILINX_ppmmvsh
      port ( A0 : in    std_logic; 
             A1 : in    std_logic; 
             E  : in    std_logic; 
             D0 : out   std_logic; 
             D1 : out   std_logic; 
             D2 : out   std_logic; 
             D3 : out   std_logic);
   end component;
   
   component COMPMC8_HXILINX_ppmmvsh
      port ( A  : in    std_logic_vector (7 downto 0); 
             B  : in    std_logic_vector (7 downto 0); 
             GT : out   std_logic; 
             LT : out   std_logic);
   end component;
   
   component CB4CLED_HXILINX_ppmmvsh
      port ( C   : in    std_logic; 
             CE  : in    std_logic; 
             CLR : in    std_logic; 
             D0  : in    std_logic; 
             D1  : in    std_logic; 
             D2  : in    std_logic; 
             D3  : in    std_logic; 
             L   : in    std_logic; 
             UP  : in    std_logic; 
             CEO : out   std_logic; 
             Q0  : out   std_logic; 
             Q1  : out   std_logic; 
             Q2  : out   std_logic; 
             Q3  : out   std_logic; 
             TC  : out   std_logic);
   end component;
   
   component COMPM2_HXILINX_ppmmvsh
      port ( A0 : in    std_logic; 
             A1 : in    std_logic; 
             B0 : in    std_logic; 
             B1 : in    std_logic; 
             GT : out   std_logic; 
             LT : out   std_logic);
   end component;
   
   component COMPM8_HXILINX_ppmmvsh
      port ( A  : in    std_logic_vector (7 downto 0); 
             B  : in    std_logic_vector (7 downto 0); 
             GT : out   std_logic; 
             LT : out   std_logic);
   end component;
   
   attribute HU_SET of M7 : label is "M7_46";
   attribute HU_SET of M8 : label is "M8_47";
   attribute HU_SET of M9 : label is "M9_48";
   attribute HU_SET of M10 : label is "M10_49";
   attribute HU_SET of U6 : label is "U6_39";
   attribute HU_SET of U64 : label is "U64_37";
   attribute HU_SET of U65 : label is "U65_38";
   attribute HU_SET of U66 : label is "U66_21";
   attribute HU_SET of U67 : label is "U67_22";
   attribute HU_SET of U69 : label is "U69_23";
   attribute HU_SET of U86 : label is "U86_40";
   attribute INIT of U104 : label is "2812";
   attribute INIT of U105 : label is "D860";
   attribute INIT of U106 : label is "D004";
   attribute INIT of U107 : label is "8692";
   attribute INIT of U108 : label is "02BA";
   attribute INIT of U109 : label is "208E";
   attribute INIT of U110 : label is "1083";
   attribute HU_SET of U112 : label is "U112_66";
   attribute HU_SET of U113 : label is "U113_17";
   attribute HU_SET of U114 : label is "U114_18";
   attribute HU_SET of U115 : label is "U115_19";
   attribute HU_SET of U116 : label is "U116_20";
   attribute HU_SET of U117 : label is "U117_14";
   attribute HU_SET of U118 : label is "U118_15";
   attribute HU_SET of U119 : label is "U119_13";
   attribute HU_SET of U120 : label is "U120_12";
   attribute HU_SET of U121 : label is "U121_11";
   attribute HU_SET of U122 : label is "U122_10";
   attribute HU_SET of U148 : label is "U148_27";
   attribute HU_SET of U149 : label is "U149_26";
   attribute HU_SET of U150 : label is "U150_24";
   attribute HU_SET of U151 : label is "U151_25";
   attribute HU_SET of U155 : label is "U155_16";
   attribute HU_SET of U159 : label is "U159_30";
   attribute HU_SET of U160 : label is "U160_31";
   attribute HU_SET of U161 : label is "U161_29";
   attribute HU_SET of U162 : label is "U162_28";
   attribute HU_SET of U169 : label is "U169_33";
   attribute HU_SET of U171 : label is "U171_34";
   attribute HU_SET of U176 : label is "U176_32";
   attribute HU_SET of U181 : label is "U181_36";
   attribute HU_SET of U182 : label is "U182_35";
   attribute HU_SET of U295 : label is "U295_41";
   attribute HU_SET of U296 : label is "U296_42";
   attribute HU_SET of U297 : label is "U297_44";
   attribute HU_SET of U298 : label is "U298_43";
   attribute HU_SET of U299 : label is "U299_45";
   attribute HU_SET of XLXI_2305 : label is "XLXI_2305_68";
   attribute HU_SET of XLXI_2365 : label is "XLXI_2365_50";
   attribute HU_SET of XLXI_2366 : label is "XLXI_2366_51";
   attribute HU_SET of XLXI_2371 : label is "XLXI_2371_52";
   attribute HU_SET of XLXI_2372 : label is "XLXI_2372_53";
   attribute HU_SET of XLXI_2387 : label is "XLXI_2387_70";
   attribute HU_SET of XLXI_2393 : label is "XLXI_2393_69";
   attribute HU_SET of XLXI_2434 : label is "XLXI_2434_64";
   attribute HU_SET of XLXI_2435 : label is "XLXI_2435_65";
   attribute HU_SET of XLXI_2436 : label is "XLXI_2436_63";
   attribute HU_SET of XLXI_2454 : label is "XLXI_2454_57";
   attribute HU_SET of XLXI_2461 : label is "XLXI_2461_67";
   attribute HU_SET of XLXI_2482 : label is "XLXI_2482_54";
   attribute HU_SET of XLXI_2490 : label is "XLXI_2490_59";
   attribute HU_SET of XLXI_2516 : label is "XLXI_2516_60";
   attribute HU_SET of XLXI_2526 : label is "XLXI_2526_56";
   attribute HU_SET of XLXI_2582 : label is "XLXI_2582_55";
   attribute HU_SET of XLXI_2638 : label is "XLXI_2638_58";
   attribute HU_SET of XLXI_2644 : label is "XLXI_2644_61";
   attribute HU_SET of XLXI_2646 : label is "XLXI_2646_62";
begin
   ADD_BUF : OBUF
      port map (I=>ADD,
                O=>ADD_NB2P);
   
   CALCPTS_BUF : BUF
      port map (I=>S2ORS5,
                O=>CALCPTS);
   
   CA_BUF : OBUF
      port map (I=>SBUS(6),
                O=>CA_NB2P);
   
   CB_BUF : OBUF
      port map (I=>SBUS(5),
                O=>CB_NB2P);
   
   CC_BUF : OBUF
      port map (I=>SBUS(4),
                O=>CC_NB2P);
   
   CD_BUF : OBUF
      port map (I=>SBUS(3),
                O=>CD_NB2P);
   
   CE_BUF : OBUF
      port map (I=>SBUS(2),
                O=>CE_NB2P);
   
   CF_BUF : OBUF
      port map (I=>SBUS(1),
                O=>CF_NB2P);
   
   CG_BUF : OBUF
      port map (I=>SBUS(0),
                O=>CG_NB2P);
   
   CLEAR_BUF : BUF
      port map (I=>RESET,
                O=>CLEAR);
   
   CLOCK_BUF : IBUF
      port map (I=>CLOCK_NP2B,
                O=>XLXN_2370);
   
   CLOCK_BUFG : BUFG
      port map (I=>XLXN_2370,
                O=>CLOCK);
   
   DISPEN0_BUF : OBUF
      port map (I=>DISPEN(0),
                O=>A0_NB2P);
   
   DISPEN1_BUF : OBUF
      port map (I=>DISPEN(1),
                O=>A1_NB2P);
   
   DISPEN2_BUF : OBUF
      port map (I=>DISPEN(2),
                O=>A2_NB2P);
   
   DISPEN3_BUF : OBUF
      port map (I=>DISPEN(3),
                O=>A3_NB2P);
   
   M1 : CODEGEN
      port map (BRWD0=>BRWD0,
                BRWD1=>BRWD1,
                BRWD2=>BRWD2,
                BRWD3=>BRWD3,
                CALCPTS=>CALCPTS,
                CLRRDREGS=>CLRRDREGS,
                DISP0=>DISP0,
                DISP1=>DISP1,
                DISP2=>DISP2,
                DISP3=>DISP3,
                DISP4=>DISP4,
                DISP5=>DISP5,
                DISP6=>DISP6,
                DISP7=>DISP7,
                GETCODE=>GETCODE,
                PSEL0=>PSEL0,
                PSEL1=>PSEL1,
                RDC1=>RDC1,
                RDC3=>RDC3,
                R1D0=>R1D0,
                R1D1=>R1D1,
                R1D3=>R1D3,
                R2D0=>R2D0,
                R2D1=>R2D1,
                R2D2=>R2D2,
                SYSCLK=>SYSCLK,
                CODERWD(0 to 7)=>CODERWD(0 to 7));
   
   M5 : SEVENSEGMENTDECODER
      port map (ANUM0=>KEYPAD(0),
                ANUM1=>KEYPAD(1),
                ANUM2=>KEYPAD(2),
                ANUM3=>KEYPAD(3),
                BNUM0=>R2D0,
                BNUM1=>R2D1,
                BNUM2=>R2D2,
                BNUM3=>R2D3,
                CLKINP=>Q(0),
                AA=>AA,
                AB=>AB,
                AC=>AC,
                AD=>AD,
                AE=>AE,
                AF=>AF,
                AG=>AG,
                DIGSEL=>DIGSEL);
   
   M7 : M2_1_HXILINX_ppmmvsh
      port map (D0=>R0D0,
                D1=>KEYPAD(0),
                S0=>Testrd,
                O=>RD0);
   
   M8 : M2_1_HXILINX_ppmmvsh
      port map (D0=>R0D1,
                D1=>KEYPAD(1),
                S0=>Testrd,
                O=>RD1);
   
   M9 : M2_1_HXILINX_ppmmvsh
      port map (D0=>R0D2,
                D1=>KEYPAD(2),
                S0=>Testrd,
                O=>RD2);
   
   M10 : M2_1_HXILINX_ppmmvsh
      port map (D0=>R0D3,
                D1=>KEYPAD(3),
                S0=>Testrd,
                O=>RD3);
   
   P1PLAY_BUF : IBUF
      port map (I=>P1PLAY_NP2B,
                O=>P1PLAY);
   
   P1STURN_BUF : BUF
      port map (I=>S1,
                O=>P1STURN);
   
   P2CLK_BUFG : BUFG
      port map (I=>Q(4),
                O=>P2CLK);
   
   P2PLAY_BUF : IBUF
      port map (I=>P2PLAY_NP2B,
                O=>P2PLAY);
   
   P2STURN_BUF : BUF
      port map (I=>S4,
                O=>P2STURN);
   
   RDCLK_BUFG : BUFG
      port map (I=>Q(2),
                O=>RDCLK);
   
   RDP0EQ2_BUF : BUF
      port map (I=>EQ1,
                O=>RDP0EQ2);
   
   RDP1EQ1_BUF : BUF
      port map (I=>EQ2,
                O=>RDP1EQ1);
   
   RDP1EQ2_B : BUF
      port map (I=>EQ0,
                O=>RDP1EQ2);
   
   RDP2EQ1_B : BUF
      port map (I=>EQ1,
                O=>RDP2EQ1);
   
   RDP2EQ2_BUF : BUF
      port map (I=>EQ3,
                O=>RDP2EQ2);
   
   RDP3EQ2_BUF : BUF
      port map (I=>EQ2,
                O=>RDP3EQ2);
   
   RD0_BUF : OBUF
      port map (I=>RD0,
                O=>RD0_NB2P);
   
   RD1_BUF : OBUF
      port map (I=>RD1,
                O=>RD1_NB2P);
   
   RD2_BUF : OBUF
      port map (I=>RD2,
                O=>RD2_NB2P);
   
   RD3_BUF : OBUF
      port map (I=>RD3,
                O=>RD3_NB2P);
   
   RESET_BUF : IBUF
      port map (I=>RESET_NP2B,
                O=>RESET);
   
   SELPLYR_BUF : BUF
      port map (I=>STR2,
                O=>SELPLYR);
   
   SHPTS_BUF : IBUF
      port map (I=>SHPTS_NP2B,
                O=>SHPTS);
   
   STR0_BUF : OBUF
      port map (I=>STR0,
                O=>STR0_NB2P);
   
   STR1_BUF : OBUF
      port map (I=>STR1,
                O=>STR1_NB2P);
   
   STR2_BUF : OBUF
      port map (I=>STR2,
                O=>STR2_NB2P);
   
   SYSCLK_BUFG : BUFG
      port map (I=>Q(7),
                O=>SYSCLK);
   
   U1 : OR2
      port map (I0=>S1,
                I1=>S6P2PLAYSYNCHADJ,
                O=>CLEARP2FFS);
   
   U2 : AND2B1
      port map (I0=>LPTOVF,
                I1=>XLXN_12199,
                O=>CLFF);
   
   U3 : OR2
      port map (I0=>S0,
                I1=>NEXTPLAY,
                O=>XLXN_12199);
   
   U4 : AND2
      port map (I0=>INITIALSHIFT,
                I1=>S0,
                O=>GETCODE);
   
   U5 : AND3B1
      port map (I0=>INITIALSHIFT,
                I1=>P1PLAYSYNCH,
                I2=>S0,
                O=>CLRSHFTREG);
   
   U6 : CB2CE_HXILINX_ppmmvsh
      port map (C=>SYSCLK,
                CE=>CLRSHFTREG,
                CLR=>CLRRDREGS,
                CEO=>open,
                Q0=>open,
                Q1=>open,
                TC=>INITIALSHIFT);
   
   U7 : OR2
      port map (I0=>XLXN_12205,
                I1=>SHNXRDS,
                O=>DISPSEL1);
   
   U8 : OR2
      port map (I0=>SHPTS,
                I1=>XLXN_12205,
                O=>DISPSEL0);
   
   U9 : AND2
      port map (I0=>SHPTS,
                I1=>P1PLAY,
                O=>XLXN_12205);
   
   U10 : OR2
      port map (I0=>XLXN_12213,
                I1=>XLXN_12212,
                O=>SHNXRDS);
   
   U11 : AND2
      port map (I0=>S1,
                I1=>P1PLAY,
                O=>XLXN_12212);
   
   U12 : AND3B1
      port map (I0=>LP1NSD,
                I1=>P1PLAY,
                I2=>S3,
                O=>XLXN_12213);
   
   U13 : AND2
      port map (I0=>PSEL3,
                I1=>CALCPTS,
                O=>STDISP3);
   
   U14 : AND2
      port map (I0=>PSEL2,
                I1=>CALCPTS,
                O=>STDISP2);
   
   U15 : AND2
      port map (I0=>PSEL1,
                I1=>CALCPTS,
                O=>STDISP1);
   
   U16 : AND2
      port map (I0=>PSEL0,
                I1=>CALCPTS,
                O=>STDISP0);
   
   U17 : AND2B1
      port map (I0=>LPTOVF,
                I1=>S2,
                O=>STP1PT);
   
   U18 : AND2B1
      port map (I0=>LPTOVF,
                I1=>S5,
                O=>STP2PT);
   
   U19 : FDC
      port map (C=>P2CLK,
                CLR=>S1,
                D=>CLEAR,
                Q=>XLXN_12333);
   
   U20 : FDC
      port map (C=>P2CLK,
                CLR=>S1,
                D=>XLXN_12333,
                Q=>XLXN_12334);
   
   U21 : FDC
      port map (C=>P2CLK,
                CLR=>S1,
                D=>XLXN_12334,
                Q=>XLXN_12335);
   
   U22 : AND3B1
      port map (I0=>XLXN_12335,
                I1=>XLXN_12334,
                I2=>XLXN_12333,
                O=>CLRRDREGS);
   
   U23 : AND2B1
      port map (I0=>LPTOVF,
                I1=>XLXN_12343,
                O=>ADD);
   
   U24 : OR3
      port map (I0=>XLXN_12247,
                I1=>XLXN_12325,
                I2=>XLXN_12324,
                O=>XLXN_12343);
   
   U25 : AND2
      port map (I0=>P1ADD,
                I1=>S1,
                O=>XLXN_12324);
   
   U26 : AND2
      port map (I0=>P2ADD,
                I1=>S4,
                O=>XLXN_12325);
   
   U27 : AND3B2
      port map (I0=>S4,
                I1=>S1,
                I2=>XLXN_12248,
                O=>XLXN_12247);
   
   U28 : FDCE
      port map (C=>SYSCLK,
                CE=>INT_NET10,
                CLR=>CLRTOPLAY,
                D=>XLXN_12238,
                Q=>XLXN_12248);
   
   U29 : AND2
      port map (I0=>S1P1PLAYED,
                I1=>P1ADD,
                O=>XLXN_12237);
   
   U30 : AND2
      port map (I0=>S4P2PLAYED,
                I1=>P2ADD,
                O=>XLXN_12236);
   
   U31 : OR2
      port map (I0=>XLXN_12236,
                I1=>XLXN_12237,
                O=>INT_NET10);
   
   U32 : AND2B1
      port map (I0=>LPTOVF,
                I1=>INT_NET6,
                O=>GRD);
   
   U33 : OR2
      port map (I0=>CLRSHFTREG,
                I1=>INT_NET8,
                O=>INT_NET6);
   
   U34 : AND2B1
      port map (I0=>S0,
                I1=>NEXTPLAY,
                O=>INT_NET8);
   
   U35 : AND2B1
      port map (I0=>INT_NET2,
                I1=>INT_NET1,
                O=>BPDS);
   
   U36 : AND2
      port map (I0=>INT_NET1,
                I1=>INT_NET2,
                O=>BPDF);
   
   U37 : AND2
      port map (I0=>ADD,
                I1=>LPDPRD,
                O=>INT_NET2);
   
   U38 : AND3B2
      port map (I0=>LPTOVF,
                I1=>SHPTS,
                I2=>XLXN_12257,
                O=>INT_NET1);
   
   U39 : OR2
      port map (I0=>S3,
                I1=>S6,
                O=>XLXN_12257);
   
   U40 : OR4
      port map (I0=>S3S6COND,
                I1=>S1P1SKIP,
                I2=>S6P2PLAYSYNCHADJ,
                I3=>S3P2PLAYSYNCH,
                O=>NEXTPLAY);
   
   U41 : OR3
      port map (I0=>NEXTPLAY,
                I1=>S0,
                I2=>S4P2SKIP,
                O=>CLRTOPLAY);
   
   U42 : NOR2
      port map (I0=>LP2NSD,
                I1=>LP1NSD,
                O=>INT_NET11);
   
   U43 : FDC
      port map (C=>SYSCLK,
                CLR=>INT_NET11,
                D=>CLRTOPLAY,
                Q=>CLPXNSDFF);
   
   U44 : AND3
      port map (I0=>INITIALSHIFT,
                I1=>P1PLAYSYNCH,
                I2=>S0,
                O=>S0P1PLAYSYNCH);
   
   U45 : AND2
      port map (I0=>P1PLAYED,
                I1=>S1,
                O=>S1P1PLAYED);
   
   U46 : AND2
      port map (I0=>P1SKIP,
                I1=>S1,
                O=>S1P1SKIP);
   
   U47 : AND3B1
      port map (I0=>LP1NSD,
                I1=>P2PLAYSYNCH,
                I2=>S3,
                O=>S3P2PLAYSYNCH);
   
   U48 : AND3
      port map (I0=>LP1NSD,
                I1=>P1PLAYSYNCH,
                I2=>S3,
                O=>S3P1PLAYSYNCHADJ);
   
   U49 : OR2
      port map (I0=>NSD1,
                I1=>NSD0,
                O=>CRNTADJ);
   
   U50 : FDCE
      port map (C=>SYSCLK,
                CE=>S2,
                CLR=>CLPXNSDFF,
                D=>CRNTADJ,
                Q=>LP1NSD);
   
   U51 : AND2
      port map (I0=>P2PLAYED,
                I1=>S4,
                O=>S4P2PLAYED);
   
   U52 : AND2
      port map (I0=>P2SKIP,
                I1=>S4,
                O=>S4P2SKIP);
   
   U53 : AND3B1
      port map (I0=>LP2NSD,
                I1=>P1PLAYSYNCH,
                I2=>S6,
                O=>S6P1PLAYSYNCH);
   
   U54 : AND3
      port map (I0=>LP2NSD,
                I1=>P2PLAYSYNCH,
                I2=>S6,
                O=>S6P2PLAYSYNCHADJ);
   
   U55 : FDCE
      port map (C=>SYSCLK,
                CE=>S5,
                CLR=>CLPXNSDFF,
                D=>CRNTADJ,
                Q=>LP2NSD);
   
   U56 : OR4
      port map (I0=>S4P2PLAYED,
                I1=>S3P2PLAYSYNCH,
                I2=>S1P1PLAYED,
                I3=>S0P1PLAYSYNCH,
                O=>XLXN_12299);
   
   U57 : OR2
      port map (I0=>S5,
                I1=>S2,
                O=>S2ORS5);
   
   U58 : OR3
      port map (I0=>CENLD,
                I1=>S2ORS5,
                I2=>XLXN_12299,
                O=>XLXN_12297);
   
   U59 : AND2B1
      port map (I0=>LPTOVF,
                I1=>XLXN_12297,
                O=>CLKEN);
   
   U60 : OR2
      port map (I0=>S3P1PLAYSYNCHADJ,
                I1=>S6P1PLAYSYNCH,
                O=>S3S6COND);
   
   U61 : OR3
      port map (I0=>S6P2PLAYSYNCHADJ,
                I1=>S4P2SKIP,
                I2=>S1P1SKIP,
                O=>S1S4S6COND);
   
   U62 : OR2
      port map (I0=>S1S4S6COND,
                I1=>S3S6COND,
                O=>CENLD);
   
   U63 : AND2B1
      port map (I0=>LPTOVF,
                I1=>CENLD,
                O=>XLXN_12173);
   
   U64 : CB4CLE_HXILINX_ppmmvsh
      port map (C=>SYSCLK,
                CE=>CLKEN,
                CLR=>RESET,
                D0=>S3S6COND,
                D1=>S4P2SKIP,
                D2=>S1S4S6COND,
                D3=>XLXN_12167,
                L=>XLXN_12173,
                CEO=>open,
                Q0=>STR0,
                Q1=>STR1,
                Q2=>STR2,
                Q3=>open,
                TC=>open);
   
   U65 : D3_8E_HXILINX_ppmmvsh
      port map (A0=>STR0,
                A1=>STR1,
                A2=>STR2,
                E=>XLXN_12183,
                D0=>S0,
                D1=>S1,
                D2=>S2,
                D3=>S3,
                D4=>S4,
                D5=>S5,
                D6=>S6,
                D7=>open);
   
   U66 : CB16CE_HXILINX_ppmmvsh
      port map (C=>CLOCK,
                CE=>XLXN_1,
                CLR=>XLXN_4,
                CEO=>open,
                Q(15 downto 0)=>QA(15 downto 0),
                TC=>open);
   
   U67 : CB16CE_HXILINX_ppmmvsh
      port map (C=>QA(15),
                CE=>XLXN_8,
                CLR=>XLXN_7,
                CEO=>open,
                Q(15 downto 0)=>Q(15 downto 0),
                TC=>open);
   
   U68 : FDCE
      port map (C=>SYSCLK,
                CE=>CALCPTS,
                CLR=>CLFF,
                D=>PDPRD,
                Q=>LPDPRD);
   
   U69 : FD4CE_HXILINX_ppmmvsh
      port map (C=>SYSCLK,
                CE=>CALCPTS,
                CLR=>CLFF,
                D0=>PSEL0,
                D1=>PSEL1,
                D2=>PSEL2,
                D3=>PSEL3,
                Q0=>LPSEL0,
                Q1=>LPSEL1,
                Q2=>LPSEL2,
                Q3=>LPSEL3);
   
   U70 : OR2
      port map (I0=>STP2PT,
                I1=>STP1PT,
                O=>XLXN_74);
   
   U71 : FDCE
      port map (C=>SYSCLK,
                CE=>XLXN_74,
                CLR=>CLEAR,
                D=>PTOVF,
                Q=>LPTOVF);
   
   U72 : FDC
      port map (C=>RDCLK,
                CLR=>XLXN_10716,
                D=>P2PLAY,
                Q=>XLXN_10484);
   
   U73 : FDC
      port map (C=>P2CLK,
                CLR=>XLXN_10716,
                D=>XLXN_10484,
                Q=>XLXN_10482);
   
   U74 : FDC
      port map (C=>SYSCLK,
                CLR=>XLXN_10716,
                D=>XLXN_10482,
                Q=>XLXN_10495);
   
   U75 : AND3B1
      port map (I0=>XLXN_10495,
                I1=>XLXN_10482,
                I2=>XLXN_10484,
                O=>P2PLAYSYNCH);
   
   U76 : FDC
      port map (C=>RDCLK,
                CLR=>XLXN_10993,
                D=>P1PLAY,
                Q=>XLXN_10962);
   
   U77 : FDC
      port map (C=>P2CLK,
                CLR=>XLXN_10993,
                D=>XLXN_10962,
                Q=>XLXN_10958);
   
   U78 : FDC
      port map (C=>SYSCLK,
                CLR=>XLXN_10993,
                D=>XLXN_10958,
                Q=>XLXN_10960);
   
   U79 : AND3B1
      port map (I0=>XLXN_10960,
                I1=>XLXN_10958,
                I2=>XLXN_10962,
                O=>P1PLAYSYNCH);
   
   U80 : X74_157_MUSER_ppmmvsh
      port map (A0=>DISP12,
                A1=>DISP13,
                A2=>DISP14,
                A3=>DISP15,
                B0=>P2PT(4),
                B1=>P2PT(5),
                B2=>P2PT(6),
                B3=>P2PT(7),
                G=>XLXN_88,
                S=>DISPSEL0,
                Y0=>DDISP12,
                Y1=>DDISP13,
                Y2=>DDISP14,
                Y3=>DDISP15);
   
   U81 : X74_157_MUSER_ppmmvsh
      port map (A0=>DISP8,
                A1=>DISP9,
                A2=>DISP10,
                A3=>DISP11,
                B0=>P2PT(0),
                B1=>P2PT(1),
                B2=>P2PT(2),
                B3=>P2PT(3),
                G=>XLXN_102,
                S=>DISPSEL0,
                Y0=>DDISP8,
                Y1=>DDISP9,
                Y2=>DDISP10,
                Y3=>DDISP11);
   
   U82 : X74_153_MUSER_ppmmvsh
      port map (A=>DISPSEL0,
                B=>DISPSEL1,
                G1=>XLXN_10402,
                G2=>XLXN_10400,
                I1C0=>DISP6,
                I1C1=>P1PT(6),
                I1C2=>R2D2,
                I1C3=>P2CODE6,
                I2C0=>DISP7,
                I2C1=>P1PT(7),
                I2C2=>R2D3,
                I2C3=>P2CODE7,
                Y1=>DDISP6,
                Y2=>DDISP7);
   
   U83 : X74_153_MUSER_ppmmvsh
      port map (A=>DISPSEL0,
                B=>DISPSEL1,
                G1=>XLXN_10404,
                G2=>XLXN_10403,
                I1C0=>DISP4,
                I1C1=>P1PT(4),
                I1C2=>R2D0,
                I1C3=>P2CODE4,
                I2C0=>DISP5,
                I2C1=>P1PT(5),
                I2C2=>R2D1,
                I2C3=>P2CODE5,
                Y1=>DDISP4,
                Y2=>DDISP5);
   
   U84 : X74_153_MUSER_ppmmvsh
      port map (A=>DISPSEL0,
                B=>DISPSEL1,
                G1=>XLXN_10395,
                G2=>XLXN_10394,
                I1C0=>DISP2,
                I1C1=>P1PT(2),
                I1C2=>R1D2,
                I1C3=>P2CODE2,
                I2C0=>DISP3,
                I2C1=>P1PT(3),
                I2C2=>R1D3,
                I2C3=>P2CODE3,
                Y1=>DDISP2,
                Y2=>DDISP3);
   
   U85 : X74_153_MUSER_ppmmvsh
      port map (A=>DISPSEL0,
                B=>DISPSEL1,
                G1=>XLXN_10406,
                G2=>XLXN_10405,
                I1C0=>DISP0,
                I1C1=>P1PT(0),
                I1C2=>R1D0,
                I1C3=>P2CODE0,
                I2C0=>DISP1,
                I2C1=>P1PT(1),
                I2C2=>R1D1,
                I2C3=>P2CODE1,
                Y1=>DDISP0,
                Y2=>DDISP1);
   
   U86 : CB4CE_HXILINX_ppmmvsh
      port map (C=>Q(0),
                CE=>XLXN_211,
                CLR=>XLXN_213,
                CEO=>open,
                Q0=>MC0,
                Q1=>MC1,
                Q2=>MC2,
                Q3=>open,
                TC=>open);
   
   U87 : OR2B1
      port map (I0=>BPDF,
                I1=>Q(6),
                O=>XLXN_202);
   
   U88 : OR2B1
      port map (I0=>BPDS,
                I1=>Q(8),
                O=>XLXN_203);
   
   U89 : AND2
      port map (I0=>XLXN_203,
                I1=>XLXN_202,
                O=>INT_NET0);
   
   U92 : OR2B1
      port map (I0=>LPSEL0,
                I1=>INT_NET0,
                O=>XLXN_181);
   
   U93 : NAND2
      port map (I0=>DCDEN0,
                I1=>XLXN_181,
                O=>DISPEN(0));
   
   U94 : OR2B1
      port map (I0=>LPSEL1,
                I1=>INT_NET0,
                O=>XLXN_195);
   
   U95 : NAND2
      port map (I0=>DCDEN1,
                I1=>XLXN_195,
                O=>DISPEN(1));
   
   U96 : OR2B1
      port map (I0=>LPSEL2,
                I1=>INT_NET0,
                O=>XLXN_194);
   
   U97 : NAND2
      port map (I0=>DCDEN2,
                I1=>XLXN_194,
                O=>DISPEN(2));
   
   U98 : OR2B1
      port map (I0=>LPSEL3,
                I1=>INT_NET0,
                O=>XLXN_193);
   
   U99 : NAND2
      port map (I0=>DCDEN3,
                I1=>XLXN_193,
                O=>DISPEN(3));
   
   U104 : ROM16X1
   -- synopsys translate_off
   generic map( INIT => x"2812")
   -- synopsys translate_on
      port map (A0=>KSBUS(0),
                A1=>KSBUS(1),
                A2=>KSBUS(2),
                A3=>KSBUS(3),
                O=>SBUS(6));
   
   U105 : ROM16X1
   -- synopsys translate_off
   generic map( INIT => x"D860")
   -- synopsys translate_on
      port map (A0=>KSBUS(0),
                A1=>KSBUS(1),
                A2=>KSBUS(2),
                A3=>KSBUS(3),
                O=>SBUS(5));
   
   U106 : ROM16X1
   -- synopsys translate_off
   generic map( INIT => x"D004")
   -- synopsys translate_on
      port map (A0=>KSBUS(0),
                A1=>KSBUS(1),
                A2=>KSBUS(2),
                A3=>KSBUS(3),
                O=>SBUS(4));
   
   U107 : ROM16X1
   -- synopsys translate_off
   generic map( INIT => x"8692")
   -- synopsys translate_on
      port map (A0=>KSBUS(0),
                A1=>KSBUS(1),
                A2=>KSBUS(2),
                A3=>KSBUS(3),
                O=>SBUS(3));
   
   U108 : ROM16X1
   -- synopsys translate_off
   generic map( INIT => x"02BA")
   -- synopsys translate_on
      port map (A0=>KSBUS(0),
                A1=>KSBUS(1),
                A2=>KSBUS(2),
                A3=>KSBUS(3),
                O=>SBUS(2));
   
   U109 : ROM16X1
   -- synopsys translate_off
   generic map( INIT => x"208E")
   -- synopsys translate_on
      port map (A0=>KSBUS(0),
                A1=>KSBUS(1),
                A2=>KSBUS(2),
                A3=>KSBUS(3),
                O=>SBUS(1));
   
   U110 : ROM16X1
   -- synopsys translate_off
   generic map( INIT => x"1083")
   -- synopsys translate_on
      port map (A0=>KSBUS(0),
                A1=>KSBUS(1),
                A2=>KSBUS(2),
                A3=>KSBUS(3),
                O=>SBUS(0));
   
   U111 : INV
      port map (I=>P2SEL(0),
                O=>XLXN_1195);
   
   U112 : M8_1E_HXILINX_ppmmvsh
      port map (D0=>P2SEL(0),
                D1=>XLXN_1195,
                D2=>XLXN_1195,
                D3=>XLXN_1196,
                D4=>XLXN_1195,
                D5=>XLXN_1196,
                D6=>XLXN_1196,
                D7=>XLXN_1196,
                E=>XLXN_11110,
                S0=>P2SEL(1),
                S1=>P2SEL(2),
                S2=>P2SEL(3),
                O=>P2PLAYED);
   
   U113 : FD4CE_HXILINX_ppmmvsh
      port map (C=>SYSCLK,
                CE=>STDISP3,
                CLR=>CLEAR,
                D0=>BRWD0,
                D1=>BRWD1,
                D2=>BRWD2,
                D3=>BRWD3,
                Q0=>DISP12,
                Q1=>DISP13,
                Q2=>DISP14,
                Q3=>DISP15);
   
   U114 : FD4CE_HXILINX_ppmmvsh
      port map (C=>SYSCLK,
                CE=>STDISP2,
                CLR=>CLEAR,
                D0=>BRWD0,
                D1=>BRWD1,
                D2=>BRWD2,
                D3=>BRWD3,
                Q0=>DISP8,
                Q1=>DISP9,
                Q2=>DISP10,
                Q3=>DISP11);
   
   U115 : FD4CE_HXILINX_ppmmvsh
      port map (C=>SYSCLK,
                CE=>STDISP1,
                CLR=>CLEAR,
                D0=>BRWD0,
                D1=>BRWD1,
                D2=>BRWD2,
                D3=>BRWD3,
                Q0=>DISP4,
                Q1=>DISP5,
                Q2=>DISP6,
                Q3=>DISP7);
   
   U116 : FD4CE_HXILINX_ppmmvsh
      port map (C=>SYSCLK,
                CE=>STDISP0,
                CLR=>CLEAR,
                D0=>BRWD0,
                D1=>BRWD1,
                D2=>BRWD2,
                D3=>BRWD3,
                Q0=>DISP0,
                Q1=>DISP1,
                Q2=>DISP2,
                Q3=>DISP3);
   
   U117 : FD8CE_HXILINX_ppmmvsh
      port map (C=>SYSCLK,
                CE=>STP1PT,
                CLR=>CLEAR,
                D(7 downto 0)=>NPT(7 downto 0),
                Q(7 downto 0)=>P1PT(7 downto 0));
   
   U118 : FD8CE_HXILINX_ppmmvsh
      port map (C=>SYSCLK,
                CE=>STP2PT,
                CLR=>CLEAR,
                D(7 downto 0)=>NPT(7 downto 0),
                Q(7 downto 0)=>P2PT(7 downto 0));
   
   U119 : CD4CE_HXILINX_ppmmvsh
      port map (C=>RDCLK,
                CE=>XLXN_1361,
                CLR=>XLXN_1363,
                CEO=>open,
                Q0=>RDC0,
                Q1=>RDC1,
                Q2=>RDC2,
                Q3=>RDC3,
                TC=>open);
   
   U120 : FD4CE_HXILINX_ppmmvsh
      port map (C=>SYSCLK,
                CE=>GRD,
                CLR=>CLRRDREGS,
                D0=>Q(8),
                D1=>RDC1,
                D2=>RDC2,
                D3=>RDC3,
                Q0=>R2D0,
                Q1=>R2D1,
                Q2=>R2D2,
                Q3=>R2D3);
   
   U121 : FD4CE_HXILINX_ppmmvsh
      port map (C=>SYSCLK,
                CE=>GRD,
                CLR=>CLRRDREGS,
                D0=>R2D0,
                D1=>R2D1,
                D2=>R2D2,
                D3=>R2D3,
                Q0=>R1D0,
                Q1=>R1D1,
                Q2=>R1D2,
                Q3=>R1D3);
   
   U122 : FD4CE_HXILINX_ppmmvsh
      port map (C=>SYSCLK,
                CE=>GRD,
                CLR=>CLRRDREGS,
                D0=>R1D0,
                D1=>R1D1,
                D2=>R1D2,
                D3=>R1D3,
                Q0=>R0D0,
                Q1=>R0D1,
                Q2=>R0D2,
                Q3=>R0D3);
   
   U148 : ADD4_HXILINX_ppmmvsh
      port map (A0=>RD0,
                A1=>RD1,
                A2=>RD2,
                A3=>RD3,
                B0=>DISP4,
                B1=>DISP5,
                B2=>DISP6,
                B3=>DISP7,
                CI=>XLXN_11259,
                CO=>PD1PRD,
                OFL=>open,
                S0=>NPDISP4,
                S1=>NPDISP5,
                S2=>NPDISP6,
                S3=>NPDISP7);
   
   U149 : ADD4_HXILINX_ppmmvsh
      port map (A0=>RD0,
                A1=>RD1,
                A2=>RD2,
                A3=>RD3,
                B0=>DISP0,
                B1=>DISP1,
                B2=>DISP2,
                B3=>DISP3,
                CI=>XLXN_11260,
                CO=>PD0PRD,
                OFL=>open,
                S0=>NPDISP0,
                S1=>NPDISP1,
                S2=>NPDISP2,
                S3=>NPDISP3);
   
   U150 : ADD4_HXILINX_ppmmvsh
      port map (A0=>RD0,
                A1=>RD1,
                A2=>RD2,
                A3=>RD3,
                B0=>DISP12,
                B1=>DISP13,
                B2=>DISP14,
                B3=>DISP15,
                CI=>XLXN_11261,
                CO=>PD3PRD,
                OFL=>open,
                S0=>NPDISP12,
                S1=>NPDISP13,
                S2=>NPDISP14,
                S3=>NPDISP15);
   
   U151 : ADD4_HXILINX_ppmmvsh
      port map (A0=>RD0,
                A1=>RD1,
                A2=>RD2,
                A3=>RD3,
                B0=>DISP8,
                B1=>DISP9,
                B2=>DISP10,
                B3=>DISP11,
                CI=>XLXN_11263,
                CO=>PD2PRD,
                OFL=>open,
                S0=>NPDISP8,
                S1=>NPDISP9,
                S2=>NPDISP10,
                S3=>NPDISP11);
   
   U152 : X74_157_MUSER_ppmmvsh
      port map (A0=>P1SEL0,
                A1=>P1SEL1,
                A2=>P1SEL2,
                A3=>P1SEL3,
                B0=>P2SEL(0),
                B1=>P2SEL(1),
                B2=>P2SEL(2),
                B3=>P2SEL(3),
                G=>XLXN_1595,
                S=>SELPLYR,
                Y0=>PSEL0,
                Y1=>PSEL1,
                Y2=>PSEL2,
                Y3=>PSEL3);
   
   U153 : OR2
      port map (I0=>PSEL3,
                I1=>PSEL1,
                O=>ENCPSEL0);
   
   U154 : OR2
      port map (I0=>PSEL2,
                I1=>PSEL3,
                O=>ENCPSEL1);
   
   U155 : M4_1E_HXILINX_ppmmvsh
      port map (D0=>PD0PRD,
                D1=>PD1PRD,
                D2=>PD2PRD,
                D3=>PD3PRD,
                E=>XLXN_1577,
                S0=>ENCPSEL0,
                S1=>ENCPSEL1,
                O=>PDPRD);
   
   U156 : X74_153_MUSER_ppmmvsh
      port map (A=>ENCPSEL0,
                B=>ENCPSEL1,
                G1=>XLXN_1615,
                G2=>XLXN_1615,
                I1C0=>NPDISP2,
                I1C1=>NPDISP6,
                I1C2=>NPDISP10,
                I1C3=>NPDISP14,
                I2C0=>NPDISP3,
                I2C1=>NPDISP7,
                I2C2=>NPDISP11,
                I2C3=>NPDISP15,
                Y1=>NPSELDISP2,
                Y2=>NPSELDISP3);
   
   U157 : X74_153_MUSER_ppmmvsh
      port map (A=>ENCPSEL0,
                B=>ENCPSEL1,
                G1=>XLXN_1623,
                G2=>XLXN_1623,
                I1C0=>NPDISP0,
                I1C1=>NPDISP4,
                I1C2=>NPDISP8,
                I1C3=>NPDISP12,
                I2C0=>NPDISP1,
                I2C1=>NPDISP5,
                I2C2=>NPDISP9,
                I2C3=>NPDISP13,
                Y1=>NPSELDISP0,
                Y2=>NPSELDISP1);
   
   U158 : X74_157_MUSER_ppmmvsh
      port map (A0=>RD0,
                A1=>RD1,
                A2=>RD2,
                A3=>RD3,
                B0=>NPSELDISP0,
                B1=>NPSELDISP1,
                B2=>NPSELDISP2,
                B3=>NPSELDISP3,
                G=>XLXN_1635,
                S=>ADD,
                Y0=>BRWD0,
                Y1=>BRWD1,
                Y2=>BRWD2,
                Y3=>BRWD3);
   
   U159 : COMP4_HXILINX_ppmmvsh
      port map (A0=>BRWD0,
                A1=>BRWD1,
                A2=>BRWD2,
                A3=>BRWD3,
                B0=>DISP4,
                B1=>DISP5,
                B2=>DISP6,
                B3=>DISP7,
                EQ=>EQ1);
   
   U160 : COMP4_HXILINX_ppmmvsh
      port map (A0=>BRWD0,
                A1=>BRWD1,
                A2=>BRWD2,
                A3=>BRWD3,
                B0=>DISP0,
                B1=>DISP1,
                B2=>DISP2,
                B3=>DISP3,
                EQ=>EQ0);
   
   U161 : COMP4_HXILINX_ppmmvsh
      port map (A0=>BRWD0,
                A1=>BRWD1,
                A2=>BRWD2,
                A3=>BRWD3,
                B0=>DISP12,
                B1=>DISP13,
                B2=>DISP14,
                B3=>DISP15,
                EQ=>EQ3);
   
   U162 : COMP4_HXILINX_ppmmvsh
      port map (A0=>BRWD0,
                A1=>BRWD1,
                A2=>BRWD2,
                A3=>BRWD3,
                B0=>DISP8,
                B1=>DISP9,
                B2=>DISP10,
                B3=>DISP11,
                EQ=>EQ2);
   
   U163 : AND2
      port map (I0=>RDP3EQ2,
                I1=>EQ1,
                O=>RDP3EQ1);
   
   U164 : AND2
      port map (I0=>RDP3EQ1,
                I1=>EQ0,
                O=>RDP3EQ0);
   
   U165 : AND2
      port map (I0=>RDP2EQ1,
                I1=>EQ0,
                O=>RDP2EQ0);
   
   U166 : AND2
      port map (I0=>RDP1EQ1,
                I1=>EQ3,
                O=>RDP1EQ0);
   
   U167 : AND2
      port map (I0=>RDP0EQ2,
                I1=>EQ2,
                O=>RDP0EQ1);
   
   U168 : AND2
      port map (I0=>RDP0EQ1,
                I1=>EQ3,
                O=>RDP0EQ0);
   
   U169 : M4_1E_HXILINX_ppmmvsh
      port map (D0=>RDP0EQ2,
                D1=>RDP1EQ2,
                D2=>RDP2EQ2,
                D3=>RDP3EQ2,
                E=>XLXN_2372,
                S0=>ENCPSEL0,
                S1=>ENCPSEL1,
                O=>UNENCNSD2);
   
   U170 : X74_153_MUSER_ppmmvsh
      port map (A=>ENCPSEL0,
                B=>ENCPSEL1,
                G1=>XLXN_1738,
                G2=>XLXN_1738,
                I1C0=>RDP0EQ0,
                I1C1=>RDP1EQ0,
                I1C2=>RDP2EQ0,
                I1C3=>RDP3EQ0,
                I2C0=>RDP0EQ1,
                I2C1=>RDP1EQ1,
                I2C2=>RDP2EQ1,
                I2C3=>RDP3EQ1,
                Y1=>UNENCNSD0,
                Y2=>UNENCNSD1);
   
   U171 : ADD4_HXILINX_ppmmvsh
      port map (A0=>UNENCNSD1,
                A1=>XLXN_1754,
                A2=>XLXN_1754,
                A3=>XLXN_1754,
                B0=>UNENCNSD2,
                B1=>XLXN_1754,
                B2=>XLXN_1754,
                B3=>XLXN_1754,
                CI=>UNENCNSD0,
                CO=>open,
                OFL=>open,
                S0=>NSD0,
                S1=>NSD1,
                S2=>open,
                S3=>open);
   
   U172 : AND3
      port map (I0=>NSD1,
                I1=>NSD0,
                I2=>BRWD3,
                O=>RWD(6));
   
   U173 : X74_153_MUSER_ppmmvsh
      port map (A=>NSD0,
                B=>NSD1,
                G1=>XLXN_1811,
                G2=>XLXN_1811,
                I1C0=>XLXN_1811,
                I1C1=>BRWD3,
                I1C2=>BRWD2,
                I1C3=>BRWD1,
                I2C0=>XLXN_1811,
                I2C1=>XLXN_1811,
                I2C2=>BRWD3,
                I2C3=>BRWD2,
                Y1=>RWD(4),
                Y2=>RWD(5));
   
   U174 : X74_153_MUSER_ppmmvsh
      port map (A=>NSD0,
                B=>NSD1,
                G1=>XLXN_1823,
                G2=>XLXN_1823,
                I1C0=>BRWD2,
                I1C1=>BRWD1,
                I1C2=>BRWD0,
                I1C3=>XLXN_1823,
                I2C0=>BRWD3,
                I2C1=>BRWD2,
                I2C2=>BRWD1,
                I2C3=>BRWD0,
                Y1=>RWD(2),
                Y2=>RWD(3));
   
   U175 : INV
      port map (I=>NSD1,
                O=>XLXN_1764);
   
   U176 : M2_1E_HXILINX_ppmmvsh
      port map (D0=>BRWD1,
                D1=>BRWD0,
                E=>XLXN_1764,
                S0=>NSD0,
                O=>RWD(1));
   
   U177 : AND3B2
      port map (I0=>NSD1,
                I1=>NSD0,
                I2=>BRWD0,
                O=>RWD(0));
   
   U178 : X74_157_MUSER_ppmmvsh
      port map (A0=>P1PT(4),
                A1=>P1PT(5),
                A2=>P1PT(6),
                A3=>P1PT(7),
                B0=>P2PT(4),
                B1=>P2PT(5),
                B2=>P2PT(6),
                B3=>P2PT(7),
                G=>XLXN_1785,
                S=>SELPLYR,
                Y0=>PT(4),
                Y1=>PT(5),
                Y2=>PT(6),
                Y3=>PT(7));
   
   U179 : X74_157_MUSER_ppmmvsh
      port map (A0=>P1PT(0),
                A1=>P1PT(1),
                A2=>P1PT(2),
                A3=>P1PT(3),
                B0=>P2PT(0),
                B1=>P2PT(1),
                B2=>P2PT(2),
                B3=>P2PT(3),
                G=>XLXN_1771,
                S=>SELPLYR,
                Y0=>PT(0),
                Y1=>PT(1),
                Y2=>PT(2),
                Y3=>PT(3));
   
   U180 : OR2
      port map (I0=>RWDCOT,
                I1=>XLXN_1802,
                O=>PTOVF);
   
   U181 : ADD8_HXILINX_ppmmvsh
      port map (A(7 downto 0)=>PT(7 downto 0),
                B(7 downto 0)=>TOTRWD(7 downto 0),
                CI=>XLXN_1801,
                CO=>XLXN_1802,
                OFL=>open,
                S(7 downto 0)=>NPT(7 downto 0));
   
   U182 : ADD8_HXILINX_ppmmvsh
      port map (A(7 downto 0)=>RWD(7 downto 0),
                B(7)=>CODERWD(7),
                B(6)=>CODERWD(6),
                B(5)=>CODERWD(5),
                B(4)=>CODERWD(4),
                B(3)=>CODERWD(3),
                B(2)=>CODERWD(2),
                B(1)=>CODERWD(1),
                B(0)=>CODERWD(0),
                CI=>XLXN_1809,
                CO=>RWDCOT,
                OFL=>open,
                S(7 downto 0)=>TOTRWD(7 downto 0));
   
   U293 : OR2
      port map (I0=>S4,
                I1=>S3P1PLAYSYNCHADJ,
                O=>CLEARP1FFS);
   
   U294 : OR2B1
      port map (I0=>LPTOVF,
                I1=>Q(8),
                O=>XLXN_210);
   
   U295 : D3_8E_HXILINX_ppmmvsh
      port map (A0=>MC0,
                A1=>MC1,
                A2=>MC2,
                E=>XLXN_210,
                D0=>DCDEN0,
                D1=>DCDEN1,
                D2=>DCDEN2,
                D3=>DCDEN3,
                D4=>DCDEN4,
                D5=>DCDEN5,
                D6=>DCDEN6,
                D7=>DCDEN7);
   
   U296 : M8_1E_HXILINX_ppmmvsh
      port map (D0=>DDISP1,
                D1=>DDISP5,
                D2=>DDISP9,
                D3=>DDISP13,
                D4=>DISP4INP1,
                D5=>DISP5INP1,
                D6=>DISP6INP1,
                D7=>DISP7INP1,
                E=>XLXN_11941,
                S0=>MC0,
                S1=>MC1,
                S2=>MC2,
                O=>KSBUS(1));
   
   U297 : M8_1E_HXILINX_ppmmvsh
      port map (D0=>DDISP0,
                D1=>DDISP4,
                D2=>DDISP8,
                D3=>DDISP12,
                D4=>DISP4INP0,
                D5=>DISP5INP0,
                D6=>DISP6INP0,
                D7=>DISP7INP0,
                E=>XLXN_11981,
                S0=>MC0,
                S1=>MC1,
                S2=>MC2,
                O=>KSBUS(0));
   
   U298 : M8_1E_HXILINX_ppmmvsh
      port map (D0=>DDISP3,
                D1=>DDISP7,
                D2=>DDISP11,
                D3=>DDISP15,
                D4=>DISP4INP3,
                D5=>DISP5INP3,
                D6=>DISP6INP3,
                D7=>DISP7INP3,
                E=>XLXN_11980,
                S0=>MC0,
                S1=>MC1,
                S2=>MC2,
                O=>KSBUS(3));
   
   U299 : M8_1E_HXILINX_ppmmvsh
      port map (D0=>DDISP2,
                D1=>DDISP6,
                D2=>DDISP10,
                D3=>DDISP14,
                D4=>DISP4INP2,
                D5=>DISP5INP2,
                D6=>DISP6INP2,
                D7=>DISP7INP2,
                E=>XLXN_11982,
                S0=>MC0,
                S1=>MC1,
                S2=>MC2,
                O=>KSBUS(2));
   
   XLXI_24 : VCC
      port map (P=>XLXN_1361);
   
   XLXI_25 : GND
      port map (G=>XLXN_1363);
   
   XLXI_27 : GND
      port map (G=>XLXN_88);
   
   XLXI_31 : GND
      port map (G=>XLXN_10400);
   
   XLXI_33 : GND
      port map (G=>XLXN_10403);
   
   XLXI_34 : GND
      port map (G=>XLXN_11263);
   
   XLXI_35 : GND
      port map (G=>XLXN_11259);
   
   XLXI_37 : GND
      port map (G=>XLXN_10405);
   
   XLXI_39 : GND
      port map (G=>XLXN_1635);
   
   XLXI_42 : GND
      port map (G=>XLXN_1623);
   
   XLXI_43 : GND
      port map (G=>XLXN_1615);
   
   XLXI_47 : VCC
      port map (P=>XLXN_1577);
   
   XLXI_49 : GND
      port map (G=>XLXN_1595);
   
   XLXI_54 : VCC
      port map (P=>XLXN_2372);
   
   XLXI_65 : VCC
      port map (P=>XLXN_11941);
   
   XLXI_66 : VCC
      port map (P=>XLXN_12238);
   
   XLXI_69 : GND
      port map (G=>RWD(7));
   
   XLXI_120 : GND
      port map (G=>XLXN_1771);
   
   XLXI_122 : GND
      port map (G=>XLXN_1785);
   
   XLXI_127 : GND
      port map (G=>XLXN_1801);
   
   XLXI_128 : GND
      port map (G=>XLXN_1809);
   
   XLXI_139 : GND
      port map (G=>XLXN_1738);
   
   XLXI_140 : GND
      port map (G=>XLXN_1811);
   
   XLXI_141 : GND
      port map (G=>XLXN_1823);
   
   XLXI_191 : VCC
      port map (P=>XLXN_12183);
   
   XLXI_193 : GND
      port map (G=>XLXN_12167);
   
   XLXI_245 : GND
      port map (G=>XLXN_10394);
   
   XLXI_424 : VCC
      port map (P=>XLXN_11110);
   
   XLXI_425 : GND
      port map (G=>XLXN_1196);
   
   XLXI_459 : GND
      port map (G=>XLXN_11261);
   
   XLXI_462 : GND
      port map (G=>XLXN_11260);
   
   XLXI_541 : GND
      port map (G=>XLXN_1754);
   
   XLXI_687 : GND
      port map (G=>XLXN_4);
   
   XLXI_1050 : GND
      port map (G=>XLXN_10395);
   
   XLXI_1051 : GND
      port map (G=>XLXN_10402);
   
   XLXI_1052 : GND
      port map (G=>XLXN_10404);
   
   XLXI_1053 : GND
      port map (G=>XLXN_10406);
   
   XLXI_1217 : GND
      port map (G=>XLXN_10993);
   
   XLXI_1231 : GND
      port map (G=>XLXN_10716);
   
   XLXI_1233 : VCC
      port map (P=>XLXN_1);
   
   XLXI_1240 : VCC
      port map (P=>XLXN_8);
   
   XLXI_1241 : GND
      port map (G=>XLXN_7);
   
   XLXI_1509 : OBUF
      port map (I=>XLXN_12049,
                O=>A4_NB2P);
   
   XLXI_1510 : OBUF
      port map (I=>XLXN_12041,
                O=>A5_NB2P);
   
   XLXI_1511 : OBUF
      port map (I=>XLXN_12042,
                O=>A6_NB2P);
   
   XLXI_1512 : OBUF
      port map (I=>XLXN_12043,
                O=>A7_NB2P);
   
   XLXI_1550 : VCC
      port map (P=>XLXN_11980);
   
   XLXI_1551 : VCC
      port map (P=>XLXN_11981);
   
   XLXI_1552 : VCC
      port map (P=>XLXN_11982);
   
   XLXI_1566 : INV
      port map (I=>DCDEN4,
                O=>XLXN_12049);
   
   XLXI_1570 : VCC
      port map (P=>XLXN_211);
   
   XLXI_1571 : GND
      port map (G=>XLXN_213);
   
   XLXI_1575 : INV
      port map (I=>DCDEN5,
                O=>XLXN_12041);
   
   XLXI_1576 : INV
      port map (I=>DCDEN6,
                O=>XLXN_12042);
   
   XLXI_1577 : INV
      port map (I=>DCDEN7,
                O=>XLXN_12043);
   
   XLXI_1814 : OBUF
      port map (I=>R2D3,
                O=>LED15);
   
   XLXI_1884 : OBUF
      port map (I=>R2D2,
                O=>LED14);
   
   XLXI_1885 : OBUF
      port map (I=>R2D1,
                O=>LED13);
   
   XLXI_1886 : OBUF
      port map (I=>R2D0,
                O=>LED12);
   
   XLXI_1887 : OBUF
      port map (I=>R1D3,
                O=>LED11);
   
   XLXI_1888 : OBUF
      port map (I=>R1D2,
                O=>LED10);
   
   XLXI_1889 : OBUF
      port map (I=>R1D1,
                O=>LED9);
   
   XLXI_1890 : OBUF
      port map (I=>R1D0,
                O=>LED8);
   
   XLXI_2144 : GND
      port map (G=>XLXN_102);
   
   XLXI_2201 : IBUF
      port map (I=>sw15,
                O=>Testrd);
   
   XLXI_2202 : PmodKEYPAD
      port map (Clk=>CLOCK,
                Keypadout(3 downto 0)=>KEYPAD(3 downto 0),
                JA(7 downto 0)=>KEYINPOUT(7 downto 0));
   
   XLXI_2305 : M2_1E_HXILINX_ppmmvsh
      port map (D0=>XLXN_12721,
                D1=>XLXN_12720,
                E=>XLXN_12684,
                S0=>OUTCOME1,
                O=>OUTCOME2);
   
   XLXI_2312 : INV
      port map (I=>DECISION1,
                O=>XLXN_12684);
   
   XLXI_2326 : VCC
      port map (P=>XLXN_12720);
   
   XLXI_2327 : GND
      port map (G=>XLXN_12721);
   
   XLXI_2328 : AND2
      port map (I0=>OUTCOME0,
                I1=>DECISION0,
                O=>EA0);
   
   XLXI_2331 : AND3
      port map (I0=>XLXN_12735,
                I1=>XLXN_12734,
                I2=>XLXN_12733,
                O=>EA3);
   
   XLXI_2332 : AND2
      port map (I0=>OUTCOME1,
                I1=>XLXN_12732,
                O=>EA1);
   
   XLXI_2333 : AND2
      port map (I0=>OUTCOME2,
                I1=>XLXN_12736,
                O=>EA2);
   
   XLXI_2334 : INV
      port map (I=>OUTCOME0,
                O=>XLXN_12732);
   
   XLXI_2335 : INV
      port map (I=>DECISION0,
                O=>XLXN_12733);
   
   XLXI_2336 : INV
      port map (I=>DECISION1,
                O=>XLXN_12734);
   
   XLXI_2337 : INV
      port map (I=>OUTCOME1,
                O=>XLXN_12735);
   
   XLXI_2339 : INV
      port map (I=>OUTCOME1,
                O=>XLXN_12736);
   
   XLXI_2347 : IBUF
      port map (I=>P2SEL3_NP2B,
                O=>P2SEL(3));
   
   XLXI_2348 : IBUF
      port map (I=>P2SEL2_NP2B,
                O=>P2SEL(2));
   
   XLXI_2349 : IBUF
      port map (I=>P2SEL1_NP2B,
                O=>P2SEL(1));
   
   XLXI_2350 : IBUF
      port map (I=>P2SEL0_NP2B,
                O=>P2SEL(0));
   
   XLXI_2365 : M2_1_HXILINX_ppmmvsh
      port map (D0=>DISP0LESDISP1,
                D1=>DISP2LESDISP3,
                S0=>LRGDISPPOS1,
                O=>LRGDISPPOS0);
   
   XLXI_2366 : COMPM4_HXILINX_ppmmvsh
      port map (A0=>XLXN_12548,
                A1=>XLXN_12550,
                A2=>XLXN_12551,
                A3=>XLXN_12552,
                B0=>XLXN_12553,
                B1=>XLXN_12554,
                B2=>XLXN_12555,
                B3=>XLXN_12556,
                GT=>open,
                LT=>LRGDISPPOS1);
   
   XLXI_2367 : X74_157_MUSER_ppmmvsh
      port map (A0=>DISP0,
                A1=>DISP2,
                A2=>DISP4,
                A3=>DISP6,
                B0=>DISP1,
                B1=>DISP3,
                B2=>DISP5,
                B3=>DISP7,
                G=>XLXN_12504,
                S=>DISP0LESDISP1,
                Y0=>XLXN_12548,
                Y1=>XLXN_12550,
                Y2=>XLXN_12551,
                Y3=>XLXN_12552);
   
   XLXI_2368 : X74_157_MUSER_ppmmvsh
      port map (A0=>DISP8,
                A1=>DISP10,
                A2=>DISP12,
                A3=>DISP14,
                B0=>DISP9,
                B1=>DISP11,
                B2=>DISP13,
                B3=>DISP15,
                G=>XLXN_12505,
                S=>DISP2LESDISP3,
                Y0=>XLXN_12553,
                Y1=>XLXN_12554,
                Y2=>XLXN_12555,
                Y3=>XLXN_12556);
   
   XLXI_2369 : GND
      port map (G=>XLXN_12505);
   
   XLXI_2370 : GND
      port map (G=>XLXN_12504);
   
   XLXI_2371 : COMPM4_HXILINX_ppmmvsh
      port map (A0=>DISP8,
                A1=>DISP9,
                A2=>DISP10,
                A3=>DISP11,
                B0=>DISP12,
                B1=>DISP13,
                B2=>DISP14,
                B3=>DISP15,
                GT=>open,
                LT=>DISP2LESDISP3);
   
   XLXI_2372 : COMPM4_HXILINX_ppmmvsh
      port map (A0=>DISP0,
                A1=>DISP1,
                A2=>DISP2,
                A3=>DISP3,
                B0=>DISP4,
                B1=>DISP5,
                B2=>DISP6,
                B3=>DISP7,
                GT=>open,
                LT=>DISP0LESDISP1);
   
   XLXI_2373 : OR4
      port map (I0=>POS3ZERO,
                I1=>POS2ZERO,
                I2=>POS1ZERO,
                I3=>POS0ZERO,
                O=>APOSZERO);
   
   XLXI_2374 : NOR4
      port map (I0=>DISP15,
                I1=>DISP14,
                I2=>DISP13,
                I3=>DISP12,
                O=>POS3ZERO);
   
   XLXI_2375 : NOR4
      port map (I0=>DISP7,
                I1=>DISP6,
                I2=>DISP5,
                I3=>DISP4,
                O=>POS1ZERO);
   
   XLXI_2376 : NOR4
      port map (I0=>DISP11,
                I1=>DISP10,
                I2=>DISP9,
                I3=>DISP8,
                O=>POS2ZERO);
   
   XLXI_2377 : INV
      port map (I=>POS1ZERO,
                O=>XLXN_12433);
   
   XLXI_2378 : INV
      port map (I=>POS0ZERO,
                O=>XLXN_12434);
   
   XLXI_2379 : AND2
      port map (I0=>XLXN_12433,
                I1=>XLXN_12434,
                O=>ZERODISP1);
   
   XLXI_2380 : AND2
      port map (I0=>XLXN_12451,
                I1=>POS1ZERO,
                O=>XLXN_12453);
   
   XLXI_2381 : AND2
      port map (I0=>XLXN_12450,
                I1=>XLXN_12449,
                O=>XLXN_12454);
   
   XLXI_2382 : INV
      port map (I=>POS2ZERO,
                O=>XLXN_12449);
   
   XLXI_2383 : INV
      port map (I=>POS0ZERO,
                O=>XLXN_12450);
   
   XLXI_2384 : INV
      port map (I=>POS0ZERO,
                O=>XLXN_12451);
   
   XLXI_2385 : OR2
      port map (I0=>XLXN_12454,
                I1=>XLXN_12453,
                O=>ZERODISP0);
   
   XLXI_2386 : NOR4
      port map (I0=>DISP3,
                I1=>DISP2,
                I2=>DISP1,
                I3=>DISP0,
                O=>POS0ZERO);
   
   XLXI_2387 : M2_1_HXILINX_ppmmvsh
      port map (D0=>DECISION1,
                D1=>XLXN_12718,
                S0=>DECISION0,
                O=>OUTCOME0);
   
   XLXI_2388 : AND2
      port map (I0=>RDISNOT0,
                I1=>XLXN_12562,
                O=>XLXN_12621);
   
   XLXI_2389 : OR2
      port map (I0=>RWDWINS,
                I1=>XLXN_12621,
                O=>DECISION0);
   
   XLXI_2390 : AND2
      port map (I0=>isgtsf,
                I1=>isnsdnotzero,
                O=>DECISION1);
   
   XLXI_2391 : OR2
      port map (I0=>LARGESTNSD1,
                I1=>LARGESTNSD0,
                O=>XLXN_12562);
   
   XLXI_2392 : INV
      port map (I=>DECISION0,
                O=>XLXN_12682);
   
   XLXI_2393 : M2_1E_HXILINX_ppmmvsh
      port map (D0=>DECISION2,
                D1=>XLXN_12719,
                E=>XLXN_12682,
                S0=>OUTCOME0,
                O=>OUTCOME1);
   
   XLXI_2394 : VCC
      port map (P=>XLXN_12718);
   
   XLXI_2395 : VCC
      port map (P=>XLXN_12719);
   
   XLXI_2433 : OR2
      port map (I0=>EA3,
                I1=>EA2,
                O=>XLXN_12769);
   
   XLXI_2434 : D2_4E_HXILINX_ppmmvsh
      port map (A0=>LGADJSELECTPOS0,
                A1=>LGADJSELECTPOS1,
                E=>EA1,
                D0=>P1SEL0EA1,
                D1=>P1SEL1EA1,
                D2=>P1SEL2EA1,
                D3=>P1SEL3EA1);
   
   XLXI_2435 : D2_4E_HXILINX_ppmmvsh
      port map (A0=>LARGESTPTPOSEL0,
                A1=>LARGESTPTPOSEL1,
                E=>EA0,
                D0=>P1SEL0EA0,
                D1=>P1SEL1EA0,
                D2=>P1SEL2EA0,
                D3=>P1SEL3EA0);
   
   XLXI_2436 : D2_4E_HXILINX_ppmmvsh
      port map (A0=>LRGDISPPOS0,
                A1=>LRGDISPPOS1,
                E=>XLXN_12769,
                D0=>P1SEL0EA23,
                D1=>P1SEL1EA23,
                D2=>P1SEL2EA23,
                D3=>P1SEL3EA23);
   
   XLXI_2437 : BUFG
      port map (I=>LARGESTPTPOSEL0,
                O=>XLXN_13036);
   
   XLXI_2446 : OR4
      port map (I0=>RD3,
                I1=>RD2,
                I2=>RD1,
                I3=>RD0,
                O=>RDISNOT0);
   
   XLXI_2447 : GND
      port map (G=>sf(6));
   
   XLXI_2448 : GND
      port map (G=>sf(4));
   
   XLXI_2449 : GND
      port map (G=>sf(3));
   
   XLXI_2450 : GND
      port map (G=>sf(5));
   
   XLXI_2451 : GND
      port map (G=>sf(1));
   
   XLXI_2452 : GND
      port map (G=>sf(0));
   
   XLXI_2453 : VCC
      port map (P=>sf(7));
   
   XLXI_2454 : COMPMC8_HXILINX_ppmmvsh
      port map (A(7 downto 0)=>P1PT(7 downto 0),
                B(7 downto 0)=>sf(7 downto 0),
                GT=>isgtsf,
                LT=>open);
   
   XLXI_2455 : OR2
      port map (I0=>NSD1,
                I1=>NSD0,
                O=>isnsdnotzero);
   
   XLXI_2456 : GND
      port map (G=>sf(2));
   
   XLXI_2461 : COMPMC8_HXILINX_ppmmvsh
      port map (A(7 downto 0)=>seven(7 downto 0),
                B(7 downto 0)=>RWD(7 downto 0),
                GT=>open,
                LT=>DECISION2);
   
   XLXI_2462 : VCC
      port map (P=>seven(1));
   
   XLXI_2463 : VCC
      port map (P=>seven(2));
   
   XLXI_2464 : VCC
      port map (P=>seven(0));
   
   XLXI_2465 : GND
      port map (G=>seven(3));
   
   XLXI_2466 : GND
      port map (G=>seven(4));
   
   XLXI_2467 : GND
      port map (G=>seven(5));
   
   XLXI_2468 : GND
      port map (G=>seven(6));
   
   XLXI_2469 : GND
      port map (G=>seven(7));
   
   XLXI_2470 : INV
      port map (I=>DECISION2,
                O=>XLXN_13037);
   
   XLXI_2473 : OR2
      port map (I0=>XLXN_13037,
                I1=>XLXN_13036,
                O=>P1ADD);
   
   XLXI_2478 : OR3
      port map (I0=>P1SEL0EA23,
                I1=>P1SEL0EA1,
                I2=>P1SEL0EA0,
                O=>P1SEL0);
   
   XLXI_2479 : OR3
      port map (I0=>P1SEL1EA23,
                I1=>P1SEL1EA1,
                I2=>P1SEL1EA0,
                O=>P1SEL1);
   
   XLXI_2480 : OR3
      port map (I0=>P1SEL2EA23,
                I1=>P1SEL2EA1,
                I2=>P1SEL2EA0,
                O=>P1SEL2);
   
   XLXI_2481 : OR3
      port map (I0=>P1SEL3EA23,
                I1=>P1SEL3EA1,
                I2=>P1SEL3EA0,
                O=>P1SEL3);
   
   XLXI_2482 : ADD8_HXILINX_ppmmvsh
      port map (A(7 downto 0)=>P1PT(7 downto 0),
                B(7 downto 0)=>LARGESTRWD(7 downto 0),
                CI=>XLXN_13044,
                CO=>RWDWINS,
                OFL=>open,
                S=>open);
   
   XLXI_2484 : GND
      port map (G=>XLXN_13044);
   
   XLXI_2485 : AND2
      port map (I0=>XLXN_13052,
                I1=>P1STURN,
                O=>XLXN_13141);
   
   XLXI_2486 : INV
      port map (I=>SB3,
                O=>XLXN_13052);
   
   XLXI_2490 : CB4CLED_HXILINX_ppmmvsh
      port map (C=>P2CLK,
                CE=>XLXN_13073,
                CLR=>CLEARP1FFS,
                D0=>XLXN_13057,
                D1=>XLXN_13058,
                D2=>XLXN_13059,
                D3=>XLXN_13060,
                L=>XLXN_13062,
                UP=>XLXN_13061,
                CEO=>open,
                Q0=>SB0,
                Q1=>SB1,
                Q2=>SB2,
                Q3=>SB3,
                TC=>open);
   
   XLXI_2491 : GND
      port map (G=>XLXN_13057);
   
   XLXI_2492 : GND
      port map (G=>XLXN_13058);
   
   XLXI_2493 : GND
      port map (G=>XLXN_13059);
   
   XLXI_2494 : GND
      port map (G=>XLXN_13060);
   
   XLXI_2495 : GND
      port map (G=>XLXN_13062);
   
   XLXI_2496 : VCC
      port map (P=>XLXN_13061);
   
   XLXI_2512 : AND2B1
      port map (I0=>P1PLAYED,
                I1=>P1STURN,
                O=>XLXN_13073);
   
   XLXI_2516 : D3_8E_HXILINX_ppmmvsh
      port map (A0=>SB1,
                A1=>SB1,
                A2=>SB2,
                E=>XLXN_13484,
                D0=>TSCASE0,
                D1=>TSCASE1,
                D2=>TSCASE2,
                D3=>TSCASE3,
                D4=>TSCASE4,
                D5=>TSCASE5,
                D6=>TSCASE6,
                D7=>TSCASE7);
   
   XLXI_2525 : AND2
      port map (I0=>XLXN_13141,
                I1=>XLXN_13158,
                O=>UPDATERWD);
   
   XLXI_2526 : FD4CE_HXILINX_ppmmvsh
      port map (C=>P2CLK,
                CE=>UPDATENSD,
                CLR=>CLEARP1FFS,
                D0=>NSD1,
                D1=>SB0,
                D2=>SB1,
                D3=>SB2,
                Q0=>LARGESTNSD1,
                Q1=>LGADJSELECTPOS0,
                Q2=>LGADJSELECTPOS1,
                Q3=>LGADJADD);
   
   XLXI_2528 : FDCE
      port map (C=>P2CLK,
                CE=>UPDATENSD,
                CLR=>CLEARP1FFS,
                D=>NSD0,
                Q=>LARGESTNSD0);
   
   XLXI_2529 : OR2
      port map (I0=>RWDGTRDLAR,
                I1=>TSCASE0,
                O=>XLXN_13158);
   
   XLXI_2530 : OR2
      port map (I0=>TSCASE4,
                I1=>TSCASE0,
                O=>TESTPOS0);
   
   XLXI_2531 : OR2
      port map (I0=>TSCASE5,
                I1=>TSCASE1,
                O=>TESTPOS1);
   
   XLXI_2532 : OR2
      port map (I0=>TSCASE6,
                I1=>TSCASE2,
                O=>TESTPOS2);
   
   XLXI_2533 : OR2
      port map (I0=>TSCASE7,
                I1=>TSCASE3,
                O=>TESTPOS3);
   
   XLXI_2534 : OR2
      port map (I0=>TSCASE0,
                I1=>NSDGT,
                O=>XLXN_13175);
   
   XLXI_2535 : AND2
      port map (I0=>XLXN_13184,
                I1=>XLXN_13175,
                O=>UPDATENSD);
   
   XLXI_2540 : AND2
      port map (I0=>XLXN_13185,
                I1=>P1STURN,
                O=>XLXN_13184);
   
   XLXI_2541 : INV
      port map (I=>SB3,
                O=>XLXN_13185);
   
   XLXI_2582 : FD8CE_HXILINX_ppmmvsh
      port map (C=>P2CLK,
                CE=>UPDATERWD,
                CLR=>CLEARP1FFS,
                D(7 downto 0)=>RWD(7 downto 0),
                Q(7 downto 0)=>LARGESTRWD(7 downto 0));
   
   XLXI_2610 : BUF
      port map (I=>P2PT(5),
                O=>DISP7INP1);
   
   XLXI_2615 : BUF
      port map (I=>P2PT(6),
                O=>DISP7INP2);
   
   XLXI_2616 : BUF
      port map (I=>P2PT(4),
                O=>DISP7INP0);
   
   XLXI_2617 : BUF
      port map (I=>P2PT(7),
                O=>DISP7INP3);
   
   XLXI_2626 : BUF
      port map (I=>P2PT(1),
                O=>DISP6INP1);
   
   XLXI_2627 : BUF
      port map (I=>P2PT(2),
                O=>DISP6INP2);
   
   XLXI_2628 : BUF
      port map (I=>P2PT(0),
                O=>DISP6INP0);
   
   XLXI_2629 : BUF
      port map (I=>P2PT(3),
                O=>DISP6INP3);
   
   XLXI_2630 : BUF
      port map (I=>P1PT(5),
                O=>DISP5INP1);
   
   XLXI_2631 : BUF
      port map (I=>P1PT(6),
                O=>DISP5INP2);
   
   XLXI_2632 : BUF
      port map (I=>P1PT(4),
                O=>DISP5INP0);
   
   XLXI_2633 : BUF
      port map (I=>P1PT(7),
                O=>DISP5INP3);
   
   XLXI_2634 : BUF
      port map (I=>P1PT(1),
                O=>DISP4INP1);
   
   XLXI_2635 : BUF
      port map (I=>P1PT(2),
                O=>DISP4INP2);
   
   XLXI_2636 : BUF
      port map (I=>P1PT(0),
                O=>DISP4INP0);
   
   XLXI_2637 : BUF
      port map (I=>P1PT(3),
                O=>DISP4INP3);
   
   XLXI_2638 : FD4CE_HXILINX_ppmmvsh
      port map (C=>P2CLK,
                CE=>UPDATERWD,
                CLR=>CLEARP1FFS,
                D0=>SB0,
                D1=>SB1,
                D2=>SB2,
                D3=>XLXN_13471,
                Q0=>LARGESTPTPOSEL0,
                Q1=>LARGESTPTPOSEL1,
                Q2=>LARGESTPTADDSIG,
                Q3=>XLXN_13467);
   
   XLXI_2639 : GND
      port map (G=>XLXN_13471);
   
   XLXI_2642 : INV
      port map (I=>SB3,
                O=>XLXN_13484);
   
   XLXI_2644 : COMPM2_HXILINX_ppmmvsh
      port map (A0=>NSD0,
                A1=>NSD1,
                B0=>LARGESTNSD0,
                B1=>LARGESTNSD1,
                GT=>NSDGT,
                LT=>open);
   
   XLXI_2646 : COMPM8_HXILINX_ppmmvsh
      port map (A(7 downto 0)=>RWD(7 downto 0),
                B(7 downto 0)=>LARGESTRWD(7 downto 0),
                GT=>RWDGTRDLAR,
                LT=>open);
   
   XLXI_2864 : AND2
      port map (I0=>XLXN_14003,
                I1=>SB3,
                O=>P1PLAYED);
   
   XLXI_2866 : OR4
      port map (I0=>EA3,
                I1=>EA2,
                I2=>EA1,
                I3=>EA0,
                O=>XLXN_14003);
   
   XLXI_2868 : IBUF
      port map (I=>P2ADD_NP2B,
                O=>P2ADD);
   
end BEHAVIORAL;


