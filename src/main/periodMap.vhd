----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    02:37:35 10/24/2015 
-- Design Name: 
-- Module Name:    periodMap - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;


entity periodMap is
    Port ( clk : in STD_LOGIC;
	        key : in  STD_LOGIC_VECTOR (31 downto 0);
           sig : out  STD_LOGIC_VECTOR (7 downto 0));
end periodMap;

architecture Behavioral of periodMap is

  component voiceSynth
  port ( clk : in  STD_LOGIC;
         enable : in STD_LOGIC;
			period : in  unsigned (15 downto 0);
         sig    : out  STD_LOGIC_VECTOR (7 downto 0));
  end component;
  
type vectorPeriod is array (natural range <>) of unsigned(15 downto 0);
constant keyPeriodMap : vectorPeriod(0 to 31) := (
to_unsigned(17896, 16),
to_unsigned(16892, 16),
to_unsigned(15944, 16),
to_unsigned(15049, 16),
to_unsigned(14204, 16),
to_unsigned(13407, 16),
to_unsigned(12654, 16),
to_unsigned(11944, 16),
to_unsigned(11274, 16),
to_unsigned(10641, 16),
to_unsigned(10044, 16),
to_unsigned(9480, 16),
to_unsigned(8948, 16),
to_unsigned(8446, 16),
to_unsigned(7972, 16),
to_unsigned(7524, 16),
to_unsigned(7102, 16),
to_unsigned(6703, 16),
to_unsigned(6327, 16),
to_unsigned(5972, 16),
to_unsigned(5637, 16),
to_unsigned(5320, 16),
to_unsigned(5022, 16),
to_unsigned(4740, 16),
to_unsigned(4474, 16),
to_unsigned(4223, 16),
to_unsigned(3986, 16),
to_unsigned(3762, 16),
to_unsigned(3551, 16),
to_unsigned(3351, 16),
to_unsigned(3163, 16),
to_unsigned(2986, 16)
);

type vectorSignal is array (natural range <>) of std_logic_vector(7  downto 0);
signal   signalMap : vectorSignal(31 downto 0);
signal   sigOut    : std_logic_vector(12 downto 0);
begin
  GEN_REG: 
    for I in 0 to 31 generate
		voiceSynthInstance: voiceSynth  port map (
			clk => clk,
			enable => key(I),
			period => keyPeriodMap(I),
			sig => signalMap(I)
		);
    end generate GEN_REG;
	
  sigOut <= std_logic_vector(
    resize(unsigned(signalMap(0)),13)+
  resize(unsigned(signalMap(1)),13)+
  resize(unsigned(signalMap(2)),13)+
  resize(unsigned(signalMap(3)),13)+
  resize(unsigned(signalMap(4)),13)+
  resize(unsigned(signalMap(5)),13)+
  resize(unsigned(signalMap(6)),13)+
  resize(unsigned(signalMap(7)),13)+
  resize(unsigned(signalMap(8)),13)+
  resize(unsigned(signalMap(9)),13)+
  resize(unsigned(signalMap(10)),13)+
  resize(unsigned(signalMap(11)),13)+
  resize(unsigned(signalMap(12)),13)+
  resize(unsigned(signalMap(13)),13)+
  resize(unsigned(signalMap(14)),13)+
  resize(unsigned(signalMap(15)),13)+
  resize(unsigned(signalMap(16)),13)+
  resize(unsigned(signalMap(17)),13)+
  resize(unsigned(signalMap(18)),13)+
  resize(unsigned(signalMap(19)),13)+
  resize(unsigned(signalMap(20)),13)+
  resize(unsigned(signalMap(21)),13)+
  resize(unsigned(signalMap(22)),13)+
  resize(unsigned(signalMap(23)),13)+
  resize(unsigned(signalMap(24)),13)+
  resize(unsigned(signalMap(25)),13)+
  resize(unsigned(signalMap(26)),13)+
  resize(unsigned(signalMap(27)),13)+
  resize(unsigned(signalMap(28)),13)+
  resize(unsigned(signalMap(29)),13)+
  resize(unsigned(signalMap(30)),13)+
  resize(unsigned(signalMap(31)),13));

  sig <= sigOut(12 downto 5);

end Behavioral;

