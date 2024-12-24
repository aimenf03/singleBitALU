--AND_GATE

Library ieee;
Use ieee.std_logic_1164.all;
Use ieee.std_logic_unsigned.all;

Entity and_gate is
port(	
		A		:	in	std_logic;
		B		:	in	std_logic;
		Sout	:	out	std_logic
);
End;

Architecture behavior of and_gate is

Begin
	
-- and gate logic
	Sout <= A and B;

End;
