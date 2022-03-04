----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:14:51 05/13/2021 
-- Design Name: 
-- Module Name:    RegisterFile - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.NUMERIC_STD.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity RegisterFile is
  Port ( ReadData1 : out  STD_LOGIC_VECTOR (31 downto 0);
           ReadData2 : out  STD_LOGIC_VECTOR (31 downto 0);
           rs : in  STD_LOGIC_VECTOR (4 downto 0);
           rt : in  STD_LOGIC_VECTOR (4 downto 0);
           rd : in  STD_LOGIC_VECTOR (4 downto 0);
           WriteData : in  STD_LOGIC_VECTOR (31 downto 0);
			  RegWrite : in STD_LOGIC;
			  CLK: in STD_LOGIC);
end RegisterFile;

architecture Behavioral of RegisterFile is


type Register_File is array(0 to 31) of STD_LOGIC_VECTOR (31 downto 0);
signal reg: Register_File:=
(x"00000000",x"00000001",x"00000002",x"00000003",x"00000004",x"00000005",x"00000006",x"00000007",x"00000008",
 x"00000008",x"00000010",x"00000011",x"00000012",x"00000013",x"00000014",x"00000015",x"00000016",
 x"00000017",x"00000018",x"00000019",x"00000020",x"00000021",x"00000022",x"00000023",x"00000024",
 x"00000025",x"00000026",x"00000027",x"00000028",x"00000029",x"00000030",x"00000031");

begin
process(CLK,RegWrite)
begin

ReadData1 <= reg(to_integer(unsigned(rs)));
ReadData2  <= reg(to_integer(unsigned(rt)));

if( RegWrite <= '1' and rising_edge(CLk) )
 then reg(to_integer(unsigned(rd))) <= WriteData; 
end if;
end process;
end Behavioral;


