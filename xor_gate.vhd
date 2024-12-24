Library ieee;
Use ieee.std_logic_1164.all;
Use ieee.std_logic_unsigned.all;

Entity xor_gate is
port(	
		A		:	in	std_logic;
        B     :   in  std_logic;
        Sout    :   out std_logic
);
End;

Architecture behavior of xor_gate is

Begin
	
-- or gate logic
	Sout <= A xor B;

End;
