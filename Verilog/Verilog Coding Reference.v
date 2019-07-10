// Verilog Coding Reference

// ------------------------------------------------------------------------------------------------------------------------------------
// GENERAL INFORMATION:

// Verilog was introduced around the same time as VHDL in 1984 by Gateway Design Automation as proprietary software.
// IEEE created a standard for it (IEEE 1364) in 1995.

// It is widely accepted to only include 1 module per file ; makes projects more distinct and easier to keep track of

// Verilog is case-sensitive and all keywords are lowercase.

// Semi-colons (;) are used for line terminators.

/*
	Slashes and stars are used for block comments, just like in C/C++
*/


// ------------------------------------------------------------------------------------------------------------------------------------
// BOOLEAN OPERATORS & KEYWORDS:

~ // Bitwise NOT
& // Bitwise AND
~& // Bitwise NAND
| // Bitwise OR
~| // Bitwise OR
^ // Bitwise XOR
^~ // Bitwise XNOR
~^ // Bitwise XNOR

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

instance

parameter // initialized value able to be overwritten
localparam // local module constant unable to be overwritten
begin
end
$display
$finish


// ------------------------------------------------------------------------------------------------------------------------------------
// DATATYPES:

// Net Datatypes
	// represents physical interconnects between structures (activity flows)
wire // standard binary-state node or connection, default if no type is specified
tri // tri-state node or connection
triand
trior
tri0
tri1
trireg
wand
wor
supply0 // logic 0
supply1 // logic 1


tran



// Variable Datatypes
	// represent elements to temporarily store data
	// can only be assigned within a procedure, task, or function
	// not supported for "inout" ports
reg[MSB:LSB] // unsigned variable of any bit size
reg signed // signed variable of any bit size
integer // signed 32-bit variable
real 
time
realtime // no synthesis support, just for timing/simulation purposes


// ------------------------------------------------------------------------------------------------------------------------------------
// NUMBER VALUES:
	// <width>'<base_format> <value>
	// no specified <base_format> defaults to decimal
	// no specified <width> defaults to 32 bits


1 // decimal 1
1000 // decimal 1000


16'd255 // Decimal ('d or 'D) ; 16-bit wide decimal number (decimal 255)
8'h9A // Hexidecimal ('h or 'H) ; 8-bit wide hexidecimal number (decimal 154)
'b0101 // Binary ('b or 'B) ; 32-bit wide binary number (decimal 5)
'o21 // Octal ('o or 'O) ; 32-bit wide octal number (decimal 17)
16'shFA // Signed ('s or 'S) 16-bit signed hexidecimal number (decimal -6)


-8'd3 // 8-bit negative decimal number 3 stored as 2s complement
32'h9A_EF_C7_B4 // 32-bit hexidecimal number with underscores for readability
12'h12X // 12-bit hexidecimal number with ('x' or 'X') as forcing unknown
1'bZ // 1-bit binary number with ('z' or 'Z') as high impedance (open)


// ------------------------------------------------------------------------------------------------------------------------------------
// VARIABLE ASSIGNMENT OPERATORS:

= // blocking assignments execute in the order that they are specified within a procedural block
	// its good practice to use blocking assignment for combinational logic
<= // non-blocking assignments allow scheduling without blocking the execution of blocking assignments inside a procedural block
	// its good practice to use non-blocking assignments for sequential logic


// ------------------------------------------------------------------------------------------------------------------------------------
// NUMERICAL OPERATORS:

+ // add
- // subtract
* // multiply
/ // divide
% // modulo
** // exponentiate


// ------------------------------------------------------------------------------------------------------------------------------------
// RELATIONAL OPERATORS:

> // greater than
>= // greater than or equal to
< // less than
<= // less than or equal to

// ------------------------------------------------------------------------------------------------------------------------------------
// LOGICAL OPERATORS:

&& // logical AND
|| // logical OR
! // logical NOT

== // equality ; only supports known values (1 and 0) ; results in unknown for any X or Z values given within the bit-string
!= // inequality ; only supports known values (1 and 0) ; results in unknown for any X or Z values given within the bit-string
=== // case equality ; supports X and Z as distinct values ; will return 1 if Xs and Zs match completely
!== // case inequality ; supports X and Z as distinct values ; will return 0 if Xs and Zs do not match completely 

<< // logical shift left
>> // logical shift right
<<< // arithmetic shift left
>>> // arithmetic shift right



// ------------------------------------------------------------------------------------------------------------------------------------
// CREATING MODULES:

module module_name(port_1, port_2, port_3, ...); // specify the module name and the port list
	input[15:0] port_1, port_2; // monodirectional input ports with width of 16 bits
	output port_3; // monodirectional output port with width of 1 bit
	inout ...; // bidirectional port
	net ...;
	variable ...;
	parameter ...;
	function ...;
	task ...;

	assign port_expression;
endmodule


module module_name // alternate way of creating module by combining the port types and list declarations
	#(parameter size=8)
	(
		input[15:0] port_1, port_2; // monodirectional input ports with width of 16 bits
		output port_3; // monodirectional output port with width of 1 bit
		inout ...; // bidirectional port
	);
endmodule



// ------------------------------------------------------------------------------------------------------------------------------------
// LOWER LEVEL HARDWARE COMPONENT INSTANTIATION:

<component_name> #<delay> <instance_name> (port_list); // generic format
mux_2_input #<delay> m2i_1 (x, y, z); // ordered port format
mux_2_input #<delay> m2i_2 (.sel(x), .in_1(y), .in_2(z),; // explicit/named port format
	// <component_name> is the explicit name of the lower level component
	// <delay> is an optional component delay given for timing/simulation purposes, not during synthesis
	// <instance_name> is a unique name given to the unique component instance (can have multiple instances of the same component for a design)
	// <port_list> is the list of connections to make to the component


// ------------------------------------------------------------------------------------------------------------------------------------
// PROCESSES:






// ------------------------------------------------------------------------------------------------------------------------------------
// ASSIGNMENT STATEMENTS:

// Continuous Assignment Statements model the behavior of combinational logic by using expressions and operators
	wire[15:0] adder_out = mult_out + carry_out; // implicit assignment

	wire[15:0] adder_out;
	assign adder_out = mult_out + carry_out; // explicit assignment equivilent to the above implicit assignment


	assign #5 adder_out = mult_out + carry_out // assignment statements can also be delayed by "#t" time units


// Procedural Assignments like "initial" and "always" are only used inside prodedure blocks, which start at time "t=0"
	// "Initial" assignments are used to initialize behavioral statements for simulation, only executed one time through
	// "Always" assignments are used to describe the circuit functionality using behavioral statements, execute continuously in a looping fashion
		// Both "initial" and "always" procedural blocks should be wrapped with "begin" and "end" key words


initial begin
	
end


always @(posedge clk or posedge rst) begin
	if (rst) begin
		// reset
		
	end
	else if () begin
		
	end
end


// Combinational processes
always @ (a, b, sel) // sensitivity list activates process when any of the list variables changes value
always @ * // constantly activates process

// Clocked processes are sensitive to clocks and asyncronous control signals
always (posedge clk) // process runs on the positive edge of the clock
always (negedge clk) // process runs on the negative edge of the clock


// ------------------------------------------------------------------------------------------------------------------------------------
// BEHAVIORAL STATEMENTS:


// "if" statements are evaluated from top to bottom, giving the top statements priority
if condition1
	behavioral_statement1
else condition2
	behavioral_statement2
else
	default_behavior


// "case" statements are evaluated all at once, not giving any priority, evaluating only 1 case to be true, despite order
	// "case" statements by defualt will allow for "dont care" characters (?) when evaulating bit strings
case (expression)
	condition1: 
		behavioral_statement1
	condition2:
		behavioral_statement2
	default: //optional
		default_behavior
endcase


// "casez" statements treat both Z and ? as "dont care" characters
casez (encoder)
	3'b111: count = 3;
	3'bZ11: count = 2;
	3'bZ?1: count = 1;
	3'b000: count = 0;
	defualt: count = 0;
endcase


// "casex" statements treat X, Z, and ? as "dont care" characters
casex
	3'b111: count = 3;
	3'bZ11: count = 2;
	3'bZ?1: count = 1;
	3'bXXX: count = 0;
	defualt: count = 0;
endcase


// forever loops will execute as long as the program is running and are NOT synthesizable
initial begin
	clk = 0
	forever #25 clk = ~clk;
end


// repeat loops will execute a certain finite number of times and are synthesizable
if (clear_8 = 1)
	repeat (8) begin // left shift <tmp_data> 8 times
		tmp_data << 1;
	end


// while loops assume that the internal expression is true and exit otherwise
count = 0;
while (count < 101) begin
	$display ("Count = %d", count);
	count = count + 1;
end



// for loops are very similar to C/C++ for loops, but the index value CANNOT change within the loop (this would be non-synthesizable)
	// the "++" operator does not exist...
for (i = 0; i < 10; i = i + 1)
	data[i] = temp[i-1];
end



// ------------------------------------------------------------------------------------------------------------------------------------
// FUNCTIONS AND TASKS:
	//replace repetative code and increases readability


// functions return values based on thier inputs, produces combinational logic, and are included in statements
	// functions are allowed to call other functions but not tasks
	// functions execute in 0 time
	// functions must have at least 1 input
	// functions cannot contain delays
	// functions cannot use outputs or inouts
	// functions can only return a single value or array of values
assign mult_out = mult(a_in, b_in);

// tasks are like procedures, can be combinational or registered and are invoked as whole statements
	// tasks are allowed to call tasks and other functions
	// tasks may finish in non-zero execution/simulation time
	// tasks are allowd to contain delay, timing, event, and control statements
	// tasks are allowed to have 0 or more input, output, or inout variables/signals
system_out(next, first, select, filter);
add(1,0,p);




function [15:0] mult;
	input a[7:0], b[7:0];
	reg r[15:0];
	begin
		r = a * b;
		mult = r; // the return value should have the same name and size as the function name and size
	end
endfunction


task add;
	input a, b;
	output c;
	begin
		c = a + b;
	end
endtask


// ------------------------------------------------------------------------------------------------------------------------------------
// .DO FILE(S):
	// contains script commands for ModelSim simulation steps

	vlib <lib_name> // create a library
	vlog <module_name> <tb_name>.v // compile top level module and testbench
	vsim <lib_name>.<module_name>.v // run the module simulation from a particular library
	add wave <signal> // add signal to the waveform
	run <duration> // run simulation for a particular amount of time

	do <script>.do // run in the command line



// ------------------------------------------------------------------------------------------------------------------------------------
// MISC OPERATORS:

(condition) ? true_expression : false_expression // single line if-else statement

{} // concatentate
	// a = 2'b10; b = 2'b01
	// c = {b,a} = 4'b0110

{{}} // replicate
	// b = 2'b01
	// {4{b}} = 8'b01010101






















