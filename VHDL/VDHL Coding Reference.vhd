-- VHDL Coding Reference

------------------------------------------------------------------------------------------------------------------------------------
-- GENERAL INFORMATION:

-- VHSIC = Very High Speed Integrated Circuit
-- VHDL = VHSIC Hardware Description Language

-- The original purpose of VHDL was to document complex digital systems ; simulation came quickly ; synthesis came later

-- VHDL requires and Entity and an Architecture to create a logic block
	-- An Entity is the I/O configuration, the external interface, the ports ; only 1 exists per logic block
	-- An Architecture describes the internal behavior of the logic block ; many can exist per logic block

-- VHDL is a very strongly typed programming language ; no nonsense
	-- Names must start with a letter
	-- Names cannot have two underscores in a row (__) or end with a single underscore
	-- Names cannot be keywords

-- In general, lowercase operators and keywords are from the default VHDL library
	-- uppercase ones come from the IEEE 1164 standard library

------------------------------------------------------------------------------------------------------------------------------------
-- BOOLEAN OPERATORS & KEYWORDS:

-- for boolean operations
and
or
not
nand
nor
xor
xnor

-- for variable assignment delays
after
transport

-- for defining enumerations
type
subtype
is
array
range
natural

-- 
begin
end

-- creating entities
entity 
	in
	out
	buffer
	inout
	port
	map
	generic

-- creating architectures
architecture 
	of
	type
	signal
	constant
	function
	procedure
	component
	process

-- for Bit_Vector
to
downto

-- importing libraries
use
	all
	library
	package
	body

-- for "if" statement structure
if
then
else
elsif
end if

-- for loop statement structure
for
loop
generate

-- for "case" statement structure
case
when

-- for assertions and reporting
assert
report
severity

-- misc blue
true
false
sign
natural
exp
finish
positive

-- misc red
wait
with
select
others
return
variable

------------------------------------------------------------------------------------------------------------------------------------
-- DATATYPES:

Boolean -- not 0s & 1s
	true
	false
Character -- denoted with single quotes
	'a'
	'0'
	'+'
	'v'
Integer -- 32 bit range ; -2,147,483,647 ~ +2,147,483,647
	1
	12
	132
Real -- ranges from -1.0E308 ~ +1.0E308
	0.1
	1.2
	3.14
Bit -- 0s & 1s
	'0'
	'1'
Bit_Vector -- vector/string of bits
	"100100100011"
	(0 to 7)
	(7 downto 0)
String -- denoted with double quotes
	"hello"
	"world"
Time
	fs -- femtoseconds ; 10E-15
	ps -- picoseconds ; 10E-12
	ns -- nanosecons ; 10E-9
	us -- microseconds ; 10E-6
	ms -- milliseconds ; 10E-3
	sec -- seconds ; 10E+0
	min -- minutes
	hr -- hours
Severity_Level
Enumeration -- special case ; use the "type" keyword ; 
	type enum_name is (item_1, item_2, ...);
STD_LOGIC -- similar to the "Bit" datatype ; multi-logic
	'U' -- uninitialized
	'X' -- forcing unknown
	'0' -- forcing '0' ; strong low
	'1' -- forcing '1' ; strong high
	'Z' -- forcing 'Z' ; high impedence ; open circuit
	'W' -- weak unknown
	'L' -- weak low
	'H' -- weak high
	'-' -- dont care
STD_LOGIC_VECTOR -- similar to the "Bit_Vector" datatype
	"UXXZ01001-WLH-10"

------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLE ASSIGNMENT OPERATORS:

:= -- used for signals and variables ; happens immediately
<= -- used for signals only ; happens at next Δ (delta) time ; result on the left, signal(s) on the right
=>

-- Examples:
A := 5;
B <= not A;

B <= not A after t ns; -- Intertial Delay (Gate Delay) ; doesnt propagate if < t
B <= transport not A after t_delay; -- Transport Delay ; propagates though system

------------------------------------------------------------------------------------------------------------------------------------
-- NUMERICAL OPERATORS:

+ -- addition
- -- subraction
* -- multiplication
/ -- division
** -- exponentiation
mod -- modulus
rem -- remainder
abs -- absolute value

------------------------------------------------------------------------------------------------------------------------------------
-- RELATIONAL OPERATORS:

= -- is equal to
/= -- is not equal to
< -- is less than
<= -- is less than or equal to
> -- is greater than
>= -- is greater than or equal to

|

------------------------------------------------------------------------------------------------------------------------------------
-- COMMANDS & MISC OPERATORS:

sll -- shift left logical (fills in with '0')
srl -- shift right logical (fills in with '0')
sla -- shift left arithmetic (fills in with LSB)
sra -- shift right arithmetic (fills in with MSB)
rol -- rotate left
ror -- rotate right

& -- concatenation ; order is perserved

------------------------------------------------------------------------------------------------------------------------------------
-- CREATING ENTITIES AND ARCHITECTURES:

-- For Entities:
	-- "entity_name" is the same as text file
	-- "signal_name" is user selected
	-- "signal_mode" is ("in", "out", "buffer", or "inout")
	-- "signal_type" is a datatype
entity entity_name is
	port (signal_name : singal_mode signal_type;
				signal_name : singal_mode signal_type;
				signal_name : singal_mode signal_type);
end entity entity_name; -- entity_name


-- For Architectures:
	-- Define type(s), signal(s), constant(s), function(s), procedure(s), and/or component(s)
	-- Then use the the definitions to describe the behavior or structure of an entity
architecture architecture_name of entity_name is
	type...
	signal...
	constant...
	function...
	procedure...
	component...
begin
	-- ...behavior or structure of entity_name
end architecture architecture_name; -- architecture_name

------------------------------------------------------------------------------------------------------------------------------------
-- CREATING OTHER STRUCTURES

-- For "if" statements:
if condition then return something;
elsif expression then return something_else;
else return something_else_else;
end if;


-- For "case" statements
case(signal_name) is
	when IDLE => null;
	when others => result;
end case;


-- For "for loop" statements
identifier : for i in start to final loop
	do_something
end loop ; -- identifier


-- For "component" statements
	-- Like Entities but without the "is" keyword
component component_name
	port( signal_name : signal_mode signal_type;
		    signal_name : signal_mode signal_type);
end component;


-- For "generate" statements
label : for identifier in range generate
	component instantiation
end generate


-- For "generic" statements
	-- Declared inside Entities
generic (GEN_NAME : gen_data_type := init_val);


-- For "constnant" statements
	-- Declared inside Architectures
constant (const_name : const_data_type := init_val);


-- For "conditional" signal assignments
identifier <= value_true when condition else value_false;


-- For "truth table" statements 
with expression select
	thing <= value when something,
	...,
	value <= value when something;

------------------------------------------------------------------------------------------------------------------------------------
-- STRUCTURE EXAMPLES


-- Creating a vector
data_bus_1 : in Bit_Vector(bus_max downto 4) -- MSB first
data_bus_2 : in Bit_Vector(3 downto 0)
data_bus_3 : out STD_LOGIC_VECTOR(0 to bus_max) -- LSB first
variable explicit_vector : STD_LOGIC_VECTOR(7 downto 0) := ('1','0','X','W','0','1','0','Z');
	-- Using vector concatentation
	new_data_bus <= ( data_bus_1 & data_bus_2 )


-- Creating a string
message : String (0 to 19) := "Lexxeous is awesome!"


-- Creating an Enumeration
type Colors is (Red, Yellow, Green); -- double quotes not necessary


















