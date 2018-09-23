// Verilog Coding Reference

// ------------------------------------------------------------------------------------------------------------------------------------
// GENERAL INFORMATION:

// Verilog was introduced around the same time as VHDL in 1984 by Gateway Design Automation as proprietary software.
// IEEE created a standard for it (IEEE 1364) in 1995.

// It is widely accepted to only include 1 module per file ; makes projects more distinct and easier to keep track of


// ------------------------------------------------------------------------------------------------------------------------------------
// BOOLEAN OPERATORS & KEYWORDS:

~ // NOT
& // AND
| // OR
^ // XOR
^~ // XNOR

not
and
nand
or
nor
xor
xnor
buf


bufif0
bufif1
notif0
notif1


// Net types
wire
tri
triand
trior
tri0
tri1
trireg
wand
wor
supply0
supply1


tran
reg

// ------------------------------------------------------------------------------------------------------------------------------------
// DATATYPES:

integer


// ------------------------------------------------------------------------------------------------------------------------------------
// VARIABLE ASSIGNMENT OPERATORS:

=


// ------------------------------------------------------------------------------------------------------------------------------------
// NUMERICAL OPERATORS:

+
-
*
/
%


// ------------------------------------------------------------------------------------------------------------------------------------
// RELATIONAL OPERATORS:

>
>=
<
<=

// ------------------------------------------------------------------------------------------------------------------------------------
// LOGICAL OPERATORS:

&&
||
!
==
!=

<<
>>

// ------------------------------------------------------------------------------------------------------------------------------------
// COMMANDS & MISC OPERATORS:


// ------------------------------------------------------------------------------------------------------------------------------------
// CREATING MODULES:

module module_name(port_1, port_2, port_3, ...);
	input port_1, port_2;
	output port_3;
	inout ...;
	net ...;
	variable ...;
	parameter ...;
	function ...;
	task ...;

	assign port_expression;
endmodule


// ------------------------------------------------------------------------------------------------------------------------------------
// CREATING OTHER STRUCTURES

logical_expression ? true_expression : false_expression



















