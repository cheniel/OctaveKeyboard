----------------------------------------------------------------------------------
-- Company: ENGS031 14X
-- Engineer: Vivian Hu and Daniel Chen
-- 
-- Create Date:    14:29:30 08/11/2014 
-- Design Name: Octave Keyboard
-- Module Name:    DDS - Behavioral 
-- Project Name: Octive Keyboard
-- Target Devices: Spartan 6
-- Tool versions: 
-- Description: Direct Digital Synthesis
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity DDS is
	 Generic (	ACCUMSIZE	: integer := 24;
					INDEXSIZE	: integer := 10;
					CLKFREQ 		: integer := 100000000);
					
    Port ( 	clk 		: in  STD_LOGIC;
				step		: in	STD_LOGIC_VECTOR(ACCUMSIZE-1 downto 0);
				phase		: out	STD_LOGIC_VECTOR(INDEXSIZE-1 downto 0));
end DDS;

architecture Behavioral of DDS is
	signal curr_phase : unsigned(ACCUMSIZE-1 downto 0) := (others => '0');
begin

	AccumPhase: process(clk)
	begin
		if (rising_edge(clk)) then
			curr_phase <= curr_phase + unsigned(step);
		end if;
	end process AccumPhase;
	
	phase <= std_logic_vector(curr_phase(ACCUMSIZE-1 downto ACCUMSIZE-INDEXSIZE));

end Behavioral;

