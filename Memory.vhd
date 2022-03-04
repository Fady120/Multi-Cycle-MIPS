----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:47:50 05/13/2021 
-- Design Name: 
-- Module Name:    Memory - Behavioral 
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

entity Memory is
    Port ( memwrite : in  STD_LOGIC;
           memread : in  STD_LOGIC;
           Wdata : in  STD_LOGIC_VECTOR (31 downto 0);
           Rdata : out  STD_LOGIC_VECTOR (31 downto 0);
           address : in  STD_LOGIC_VECTOR (31 downto 0);
			  IorD: in  STD_LOGIC;
           CLK : in  STD_LOGIC);
end Memory;

architecture Behavioral of Memory is
type Memory_array is  array ( 0 to 63) of STD_LOGIC_VECTOR(7 downto 0);
signal mem2: Memory_array;
signal mem : Memory_array := ( X"20",X"08",X"00",X"0A",X"20",X"09",X"00",X"06",
						  X"20",X"0A",X"00",X"06",X"01",X"09",X"58",X"20",
						  X"AD",X"0B",X"00",X"00",X"11",X"2A",X"00",X"01",
						  X"8D",X"0C",X"00",X"00",X"8D",X"0D",X"00",X"00",
						  X"11",X"09",X"00",X"02",X"01",X"09",X"70",X"24",
						  X"01",X"09",X"78",X"25",X"01",X"09",X"80",X"22",
						  X"01",X"09",X"88",X"2A",X"01",X"28",X"90",X"2A",
						  X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00");

begin

process(Wdata, address, memread, memwrite, CLK, IorD)

begin
--if instruction
if(memread='1' and memwrite='0' and IorD='0') then
Rdata(31 downto 24)<=mem(conv_integer(address));
Rdata(23 downto 16)<=mem(conv_integer(address)+1);
Rdata(15 downto 8)<=mem(conv_integer(address)+2);
Rdata(7 downto 0)<=mem(conv_integer(address)+3);
--if read and data
elsif(memread='1' and memwrite='0' and IorD='1') then
Rdata(31 downto 24)<=mem2(conv_integer(address));
Rdata(23 downto 16)<=mem2(conv_integer(address)+1);
Rdata(15 downto 8)<=mem2(conv_integer(address)+2);
Rdata(7 downto 0)<=mem2(conv_integer(address)+3);
--if write and data, write in array mem2.
elsif(memread='0' and memwrite='1' and rising_edge(CLK) and IorD='1') then
mem2(conv_integer(address))<=Wdata(31 downto 24);
mem2(conv_integer(address)+1)<=Wdata(23 downto 16);
mem2(conv_integer(address)+2)<=Wdata(15 downto 8);
mem2(conv_integer(address)+3)<=Wdata(7 downto 0);
end if;
end process;

end Behavioral;
