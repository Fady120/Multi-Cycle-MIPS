----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:35:44 05/13/2021 
-- Design Name: 
-- Module Name:    PC - Behavioral 
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

entity PC is
     Port ( input : in  STD_LOGIC_VECTOR (31 downto 0);
           output : out  STD_LOGIC_VECTOR (31 downto 0);
           sig : in  STD_LOGIC;
			  CLK : in STD_LOGIC);
end PC;

architecture Behavioral of PC is

begin

process(input, sig, CLK)
begin

if rising_edge(CLK) and sig='1' 
then
output<=input;

end if;
end process;

end Behavioral;

