<!-- MS .NET Management -->

# <img src="../.pics/Lexxeous/lexx_headshot_clear.png" width="100px"/> Lexxeous's .NET Management: <img src="../.pics/Microsoft .NET/dot_net_logo.png" width="80"/>

### Summary:

**.NET** is a framework and runtime software developed by *Microsoft*, with the purpose of creating *Windows* (and web) applications. Using the **.NET** framework is not limited to a single programming language. Multiple languages like C#, VB.net, F#, J#, COBOL, & C++ are supported. Upon complilation, programs/scripts written with these languages are converted into a Common Language Infastructure (CLI) model. First, a "platform-neutral" Common Intermediate Language (CIL) is used as the inital step after compilation. The CIL is then converted into a "platform-specific" Common Language Runtime (CLR) that is machine-readable code for the current platform. Lastly, the CLR is "assembled" into a binary.

Check out the [**.NET** Wikipedia page](https://en.wikipedia.org/wiki/.NET_Framework) for more information about how the **.NET** framework works.

### The **.NET** CLR:

The **.NET** CLR is a virtual runtime component that manages the exectution of **.NET** programs. The "assembly" step is achieved by a Just-In-Time (JIT) compiler. This means that each individual line of code is interpreted and compiled/assembled into machine code, as the program runs, rather than needing to compile/assemble the entire program beforehand. The CLR also includes conveniences such as memory management, type safety, garbage collection, and thread management. *All **.NET** programs are executed by the CLR*.