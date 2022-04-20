:: Batch Coding Reference

:: For a good BAT to EXE editor, converter, and guide download the program at "https://www.battoexeconverter.com".

:: --------------------------------------------------------------------------------------
:: THE BASICS:

:: @echo off will supress the printing of batch code to the screen
:: echo. will print a blank line similar to '\n'

:: rem -- brings up syntax and command help for <command>
<command>/?
:: rem -- brings up syntax and command help for <command>
help <command>

:: rem -- pause execution and wait for any key to be pressed
pause

:: rem -- clear screen
cls


:: --------------------------------------------------------------------------------------
:: SCRIPT TRAVERSAL:

:<tag>
:: rem -- will jump to the ":<tag>" location in the script
goto <tag>


:: --------------------------------------------------------------------------------------
:: VARIABLES AND EXPRESSIONS:

:: rem -- evaluates <expression_string> mathematically
set /a <expression>="<expression_string>"
:: rem -- assigns <prompt_string> to <var>
set /p <var>="<prompt_string>"
:: rem -- reference to an assigned variable
%<var>%

:: Order of expression operations priority from top to bottom
()                  rem -- grouping
! ~ -               rem -- unary operators
* / %               rem -- arithmetic operators
+ -                 rem -- arithmetic operators
<< >>               rem -- logical shift left and right
&                   rem -- bitwise and
^                   rem -- bitwise exclusive or
|                   rem -- bitwise or
= *= /= %= += -=    rem -- assignment
&= ^= |= <<= >>=
,                   rem -- expression separator


:: Default CMD variables:

:: rem -- expands to the current directory string.
%CD%
:: rem -- expands to current date using same format as date command.
%DATE%
:: rem -- expands to current time using same format as time command.
%TIME%
:: rem -- expands to a random decimal number between 0 and 32767.
%RANDOM%
:: rem -- expands to the current ERRORLEVEL value
%ERRORLEVEL%
:: rem -- expands to the current user's username as a string.
%USERNAME%
:: rem -- expands to the current Command Processor Extensions version number.
%CMDEXTVERSION%
:: rem -- expands to the original command line that invoked the Command Processor.
%CMDCMDLINE%
:: rem -- expands to the highest NUMA node number on this machine.
%HIGHESTNUMANODENUMBER%

:: --------------------------------------------------------------------------------------
:: CONDITIONAL PROCESSING:


if <condition1>
(
	:: code for <condition1>
)
else if <condition2>
(
	:: code for <condition2>
)
else
(
	:: code for defaulting
)

== rem -- boolean check for equality

:: rem -- boolean negation
not
:: rem -- boolean equality ; equal to
equ
:: rem -- boolean negated equality ; not equal to
neq
:: rem -- boolean strictly less than
lss
:: rem -- boolean less than or equal to
leq
:: rem -- boolean strictly greater than
gtr
:: rem -- boolean greater than or equal to
geq


::rem -- check if <filename> exists
if exist <filename>
::rem -- deletes <filename>
del <filename>


:: --------------------------------------------------------------------------------------
:: LOOPS:

:: "/<form_char>" changes the potential behavior of the for loop
	:: "/D", "/R", "/L", "/F" are usable options
:: "<options>" allow for some more specific behavior set by the user
	:: eol=<char> will specify a single End of Line character
	:: skip=<n> will skip <n> lines at the beginning of a file
	:: delims=<char><char><char>...
	:: tokens=x,y,m-n
	:: usebackq
:: <iter_var> variables are case sensitive so "%%i" is different from %%I
:: <list> can be a enumerated list of numbers or characters, file, or a directory
:: <command> lets you specify a command for the loop
:: <command_params> get passed into the loop
for /<flag_char> ["<options>"] %%<iter_var> in (<list>) do <command> [<command_params>]
(
	:: code for for loop
)


:: --------------------------------------------------------------------------------------
:: READING AND WRITING WITH TXT FILES:

:: rem -- overwrite <filename.ext> with <string>
echo <string> > <filename.ext>
:: rem -- append <string> to <filename.ext>
echo <string> >> <filename.ext>


:: --------------------------------------------------------------------------------------
:: FILE MANAGEMENT

:: While renaming a filename you cannot specify a new path.
:: rem -- changes name of <filename1> to <filename2>
rename <filename1> <filename2>
:: rem -- changes name of <filename1> to <filename2>
ren <filename1> <filename2>

:: These commands have several optional flags that will change the behavior of the command
:: You can move and rename a file at the same time with this command if you wish.
:: rem -- moves <src_path_to_file> to <dest_path>
move <src_path_to_file> <dest_path>

:: rem -- puts a copy <src_path_to_file> in <dest_path>
copy <src_path_to_file> <dest_path>
:: rem -- puts a copy <src_path_to_file> in <dest_path>
xcopy <src_path_to_file> <dest_path>

:: rem -- will run an executable file
start <path_to_exe>
:: rem -- calls .exe or .bat file, waits for its termination, then continues to next line
call <path_to_file>

:: rem -- specifies file[s] or dir[s] to delete
del <path_to_files_or_dirs>
:: rem -- specifies file[s] or dir[s] to delete
erase <path_to_files_or_dirs>
