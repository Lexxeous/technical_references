// C Coding Reference

// ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
// COMPILER DIRECTIVES:
// "https://fresh2refresh.com/c-programming/c-preprocessor-directives/"

#ifdef // returns "true" if a macro variable/function has been defined
#ifndef // returns "true" if a macro variable/function has not been defined
#define // defines macro constant values/functions and can be any of the basic data types
#error text to display
#include <some_lib.h>
#include "header_file.h"
#undef // used to undefine a defined macro variable/function
#pragma // used to call a function before and after the "main" function, supress warnings, or initiate parallel OMP blocks
	#pragma startup function_1 // will run "function_1()" before running "main()"
	#pragma exit function_2 // will run "function_2()" before exiting "main()"
	#pragma warn – rvl // if function doesn’t return a value, such warnings are suppressed
	#pragma warn – par // if function doesn’t use passed function parameter, such warnings are suppressed 
	#pragma warn – rch // if a non-reachable code is written inside a program, such warnings are suppressed


// Examples:

#if defined OPT_1
	// do compile option 1
#elif defined OPT_2
	// do compile option 2
#else
	#error *** You must define compiler option OPT_1 or OPT_2 ***
#endif


int incomplete_or_broken_function()
{
	#error *** Function incomplete/broken. Fix before using. ***
}


#include <float.h>
#if (LDBL_DIG < 12) 
	#error *** long doubles need 12 digit resolution. \
				 Do not use this compiler! *** 
#endif


// ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
// EXTERN:
// "https://www.geeksforgeeks.org/understanding-extern-keyword-in-c/"

// Only when a function or variable is defined will it hold a place in memory

// Function declarations have a hidden "extern" keyword prepended to them
int funcName(int foo, int bar); // effectively the same as the declaration below
extern int funcName(int foo, int bar); // effectively the same as the declaration above

// Variable declarations are treated differently with the "extern" keyword
int var; // <var> has been declared & defined
int var = 0; // <var> has been declared & defined
extern int var; // <var> has ONLY been declared ; cannot be manipulated yet ; doesnt hold place in memeory
extern int var = 0; // <var> has been declared & defined


// ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
// VOLATILE:
// "https://barrgroup.com/Embedded-Systems/How-To/C-Volatile-Keyword"

/*
The volatile keyword is a qualifier that is applied to a variable when it is declared.
it tells the compiler that the value of the variable may change at any time,
without any action being taken by the code the compiler finds nearby.
*/

/*
A variable should be declared volatile whenever its value could change unexpectedly.
1. Memory-mapped peripheral registers.
2. Global variables modified by an interrupt service routine.
3. Global variables accessed by multiple tasks within a multi-threaded application.
4. Variables that can be changed asynchronously/manually, not by running code/calls.
*/

volatile uint8_t a; // declares an unsigned 8-bit integer to be a volatile integer

volatile uint16_t *p_x; // declares <p_x> to be a pointer to a volatile unsigned 16-bit integer

uint16_t *volatile p_y; // declares <p_y> to be a volatile pointer to non-volatile data (unsigned 16-bit integer data)

volatile uint16_t *volatile p_z; // declares <p_z> to be a volatile pointer to volatile data (unsigned 16-bit integer data)

/* NOTE:
If you apply volatile to a struct or union,the entire contents of the
struct or union are volatile. If you don't want this behavior,
you can apply the volatile qualifier to the individual members of the struct or union.
*/

// ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
// __attribute__:
// Attribute syntax: "https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/4/html/Using_the_GNU_Compiler_Collection/attribute-syntax.html"

/*
The keyword "__attribute__" allows you to specify special attributes when making a declaration.
This keyword is followed by an attribute specification inside double parentheses.
*/

__attribute__((<attr>))
// You can also specify attributes with "__" before and after to avoid having a conflict if/when using them in header files.


/*
Function attributes:
"https://gcc.gnu.org/onlinedocs/gcc/Function-Attributes.html"
"https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/4/html/Using_the_GNU_Compiler_Collection/function-attributes.html"
*/
// The following attributes are currently defined for functions on all targets:
((noreturn)), ((noinline)), ((always_inline)), ((pure)), ((const)), ((nothrow)), ((format)), ((format_arg)),
((no_instrument_function)), ((section)), ((constructor)), ((destructor)), ((used)), ((unused)),
((deprecated)), ((weak)), ((malloc)), ((alias)), ((warn_unused_result)) & ((nonnull))


/*
Variable attributes:
"https://gcc.gnu.org/onlinedocs/gcc/Variable-Attributes.html"
"https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/4/html/Using_the_GNU_Compiler_Collection/variable-attributes.html"
*/
// The following attributes are currently defined for variables on all targets:
((aligned (<alignment>))), ((cleanup (<cleanup_function>))), ((common)), ((nocommon)), ((depreciated)),
((mode (<mode>)), ((packed)), ((section (<section_name>))), ((shared)), ((tls_model (<tls_model>))),
((transparent_union)), ((unused)), ((vector_size (<bytes>))), ((weak)), ((dllimport)), ((dlexport))


/*
Type attributes:
"https://gcc.gnu.org/onlinedocs/gcc/Type-Attributes.html"
"https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/4/html/Using_the_GNU_Compiler_Collection/type-attributes.html"
*/
// The following attributes are currently defined for types on all targets:
((aligned (<alignment>))), ((packed)), ((transparent_union)), ((unused)),
((depreciated)), ((may_alias))



// ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
// __extension__:


// ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
// __typeof__:


// ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
// __label__:



// ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
// STRUCT:
// "https://en.wikipedia.org/wiki/Struct_(C_programming_language)"

// Struct variable members take up multiple memory spaces, the size is equal to the sum of thier parts.
// Struct variable members can all be accessed correctly simultaneously because each member is independent in memory.
// Struct variable members do not get corrupted/overwritten when manipulating another struct instance member.

typedef struct struct_datatype_tag
{
	// variable member definition;
	 ...
	// variable member definition;
} struct_alias;


// These two statements to define a new struct instance variable now have the same meaning:
struct struct_datatype_tag struct_instance_var;
struct_alias struct_instance_var;


// Struct members can be initialized implicitly (contiguously/ordered) OR explicitly (non-contiguously/unordered) OR copied
struct_alias struct_instance_var_1 = {1, ..., 26}; // implicit/contiguous/ordered
struct_alias struct_instance_var_2 = {.a = 1, .b = 2,  ..., .z = 26}; // explicit/non-contiguous/unordered
struct_alias struct_instance_var_3 = struct_instance_var_1 // copied


// Pointing to a struct can allow you to pass the struct by reference into a function or refer to another instance
// Example using a pointer to a struct
struct 2d_point
{
  int x;
  int y;
};
struct 2d_point my_point = {3, 7};
struct 2d_point *p = &my_point;  /* To declare and define 'p' as a pointer of type "struct 2d_point",
                                 and initialize it with the address of <my_point>. */

(*p).x = 4; // change the first memmber of the struct pointer instance <p> to 4
p->y = 8; // change the second member of the struct pointer instance <p> to 8


// ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
// UNION:
// "https://www.tutorialspoint.com/cprogramming/c_unions"

// Union variable members share a single memory space allocated by the largest member.
// Union variable members can only be accessed correctly one at a time.
// Union variable members get corrupted/overwritten if another member within the same union is assigned a value.


typedef union union_datatype_tag
{
   // variable member definition;
	 ...
	 // variable member definition;
} union_alias;


// Example:

union Gender
{
	char[6];
};

union Person
{
	float height; // in inches
	int age; // in years
	union Gender sex; // binary "Male" OR "Female"
};

union Person Alex_Gibson;
Alex_Gibson.height = 71.5;
Alex_Gibson.age = 23;
Alex_Gibson.sex = "Male";


// ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
// TYPEDEF:

// "typedef" allows you to give a new name to datatypes and structures
// "typedef" is limited to giving symbolic names to types only, not substitution for values
// "typedef" interpretation is performed by the compiler

typedef unsigned char BYTE; // unsigned char datatypes can now be abbreviated as "BYTE"


typedef struct Books {
   char title[50];
   char author[50];
   char subject[100];
   int book_id;
} Book;

Book SoUE1;
Book SoUE2;

strcpy(SoUE1.title, "The Bad Beginning");
strcpy(SoUE1.author, "Lemony Snicket"); 
strcpy(SoUE1.subject, "The first one in the series.");
SoUE1.book_id = 1234;

strcpy(SoUE2.title, "The Reptile Room");
strcpy(SoUE2.author, "Lemony Snicket"); 
strcpy(SoUE2.subject, "The second one in the series.");
SoUE2.book_id = 1235;


// ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
// COMPLEX NUMBERS (GNU C):

// You can use either 'i' or 'j' as the imaginary part suffix
__complex__ double x = 3+2i; // declares a complex value whos __real__ and __imag__ parts are of type "double"
__complex__ int y = 4-5j; // declares a __complex__ value whos __real__ and __imag__ parts are of type "int"

double r_x = __real__ x; // extract the __real__ part from <x> ; r_x = 3
__complex__ int i_y = __imag__ y; // extract the __imag__ part from <y> ; i_y = -5j

// Use the '~' operator to perform a complex conjugate of a complex value
__complex__ double conj_x = ~x; // conj_x = 3-2i
__complex__ int conj_y = ~y; // conj_y = 4+5j


// ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
// MACROS (GNU C):

// The "maximum" function is commonly defined as a macro in standard C as follows:
#define max(a,b) ((a) > (b) ? (a) : (b))
// But this definition computes either a or b twice, with bad results if the operand has side effects.
// In GNU C, if you know the type of the operands (here let's assume int), you can define the macro safely as follows:
#define max_int(a,b) \
  ({int _a = (a), _b = (b); _a > _b ? _a : _b; })


// ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
// TRIGRAPHS:

/*
It all started half a century ago with repurposing hardcopy communication terminals as computer user interfaces.
In the initial Unix and C era that was the ASR-33 Teletype.
This device was slow (10 cps) and noisy and ugly and its view of the ASCII character set ended at 0x5f (95).
So to encapsulate the missing ASCII characters, they came up with trigraph codes that would compile to
higher/special ACSII characters during runtime.
*/


/*
Trigraph   Replaces

??(        [
??)        ]
??<        {
??>        }
??/        \
??'        ^
??=        #
??!        |
??-        ~
*/


