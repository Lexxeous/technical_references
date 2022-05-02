<!-- PyEnv Management.md -->

<!-- https://realpython.com/intro-to-pyenv/ -->

Man Page/CLI Documentation:
```bash
Usage: pyenv <command> [<args>]

Some useful pyenv commands are:
   --version   Display the version of pyenv
   activate    Activate virtual environment
   commands    List all available pyenv commands
   deactivate   Deactivate virtual environment
   doctor      Verify pyenv installation and development tools to build pythons.
   exec        Run an executable with the selected Python version
   global      Set or show the global Python version(s)
   help        Display help for a command
   hooks       List hook scripts for a given pyenv command
   init        Configure the shell environment for pyenv
   install     Install a Python version using python-build
   local       Set or show the local application-specific Python version(s)
   prefix      Display prefixes for Python versions
   rehash      Rehash pyenv shims (run this after installing executables)
   root        Display the root directory where versions and shims are kept
   shell       Set or show the shell-specific Python version
   shims       List existing pyenv shims
   uninstall   Uninstall a specific Python version
   version     Show the current Python version(s) and its origin
   version-file   Detect the file that sets the current pyenv version
   version-name   Show the current Python version
   version-origin   Explain how the current Python version is set
   versions    List all Python versions available to pyenv
   virtualenv   Create a Python virtualenv using the pyenv-virtualenv plugin
   virtualenv-delete   Uninstall a specific Python virtualenv
   virtualenv-init   Configure the shell environment for pyenv-virtualenv
   virtualenv-prefix   Display real_prefix for a Python virtualenv version
   virtualenvs   List all Python virtualenvs found in `$PYENV_ROOT/versions/*'.
   whence      List all Python versions that contain the given executable
   which       Display the full path to an executable

See `pyenv help <command>' for information on a specific command.
For full documentation, see: https://github.com/pyenv/pyenv#readme
```

System path to Python executable:
`which python`
`/usr/bin/python` OR `/usr/anaconda3/bin/python` OR similar...

Ubuntu/Debian:
`sudo apt-get install -y make build-essential libssl-dev zlib1g-dev \
libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev \
libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev python-openssl`

Fedora/CentOS/RHEL:
`sudo yum install gcc zlib-devel bzip2 bzip2-devel readline-devel sqlite \
sqlite-devel openssl-devel xz xz-devel libffi-devel`

macOS:
`brew install openssl readline sqlite3 xz zlib`

Install `pyenv`:
`curl https://pyenv.run | bash`

Add to `~/bashrc` or `~/.zshrc`:

```bash
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
```

List all Python versions from 3.6.x - 3.9.y:
`pyenv install --list | grep " 3\.[6789]"`

List all jPython versions:
`pyenv install --list | grep "jython"`

Install specific Python version:
`pyenv install -v x.y.z`

Python versions installation location:
`ls ~/.pyenv/versions/`

Uninstall specific Python version:
`rm -rf ~/.pyenv/versions/x.y.z` OR `pyenv uninstall x.y.z`

List installed versions:
`pyenv versions`

PyEnv path to Python executable:
`which python`
`/home/realpython/.pyenv/shims/python`

PyEnv injected path to system level Python executable:
`pyenv which python`
`/usr/bin/python`

Show current global Python version:
`pyenv global`

Set global Python version:
`pyenv global x.y.z`

Set global Python version back to system default:
`pyenv global system`