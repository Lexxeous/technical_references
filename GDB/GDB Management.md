# <img src="../.pics/Lexxeous/lexx_headshot_clear.png" width="100px"/> Lexxeous's GDB Management: <img src="../.pics/GDB/gdb_logo.png" width="140"/>

> `GDB` is the GNU Debugger tool and is a primitive but reliable way to debug programs.

> You can set a default "disassembly-flavor" by placing the corresponding command in `~/.gdbinit`.

Find the GDB manual and other online documentation resources [here](http://www.gnu.org/software/gdb/documentation/).

#### General:

`list` will display the symbol table for the loaded executable.

`diassemble [opts] <addr>` will disassemble a specific section of memory and display the surrounding instructions, including `<addr>`. The `<addr>` argument can also be a symbol or label.

  * `/r` will show the bytes composing the forementioned instructions. Raw instructions in hex are displayed.
  * `/m` will have source lines included (if available). This view is "source centric", meaning that the output is in source line order, regardless of any optimization that is present. Only the main source file is displayed, not those of, e.g., any inlined functions. This option hasn't proved useful in practice and is deprecated in favor of `/s`.
  * `/s` differs from `/m` in two important respects:
    - the output is still in program counter (PC) address order, and
    - file names and contents for all relevant source files are displayed.

`set [opts] disassembly-flavor <flavor>`

`quit` will exit `GDB`.

#### Starting and Loading a Binary with GDB:

`gdb [<exec_name>]` will start `GDB`. Optionally, you can provide the name of an executable to automatically load it.

`gdbtui` & `gdb -tui` will start `GDB` and enable the Text User Interface (TUI).

`file <exec_name>` will load an executable into `GDB`.

`run` will run the debugger.

`start` will run the debugger from the beginning of the program and stop at the `main` function.

`starti` will run the debugger from the beginning of the program and stop at OS `_start` on Linux and `start` on Windows.

#### Using Breakpoints:

`cont` will make the debugger fall through instructions until the next breakpoint

`break <addr>` will create a breakpoint at address `<addr>` (alias: `b`). The `<addr>` argument can also be a symbol or label.

`delete <breakpoint_id>` will delete the breakpoint with ID = `<breakpoint_id>` (alias: `d`).

#### Walking Through Instructions:

`nexti` will proceed to the next instruction (alias: `ni`).

`stepi` will step into the next instruction if it is a function call.

#### Managing ASM Registers:

`set <reg_name> = <value>` and/or `set <reg_name> = <reg_name_x> ± <value>` will manipulate the value stored in `<reg_name>`; `<reg_name_x>` can be an alternative register.

`display [opts] $<reg_name>` will watch the value of `<reg_name>` constantly as the debugger runs, until it is undisplayed.

`undisplay $<reg_name>` will undo the watch of `<reg_name>` for the debugging session, until it is re-displayed.

`print [opts] $<reg_name>` will print the current value in `<reg_name>` (alias: `p`).

`x [opts] $<reg_name>`

The following *formatting options* are available for displaying/printing/watching the value of a register:

  * `/o` (octal)
  * `/x` (hexidecimal)
  * `/d` (decimal)
  * `/u` (unsigned decimal)
  * `/t` (binary)
  * `/f` (float)
  * `/a` (address)
  * `/i` (instruction)
  * `/c` (character)
  * `/s` (string)
  * `/z` (hexidecimal, zero, padded on the left)
  * `/b` (byte)
  * `/h` (halfword, 16 bits)
  * `/w` (word, 32 bits)
  * `/g` (giant, 64 bits)


#### Managing Signals and Errors:

`catch <sub_command> [<signal_name>]` will inform the user about the existance of certain signals, where `<sub_command>` is one of the following:

  * `assert` (catch failed Ada assertions)
  * `catch` (catch an exception)
  * `exception` (catch Ada exceptions)
  * `exec` (catch calls to exec)
  * `fork` (catch calls to fork)
  * `handlers` (catch Ada exceptions)
  * `load` (catch loads of shared libraries)
  * `rethrow` (catch an exception)
  * `signal` (catch signals by their names and/or numbers)
  * `syscall` (catch system calls by their names)
  * `throw` (catch an exception)
  * `unload` (catch unloads of shared libraries)
  * `vfork` (catch calls to vfork)

and where `<signal_name>` is one of the follwing:

  * `SIGSEGV` (a segmentation fault)
  * `SIGTERM` (a termination request, sent to the program)
  * `SIGINT` (an external interrupt, usually initiated by the user)
  * `SIGILL` (an invalid program image, such as invalid instruction)
  * `SIGABRT` (an abnormal termination condition, as is e.g. initiated by abort())
  * `SIGFPE` (an erroneous arithmetic operation such as divide by zero)

#### Misc:

`refresh` will refresh the debugger and its windows. This is useful for correcting visual TUI gliches (alias: `ctrl+l`).

`layout <window_name>` will enable the `<window_name>` window where `<window_name>` is one of the following:

  * `asm` (assembly instructions)
  * `regs` (all register values)

`focus <window_name>` will focus the text cursor on `<window_name>` to enable vertical scrolling on the window, if necessary. The window names are the same as mentioned above for `layout`.

`where` will show the calls on the stack frame.

`up` & `down` will move up and down on the stack frame.

#### Help and Information:

`help <command>`

`info <command>`, where `<command>` is one of the following:

  * `address` (Describe where symbol SYM is stored)
  * `all-registers` (List of all registers and their contents)
  * `args` (All argument variables of current stack frame or those matching REGEXPs)
  * `auto-load` (Print current status of auto-loaded files)
  * `auxv` (Display the inferior's auxiliary vector)
  * `bookmarks` (Status of user-settable bookmarks)
  * `breakpoints` (Status of specified breakpoints (all user-settable breakpoints if no argument))
  * `classes` (All Objective-C classes)
  * `common` (Print out the values contained in a Fortran COMMON block)
  * `copying` (Conditions for redistributing copies of GDB)
  * `dcache` (Print information on the dcache performance)
  * `display` (Expressions to display when program stops)
  * `exceptions` (List all Ada exception names)
  * `extensions` (All filename extensions associated with a source language)
  * `files` (Names of targets and files being debugged)
  * `float` (Print the status of the floating point unit)
  * `frame` (All about the selected stack frame)
  * `frame-filter` (List all registered Python frame-filters)
  * `functions` (All function names or those matching REGEXPs)
  * `guile` (Prefix command for Guile information displays)
  * `handle` (What debugger does when program gets various signals)
  * `inferiors` (Print a list of inferiors being managed)
  * `io_registers` (Query remote avr target for io space register values)
  * `line` (Core addresses of the code for a source line)
  * `locals` (All local variables of current stack frame or those matching REGEXPs)
  * `mach-exceptions` (Disp mach exceptions)
  * `mach-port` (Get information on a specific port)
  * `mach-ports` (Get list of ports in a task)
  * `mach-region` (Get information on mach region at given address)
  * `mach-regions` (Get information on all mach region for the task)
  * `mach-regions-rec` Get information on all mach sub region for the task
  * `mach-task` (Get information on a specific task)
  * `mach-tasks` (Get list of tasks in system)
  * `mach-thread` (Get information on a specific thread)
  * `mach-threads` (Get list of threads in a task)
  * `macro` (Show the definition of MACRO)
  * `macros` (Show the definitions of all macros at LINESPEC)
  * `mem` (Memory region attributes)
  * `os` (Show OS data ARG)
  * `pretty-printer` (GDB command to list all registered pretty-printers)
  * `probes` (Show available static probes)
  * `proc` (Show additional information about a process)
  * `program` (Execution status of the program)
  * `record` (Info record options)
  * `registers` (List of integer registers and their contents)
  * `scope` (List the variables local to a scope)
  * `selectors` (All Objective-C selectors)
  * `set` (Show all GDB settings)
  * `sharedlibrary` (Status of loaded shared object libraries)
  * `signals` (What debugger does when program gets various signals)
  * `skip` (Display the status of skips)
  * `source` (Information about the current source file)
  * `sources` (Source files in the program)
  * `spu` (Various SPU specific commands)
  * `stack` (Backtrace of the stack)
  * `static-tracepoint-markers` (List target static tracepoints markers)
  * `symbol` (Describe what symbol is at location ADDR)
  * `target` (Names of targets and files being debugged)
  * `tasks` (Provide information about all known Ada tasks)
  * `terminal` (Print inferior's saved terminal status)
  * `threads` (Display currently known threads)
  * `tracepoints` (Status of specified tracepoints (all tracepoints if no argument))
  * `tvariables` (Status of trace state variables and their values)
  * `type-printers` (GDB command to list all registered type-printers)
  * `types` (All type names)
  * `unwinder` (GDB command to list unwinders)
  * `variables` (All global and static variable names or those matching REGEXPs)
  * `vector` (Print the status of the vector unit)
  * `vtbl` (Show the virtual function table for a C++ object)
  * `w32` (Print information specific to Win32 debugging)
  * `warranty` (Various kinds of warranty you do not have)
  * `watchpoints` (Status of specified watchpoints (all watchpoints if no argument))
  * `win` (List of all displayed windows)
  * `xmethod` (GDB command to list registered xmethod matchers)

