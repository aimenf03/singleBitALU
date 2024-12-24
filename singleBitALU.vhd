library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity singleBitALU is
  Port (
       A        : in std_logic;
       B        : in std_logic;
       Cin      : in std_logic;
       SB       : in std_logic;
       sel      : in std_logic_vector(2 downto 0);
       ALU_OUT  : out std_logic;
       Cout     : out std_logic;
       Zero     : out std_logic
        );
end singleBitALU;

architecture behavior of singleBitALU is
   component ALU
       port (
           A        : in std_logic;
           B        : in std_logic; 
           Cin      : in std_logic;
           SB       : in std_logic;
           sel      : in std_logic_vector(2 downto 0);
           ALU_OUT  : out std_logic;
           Cout     : out std_logic
       );
   end component;
   
   component full_adder
       port(    
           A    :     in    std_logic;
           B    :     in    std_logic;
           Cin  :     in    std_logic;
           Sout :     out   std_logic;
           Cout :     out   std_logic
           );
       end component;
       
   component MUX81
       port(    
               Input1        :    in    std_logic;
               Input2        :    in    std_logic;
               Input3        :    in    std_logic;
               Input4        :    in    std_logic;
               Input5        :    in    std_logic;
               Input6        :    in    std_logic;
               Input7        :    in    std_logic;
               Input8        :    in    std_logic;
               sel           :    in    std_logic_vector(2 downto 0);
               ALU_OUT       :    out   std_logic
               );
       end component;
       
   component and_gate
       port(    
           A        :    in    std_logic;
           B        :    in    std_logic;
           Sout     :    out    std_logic
           );
       end component;    
       
   component or_gate
       port(
           A        :    in    std_logic;
           B        :    in    std_logic;
           Sout     :    out    std_logic
            );
       end component;
       
   component xor_gate
       port(
            A        :    in    std_logic;
            B        :    in    std_logic;
            Sout     :    out   std_logic
            );
       end component;
   
   signal Sout_full_adder: std_logic;
   signal Sout_or_gate: std_logic;
   signal Sout_and_gate: std_logic;
   signal Sout_xor_gate: std_logic;
   signal NB: std_logic;   

begin

    NB <= B xor sel(0);
    
    C1: full_adder port map (
        A => A,
        B => NB,
        Cin => Cin,
        Sout => Sout_full_adder,
        Cout => Cout
    );

    C2: and_gate port map (
        A => A,
        B => B,
        Sout => Sout_and_gate
    );

    C3: or_gate port map (
        A => A,
        B => B,
        Sout => Sout_or_gate
    );

    C4: xor_gate port map (
        A => A,
        B => B,
        Sout => Sout_xor_gate
    );
    
        br_if_eq: process(A, B, sel)
        begin
           if (sel = "111") then
              if (A = B) then
                 Zero <= '1';
          else
             Zero <= '0';
          end if;
       elsif (sel = "110") then
          if (A < B) then
             Zero <= '1';
          else
             Zero <= '0';
          end if;
        
       end if;
    end process br_if_eq;

End;
