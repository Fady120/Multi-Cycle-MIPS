----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:33:13 05/13/2021 
-- Design Name: 
-- Module Name:    REG_MAIN - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity REG_MAIN is
 Port ( input : in  STD_LOGIC_VECTOR (31 downto 0);
           output : out  STD_LOGIC_VECTOR (31 downto 0);
           CLK : in  STD_LOGIC);
end REG_MAIN;

architecture Behavioral of REG_MAIN is

begin

process(input,CLK)
begin

if rising_edge(CLK) then
output<=input;

end if;
end process;

end Behavioral;



