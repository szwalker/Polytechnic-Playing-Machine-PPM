--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : X74_153.vhf
-- /___/   /\     Timestamp : 12/12/2017 13:41:20
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -intstyle ise -family artix7 -flat -suppress -vhdl "S:/Exp 3/ppmmvsh/X74_153.vhf" -w "S:/Exp 3/ppmmvsh/X74_153.sch"
--Design Name: X74_153
--Device: artix7
--Purpose:
--    This vhdl netlist is translated from an ECS schematic. It can be 
--    synthesized and simulated, but it should not be modified. 
--
----- CELL M2_1E_HXILINX_X74_153 -----
  
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity M2_1E_HXILINX_X74_153 is
  
port(
    O   : out std_logic;

    D0  : in std_logic;
    D1  : in std_logic;
    E   : in std_logic;
    S0  : in std_logic
  );
end M2_1E_HXILINX_X74_153;

architecture M2_1E_HXILINX_X74_153_V of M2_1E_HXILINX_X74_153 is
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
end M2_1E_HXILINX_X74_153_V;
----- CELL M2_1_HXILINX_X74_153 -----
  
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity M2_1_HXILINX_X74_153 is
  
port(
    O   : out std_logic;

    D0  : in std_logic;
    D1  : in std_logic;
    S0  : in std_logic
  );
end M2_1_HXILINX_X74_153;

architecture M2_1_HXILINX_X74_153_V of M2_1_HXILINX_X74_153 is
begin
  process (D0, D1, S0)
  begin
    case S0 is
    when '0' => O <= D0;
    when '1' => O <= D1;
    when others => NULL;
    end case;
    end process; 
end M2_1_HXILINX_X74_153_V;

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity X74_153 is
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
end X74_153;

architecture BEHAVIORAL of X74_153 is
   attribute HU_SET     : string ;
   attribute BOX_TYPE   : string ;
   signal XLXN_1  : std_logic;
   signal XLXN_2  : std_logic;
   signal XLXN_13 : std_logic;
   signal XLXN_14 : std_logic;
   signal XLXN_15 : std_logic;
   signal XLXN_22 : std_logic;
   component M2_1_HXILINX_X74_153
      port ( D0 : in    std_logic; 
             D1 : in    std_logic; 
             S0 : in    std_logic; 
             O  : out   std_logic);
   end component;
   
   component M2_1E_HXILINX_X74_153
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
   
   attribute HU_SET of XLXI_1 : label is "XLXI_1_0";
   attribute HU_SET of XLXI_2 : label is "XLXI_2_1";
   attribute HU_SET of XLXI_3 : label is "XLXI_3_2";
   attribute HU_SET of XLXI_4 : label is "XLXI_4_3";
   attribute HU_SET of XLXI_5 : label is "XLXI_5_4";
   attribute HU_SET of XLXI_6 : label is "XLXI_6_5";
begin
   XLXI_1 : M2_1_HXILINX_X74_153
      port map (D0=>I1C0,
                D1=>I1C1,
                S0=>A,
                O=>XLXN_1);
   
   XLXI_2 : M2_1_HXILINX_X74_153
      port map (D0=>I1C2,
                D1=>I1C3,
                S0=>A,
                O=>XLXN_2);
   
   XLXI_3 : M2_1_HXILINX_X74_153
      port map (D0=>I2C0,
                D1=>I2C1,
                S0=>A,
                O=>XLXN_13);
   
   XLXI_4 : M2_1_HXILINX_X74_153
      port map (D0=>I2C2,
                D1=>I2C3,
                S0=>A,
                O=>XLXN_14);
   
   XLXI_5 : M2_1E_HXILINX_X74_153
      port map (D0=>XLXN_1,
                D1=>XLXN_2,
                E=>XLXN_22,
                S0=>B,
                O=>Y1);
   
   XLXI_6 : M2_1E_HXILINX_X74_153
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


