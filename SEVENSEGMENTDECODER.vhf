--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : SEVENSEGMENTDECODER.vhf
-- /___/   /\     Timestamp : 01/31/2016 17:36:55
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -intstyle ise -family artix7 -flat -suppress -vhdl S:/ppmsevensegmentdisplay/SEVENSEGMENTDECODER.vhf -w S:/ppmsevensegmentdisplay/SEVENSEGMENTDECODER.sch
--Design Name: SEVENSEGMENTDECODER
--Device: artix7
--Purpose:
--    This vhdl netlist is translated from an ECS schematic. It can be 
--    synthesized and simulated, but it should not be modified. 
--
----- CELL M2_1E_HXILINX_SEVENSEGMENTDECODER -----
  
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity M2_1E_HXILINX_SEVENSEGMENTDECODER is
  
port(
    O   : out std_logic;

    D0  : in std_logic;
    D1  : in std_logic;
    E   : in std_logic;
    S0  : in std_logic
  );
end M2_1E_HXILINX_SEVENSEGMENTDECODER;

architecture M2_1E_HXILINX_SEVENSEGMENTDECODER_V of M2_1E_HXILINX_SEVENSEGMENTDECODER is
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
end M2_1E_HXILINX_SEVENSEGMENTDECODER_V;
----- CELL FTC_HXILINX_SEVENSEGMENTDECODER -----


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FTC_HXILINX_SEVENSEGMENTDECODER is
generic(
    INIT : bit := '0'
    );

  port (
    Q   : out STD_LOGIC := '0';
    C   : in STD_LOGIC;
    CLR : in STD_LOGIC;
    T   : in STD_LOGIC
    );
end FTC_HXILINX_SEVENSEGMENTDECODER;

architecture Behavioral of FTC_HXILINX_SEVENSEGMENTDECODER is
signal q_tmp : std_logic := TO_X01(INIT);
begin

process(C, CLR)
begin
  if (CLR='1') then
    q_tmp <= '0';
  elsif (C'event and C = '1') then
    if(T='1') then
      q_tmp <= not q_tmp;
    end if;
  end if;  
end process;

Q <= q_tmp;

end Behavioral;


library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity X74_157_MUSER_SEVENSEGMENTDECODER is
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
end X74_157_MUSER_SEVENSEGMENTDECODER;

architecture BEHAVIORAL of X74_157_MUSER_SEVENSEGMENTDECODER is
   attribute HU_SET     : string ;
   attribute BOX_TYPE   : string ;
   signal XLXN_196 : std_logic;
   component M2_1E_HXILINX_SEVENSEGMENTDECODER
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
   XLXI_114 : M2_1E_HXILINX_SEVENSEGMENTDECODER
      port map (D0=>A0,
                D1=>B0,
                E=>XLXN_196,
                S0=>S,
                O=>Y0);
   
   XLXI_115 : M2_1E_HXILINX_SEVENSEGMENTDECODER
      port map (D0=>A1,
                D1=>B1,
                E=>XLXN_196,
                S0=>S,
                O=>Y1);
   
   XLXI_116 : M2_1E_HXILINX_SEVENSEGMENTDECODER
      port map (D0=>A2,
                D1=>B2,
                E=>XLXN_196,
                S0=>S,
                O=>Y2);
   
   XLXI_117 : M2_1E_HXILINX_SEVENSEGMENTDECODER
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

entity SEVENSEGMENTDECODER is
   port ( ANUM0  : in    std_logic; 
          ANUM1  : in    std_logic; 
          ANUM2  : in    std_logic; 
          ANUM3  : in    std_logic; 
          BNUM0  : in    std_logic; 
          BNUM1  : in    std_logic; 
          BNUM2  : in    std_logic; 
          BNUM3  : in    std_logic; 
          CLKINP : in    std_logic; 
          AA     : out   std_logic; 
          AB     : out   std_logic; 
          AC     : out   std_logic; 
          AD     : out   std_logic; 
          AE     : out   std_logic; 
          AF     : out   std_logic; 
          AG     : out   std_logic; 
          DIGSEL : out   std_logic);
end SEVENSEGMENTDECODER;

architecture BEHAVIORAL of SEVENSEGMENTDECODER is
   attribute INIT       : string ;
   attribute BOX_TYPE   : string ;
   attribute HU_SET     : string ;
   signal HEXINPUT  : std_logic_vector (3 downto 0);
   signal MUXSELECT : std_logic;
   signal XLXN_2    : std_logic;
   signal XLXN_37   : std_logic;
   signal XLXN_39   : std_logic;
   signal XLXN_76   : std_logic;
   signal XLXN_79   : std_logic;
   signal XLXN_84   : std_logic;
   signal XLXN_88   : std_logic;
   signal XLXN_91   : std_logic;
   signal XLXN_94   : std_logic;
   signal XLXN_98   : std_logic;
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
   
   component VCC
      port ( P : out   std_logic);
   end component;
   attribute BOX_TYPE of VCC : component is "BLACK_BOX";
   
   component FTC_HXILINX_SEVENSEGMENTDECODER
      generic( INIT : bit :=  '0');
      port ( C   : in    std_logic; 
             CLR : in    std_logic; 
             T   : in    std_logic; 
             Q   : out   std_logic);
   end component;
   
   component X74_157_MUSER_SEVENSEGMENTDECODER
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
   
   component GND
      port ( G : out   std_logic);
   end component;
   attribute BOX_TYPE of GND : component is "BLACK_BOX";
   
   component INV
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";
   
   attribute INIT of U1 : label is "2812";
   attribute INIT of U2 : label is "D860";
   attribute INIT of U3 : label is "D004";
   attribute INIT of U4 : label is "8692";
   attribute INIT of U5 : label is "02BA";
   attribute INIT of U6 : label is "208E";
   attribute INIT of U7 : label is "1083";
   attribute HU_SET of XLXI_10 : label is "XLXI_10_4";
begin
   U1 : ROM16X1
   -- synopsys translate_off
   generic map( INIT => x"2812")
   -- synopsys translate_on
      port map (A0=>HEXINPUT(0),
                A1=>HEXINPUT(1),
                A2=>HEXINPUT(2),
                A3=>HEXINPUT(3),
                O=>XLXN_98);
   
   U2 : ROM16X1
   -- synopsys translate_off
   generic map( INIT => x"D860")
   -- synopsys translate_on
      port map (A0=>HEXINPUT(0),
                A1=>HEXINPUT(1),
                A2=>HEXINPUT(2),
                A3=>HEXINPUT(3),
                O=>XLXN_94);
   
   U3 : ROM16X1
   -- synopsys translate_off
   generic map( INIT => x"D004")
   -- synopsys translate_on
      port map (A0=>HEXINPUT(0),
                A1=>HEXINPUT(1),
                A2=>HEXINPUT(2),
                A3=>HEXINPUT(3),
                O=>XLXN_91);
   
   U4 : ROM16X1
   -- synopsys translate_off
   generic map( INIT => x"8692")
   -- synopsys translate_on
      port map (A0=>HEXINPUT(0),
                A1=>HEXINPUT(1),
                A2=>HEXINPUT(2),
                A3=>HEXINPUT(3),
                O=>XLXN_88);
   
   U5 : ROM16X1
   -- synopsys translate_off
   generic map( INIT => x"02BA")
   -- synopsys translate_on
      port map (A0=>HEXINPUT(0),
                A1=>HEXINPUT(1),
                A2=>HEXINPUT(2),
                A3=>HEXINPUT(3),
                O=>XLXN_84);
   
   U6 : ROM16X1
   -- synopsys translate_off
   generic map( INIT => x"208E")
   -- synopsys translate_on
      port map (A0=>HEXINPUT(0),
                A1=>HEXINPUT(1),
                A2=>HEXINPUT(2),
                A3=>HEXINPUT(3),
                O=>XLXN_79);
   
   U7 : ROM16X1
   -- synopsys translate_off
   generic map( INIT => x"1083")
   -- synopsys translate_on
      port map (A0=>HEXINPUT(0),
                A1=>HEXINPUT(1),
                A2=>HEXINPUT(2),
                A3=>HEXINPUT(3),
                O=>XLXN_76);
   
   XLXI_4 : VCC
      port map (P=>XLXN_2);
   
   XLXI_10 : FTC_HXILINX_SEVENSEGMENTDECODER
      port map (C=>CLKINP,
                CLR=>XLXN_39,
                T=>XLXN_2,
                Q=>MUXSELECT);
   
   XLXI_11 : X74_157_MUSER_SEVENSEGMENTDECODER
      port map (A0=>ANUM0,
                A1=>ANUM1,
                A2=>ANUM2,
                A3=>ANUM3,
                B0=>BNUM0,
                B1=>BNUM1,
                B2=>BNUM2,
                B3=>BNUM3,
                G=>XLXN_37,
                S=>MUXSELECT,
                Y0=>HEXINPUT(0),
                Y1=>HEXINPUT(1),
                Y2=>HEXINPUT(2),
                Y3=>HEXINPUT(3));
   
   XLXI_12 : GND
      port map (G=>XLXN_39);
   
   XLXI_13 : GND
      port map (G=>XLXN_37);
   
   XLXI_23 : INV
      port map (I=>XLXN_76,
                O=>AG);
   
   XLXI_24 : INV
      port map (I=>XLXN_79,
                O=>AF);
   
   XLXI_25 : INV
      port map (I=>XLXN_84,
                O=>AE);
   
   XLXI_26 : INV
      port map (I=>XLXN_88,
                O=>AD);
   
   XLXI_27 : INV
      port map (I=>XLXN_91,
                O=>AC);
   
   XLXI_28 : INV
      port map (I=>XLXN_94,
                O=>AB);
   
   XLXI_29 : INV
      port map (I=>XLXN_98,
                O=>AA);
   
   XLXI_33 : INV
      port map (I=>MUXSELECT,
                O=>DIGSEL);
   
end BEHAVIORAL;


