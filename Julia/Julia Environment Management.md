<!-- Julia Environment Management.md -->

# <img src="../.pics/Lexxeous/lexx_headshot_clear.png" width="100px"/> Lexxeous's Julia ENV Management: <img src="../.pics/Julia/julia_logo.png" width="100px"/>

### Installing Julia:

Install the latest version of **Julia** from: https://julialang.org/. <br>
Install the latest version of **Anaconda** from: https://docs.anaconda.com/anaconda/install/ <br>
Follow this guide to link **Julia**, **Jupyter** notebooks, and **Python** with **Anaconda**: https://www.youtube.com/watch?v=oyx8M1yoboY.

> If you are using `zsh` on a Mac, you may need to use the command line installer, rather than the GUI installer. I found the following links helpful:

1. https://www.datacamp.com/community/tutorials/installing-anaconda-mac-os-x
2. https://towardsdatascience.com/how-to-successfully-install-anaconda-on-a-mac-and-actually-get-it-to-work-53ce18025f97

### CLI Support:

Access **Julia** environment from the terminal:

```bash
sudo ln -s /Applications/Julia-<version>.app/Contents/Resources/julia/bin/julia /usr/local/bin/julia # link Julia excutable
export PATH="$PATH:/usr/local/bin/julia" # add Julia executable to your PATH environment variable(s)
```

> After creating the **Julia** executable and adding it to your `PATH`, running `julia` should activate the environment.

### REPL (Read-Eval-Print-Loop) Modes:

  * `]` (activates the `pkg` REPL)
  * `?` (activates the `help` REPL)
  * `;` (activates the `shell` REPL)

### Package Management:

#### Adding New Julia Packages:

With the **Julia** environment, there are a few ways to install a new package:

```julia
using Pkg
Pkg.add("<package_name>")
```

OR

```julia
]
add <package_name>
```

OR

```julia
using Pkg
pkg"add Packagename"
```

#### Removing Julia Packages:

```julia
using Pkg
Pkg.rm("<package_name>")
```

#### Viewing Installed Julia Packages:

```julia
using Pkg
Pkg.installed() # will return a dictionary of current environment packages
```

> DISCLAIMER: Some legacy versions of **Julia** may not support one of these package menagement options.

### Running Julia Scripts with Python:

> First make sure that the `PyCall` **Julia** package is installed for the **Julia** environment. Also, set the **Python** environment, as shown below.

```julia
using Pkg
Pkg.build()
```

```bash
python-jl <python_file>.py
```

### Set Python Environment:

> First run `which python` and `which python3` to determine the path to each.

```bash
ENV["PYTHON"]=/path/to/python/
ENV["PYTHON3"]=/path/to/python3/
```

### Misc:

Exit the **Julia** environment with: `exit()`.
