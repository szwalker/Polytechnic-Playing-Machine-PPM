--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : CODEDISC.vhf
-- /___/   /\     Timestamp : 09/07/2015 13:55:41
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -intstyle ise -family spartan3e -flat -suppress -vhdl D:/work/academic/cs2204/fall2015/labs/CODEDISC/CODEDISC.vhf -w D:/work/academic/cs2204/fall2015/labs/CODEDISC/CODEDISC.sch
--Design Name: CODEDISC
--Device: spartan3e
--Purpose:
--    This vhdl netlist is translated from an ECS schematic. It can be 
--    synthesized and simulated, but it should not be modified. 
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity M2_1E_MXILINX_CODEDISC is
   port ( D0 : in    std_logic; 
          D1 : in    std_logic; 
          E  : in    std_logic; 
          S0 : in    std_logic; 
          O  : out   std_logic);
end M2_1E_MXILINX_CODEDISC;

architecture BEHAVIORAL of M2_1E_MXILINX_CODEDISC is
   attribute BOX_TYPE   : string ;
   signal M0 : std_logic;
   signal M1 : std_logic;
   component AND3
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND3 : component is "BLACK_BOX";
   
   component AND3B1
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND3B1 : component is "BLACK_BOX";
   
   component OR2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR2 : component is "BLACK_BOX";
   
begin
   I_36_30 : AND3
      port map (I0=>D1,
                I1=>E,
                I2=>S0,
                O=>M1);
   
   I_36_31 : AND3B1
      port map (I0=>S0,
                I1=>E,
                I2=>D0,
                O=>M0);
   
   I_36_38 : OR2
      port map (I0=>M1,
                I1=>M0,
                O=>O);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity X74_157_MUSER_CODEDISC is
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
end X74_157_MUSER_CODEDISC;

architecture BEHAVIORAL of X74_157_MUSER_CODEDISC is
   attribute HU_SET     : string ;
   attribute BOX_TYPE   : string ;
   signal XLXN_196 : std_logic;
   component M2_1E_MXILINX_CODEDISC
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
   XLXI_114 : M2_1E_MXILINX_CODEDISC
      port map (D0=>A0,
                D1=>B0,
                E=>XLXN_196,
                S0=>S,
                O=>Y0);
   
   XLXI_115 : M2_1E_MXILINX_CODEDISC
      port map (D0=>A1,
                D1=>B1,
                E=>XLXN_196,
                S0=>S,
                O=>Y1);
   
   XLXI_116 : M2_1E_MXILINX_CODEDISC
      port map (D0=>A2,
                D1=>B2,
                E=>XLXN_196,
                S0=>S,
                O=>Y2);
   
   XLXI_117 : M2_1E_MXILINX_CODEDISC
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

entity FD4CE_MXILINX_CODEDISC is
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
end FD4CE_MXILINX_CODEDISC;

architecture BEHAVIORAL of FD4CE_MXILINX_CODEDISC is
   attribute BOX_TYPE   : string ;
   component FDCE
      generic( INIT : bit :=  '0');
      port ( C   : in    std_logic; 
             CE  : in    std_logic; 
             CLR : in    std_logic; 
             D   : in    std_logic; 
             Q   : out   std_logic);
   end component;
   attribute BOX_TYPE of FDCE : component is "BLACK_BOX";
   
begin
   I_Q0 : FDCE
      port map (C=>C,
                CE=>CE,
                CLR=>CLR,
                D=>D0,
                Q=>Q0);
   
   I_Q1 : FDCE
      port map (C=>C,
                CE=>CE,
                CLR=>CLR,
                D=>D1,
                Q=>Q1);
   
   I_Q2 : FDCE
      port map (C=>C,
                CE=>CE,
                CLR=>CLR,
                D=>D2,
                Q=>Q2);
   
   I_Q3 : FDCE
      port map (C=>C,
                CE=>CE,
                CLR=>CLR,
                D=>D3,
                Q=>Q3);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity COMP4_MXILINX_CODEDISC is
   port ( A0 : in    std_logic; 
          A1 : in    std_logic; 
          A2 : in    std_logic; 
          A3 : in    std_logic; 
          B0 : in    std_logic; 
          B1 : in    std_logic; 
          B2 : in    std_logic; 
          B3 : in    std_logic; 
          EQ : out   std_logic);
end COMP4_MXILINX_CODEDISC;

architecture BEHAVIORAL of COMP4_MXILINX_CODEDISC is
   attribute BOX_TYPE   : string ;
   signal AB0 : std_logic;
   signal AB1 : std_logic;
   signal AB2 : std_logic;
   signal AB3 : std_logic;
   component AND4
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND4 : component is "BLACK_BOX";
   
   component XNOR2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of XNOR2 : component is "BLACK_BOX";
   
begin
   I_36_32 : AND4
      port map (I0=>AB3,
                I1=>AB2,
                I2=>AB1,
                I3=>AB0,
                O=>EQ);
   
   I_36_33 : XNOR2
      port map (I0=>B2,
                I1=>A2,
                O=>AB2);
   
   I_36_34 : XNOR2
      port map (I0=>B3,
                I1=>A3,
                O=>AB3);
   
   I_36_42 : XNOR2
      port map (I0=>B1,
                I1=>A1,
                O=>AB1);
   
   I_36_43 : XNOR2
      port map (I0=>B0,
                I1=>A0,
                O=>AB0);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity CODEDISC is
   port ( BRWD0          : in    std_logic; 
          BRWD1          : in    std_logic; 
          BRWD2          : in    std_logic; 
          BRWD3          : in    std_logic; 
          CLEAR          : in    std_logic; 
          CLEARP2FFS     : in    std_logic; 
          CODERWD        : in    std_logic_vector (3 to 7); 
          ENCPOSN0       : in    std_logic; 
          ENCPOSN1       : in    std_logic; 
          PSEL0          : in    std_logic; 
          PSEL1          : in    std_logic; 
          P2CLK          : in    std_logic; 
          STDIGEQCD      : in    std_logic; 
          SYSCLK         : in    std_logic; 
          TESTADD        : in    std_logic; 
          TESTP2SEL0     : in    std_logic; 
          TESTP2SEL1     : in    std_logic; 
          BRWDEQCD       : out   std_logic; 
          CODEKNOWN      : out   std_logic; 
          DIGEQCD        : out   std_logic; 
          DIGEQCDADD     : out   std_logic; 
          DIGEQCDPOSSEL0 : out   std_logic; 
          P2CODE0        : out   std_logic; 
          P2CODE1        : out   std_logic; 
          P2CODE2        : out   std_logic; 
          P2CODE3        : out   std_logic; 
          P2CODE4        : out   std_logic; 
          P2CODE5        : out   std_logic; 
          P2CODE6        : out   std_logic; 
          P2CODE7        : out   std_logic; 
          P2SELCD0       : out   std_logic; 
          P2SELCD1       : out   std_logic; 
          P2SELCD2       : out   std_logic; 
          P2SELCD3       : out   std_logic);
end CODEDISC;

architecture BEHAVIORAL of CODEDISC is
   attribute BOX_TYPE   : string ;
   attribute HU_SET     : string ;
   signal CODEPOS0       : std_logic;
   signal CODEPOS1       : std_logic;
   signal DUMMY_2        : std_logic;
   signal STCODE0        : std_logic;
   signal STCODE1        : std_logic;
   signal XLXN_2168      : std_logic;
   signal XLXN_2174      : std_logic;
   signal XLXN_2175      : std_logic;
   signal P2CODE0_DUMMY  : std_logic;
   signal P2CODE1_DUMMY  : std_logic;
   signal P2CODE2_DUMMY  : std_logic;
   signal P2CODE3_DUMMY  : std_logic;
   signal P2CODE4_DUMMY  : std_logic;
   signal P2CODE5_DUMMY  : std_logic;
   signal P2CODE6_DUMMY  : std_logic;
   signal P2CODE7_DUMMY  : std_logic;
   signal DIGEQCD_DUMMY  : std_logic;
   signal P2SELCD0_DUMMY : std_logic;
   signal P2SELCD1_DUMMY : std_logic;
   signal P2SELCD2_DUMMY : std_logic;
   signal P2SELCD3_DUMMY : std_logic;
   component OR5
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             I4 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR5 : component is "BLACK_BOX";
   
   component AND2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2 : component is "BLACK_BOX";
   
   component FD4CE_MXILINX_CODEDISC
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
   
   component OR4
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR4 : component is "BLACK_BOX";
   
   component OR2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR2 : component is "BLACK_BOX";
   
   component COMP4_MXILINX_CODEDISC
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
   
   component GND
      port ( G : out   std_logic);
   end component;
   attribute BOX_TYPE of GND : component is "BLACK_BOX";
   
   component X74_157_MUSER_CODEDISC
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
   
   attribute HU_SET of U213 : label is "U213_5";
   attribute HU_SET of U215 : label is "U215_4";
   attribute HU_SET of U221 : label is "U221_6";
   attribute HU_SET of U222 : label is "U222_7";
begin
   DIGEQCD <= DIGEQCD_DUMMY;
   P2CODE0 <= P2CODE0_DUMMY;
   P2CODE1 <= P2CODE1_DUMMY;
   P2CODE2 <= P2CODE2_DUMMY;
   P2CODE3 <= P2CODE3_DUMMY;
   P2CODE4 <= P2CODE4_DUMMY;
   P2CODE5 <= P2CODE5_DUMMY;
   P2CODE6 <= P2CODE6_DUMMY;
   P2CODE7 <= P2CODE7_DUMMY;
   P2SELCD0 <= P2SELCD0_DUMMY;
   P2SELCD1 <= P2SELCD1_DUMMY;
   P2SELCD2 <= P2SELCD2_DUMMY;
   P2SELCD3 <= P2SELCD3_DUMMY;
   U210 : OR5
      port map (I0=>CODERWD(7),
                I1=>CODERWD(6),
                I2=>CODERWD(5),
                I3=>CODERWD(4),
                I4=>CODERWD(3),
                O=>DUMMY_2);
   
   U211 : AND2
      port map (I0=>PSEL0,
                I1=>DUMMY_2,
                O=>STCODE0);
   
   U212 : AND2
      port map (I0=>DUMMY_2,
                I1=>PSEL1,
                O=>STCODE1);
   
   U213 : FD4CE_MXILINX_CODEDISC
      port map (C=>SYSCLK,
                CE=>STCODE0,
                CLR=>CLEAR,
                D0=>BRWD0,
                D1=>BRWD1,
                D2=>BRWD2,
                D3=>BRWD3,
                Q0=>P2CODE0_DUMMY,
                Q1=>P2CODE1_DUMMY,
                Q2=>P2CODE2_DUMMY,
                Q3=>P2CODE3_DUMMY);
   
   U214 : OR4
      port map (I0=>P2CODE3_DUMMY,
                I1=>P2CODE2_DUMMY,
                I2=>P2CODE1_DUMMY,
                I3=>P2CODE0_DUMMY,
                O=>CODEPOS0);
   
   U215 : FD4CE_MXILINX_CODEDISC
      port map (C=>SYSCLK,
                CE=>STCODE1,
                CLR=>CLEAR,
                D0=>BRWD0,
                D1=>BRWD1,
                D2=>BRWD2,
                D3=>BRWD3,
                Q0=>P2CODE4_DUMMY,
                Q1=>P2CODE5_DUMMY,
                Q2=>P2CODE6_DUMMY,
                Q3=>P2CODE7_DUMMY);
   
   U216 : OR4
      port map (I0=>P2CODE7_DUMMY,
                I1=>P2CODE6_DUMMY,
                I2=>P2CODE5_DUMMY,
                I3=>P2CODE4_DUMMY,
                O=>CODEPOS1);
   
   U217 : AND2
      port map (I0=>TESTP2SEL0,
                I1=>CODEPOS0,
                O=>XLXN_2174);
   
   U218 : AND2
      port map (I0=>TESTP2SEL1,
                I1=>CODEPOS1,
                O=>XLXN_2175);
   
   U219 : OR2
      port map (I0=>XLXN_2175,
                I1=>XLXN_2174,
                O=>CODEKNOWN);
   
   U221 : COMP4_MXILINX_CODEDISC
      port map (A0=>BRWD0,
                A1=>BRWD1,
                A2=>BRWD2,
                A3=>BRWD3,
                B0=>P2SELCD0_DUMMY,
                B1=>P2SELCD1_DUMMY,
                B2=>P2SELCD2_DUMMY,
                B3=>P2SELCD3_DUMMY,
                EQ=>DIGEQCD_DUMMY);
   
   U222 : FD4CE_MXILINX_CODEDISC
      port map (C=>P2CLK,
                CE=>STDIGEQCD,
                CLR=>CLEARP2FFS,
                D0=>ENCPOSN0,
                D1=>TESTADD,
                D2=>DIGEQCD_DUMMY,
                D3=>XLXN_2168,
                Q0=>DIGEQCDPOSSEL0,
                Q1=>DIGEQCDADD,
                Q2=>BRWDEQCD,
                Q3=>open);
   
   XLXI_61 : GND
      port map (G=>XLXN_2168);
   
   XLXI_62 : X74_157_MUSER_CODEDISC
      port map (A0=>P2CODE0_DUMMY,
                A1=>P2CODE1_DUMMY,
                A2=>P2CODE2_DUMMY,
                A3=>P2CODE3_DUMMY,
                B0=>P2CODE4_DUMMY,
                B1=>P2CODE5_DUMMY,
                B2=>P2CODE6_DUMMY,
                B3=>P2CODE7_DUMMY,
                G=>ENCPOSN1,
                S=>ENCPOSN0,
                Y0=>P2SELCD0_DUMMY,
                Y1=>P2SELCD1_DUMMY,
                Y2=>P2SELCD2_DUMMY,
                Y3=>P2SELCD3_DUMMY);
   
end BEHAVIORAL;


