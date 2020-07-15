# Bash Command Reference.sh

# -------------------------------------------------------------------------------------------------
# GENERAL

. # current working directory
.. # parent directory
cd # change directory
mkdir # make directory
rm # remove
pwd # outputs the Present Working Directory
ls # list all files and folders (excluding hidden and excluding details)
lsa # list all files and folders (including hidden and including details)
ls -a # list all files and folders (including hidden and excluding details)
echo <data> # will print <data> to the screen
	./<program_name>; echo $? # alternatively, you can print the return value of a program 

# -------------------------------------------------------------------------------------------------
# DEFAULT CODE EDITORS

less <file_name> # view contents of <file_name> ; 'q' to exit
nano <file_name> # view and edit contents of <file_name> ; "CRTL+x" to exit
pico <file_name> # view and edit contents of <file_name> ; "CRTL+x" to exit
emacs <file_name> # view and edit contents of <file_name> ; "CRTL+x+c" to save and exit
vim <file_name> # view and edit contents of <file_name> ; ":wq" to save and exit

# -------------------------------------------------------------------------------------------------
# DIRECTORY STATISTICS

# Directory Size
du -sch # print the disk usage (size) of the current directory

# Directory Count
ls -l | grep "^d" | wc -l # print quantity of parent directories in the current directory
ls -lR | grep "^d" | wc -l # print quantity of parent and all child directories in current directory (recursive)

# Hidden Files
ls -ap | grep -v / | egrep "^\."  # print all hidden files in current directory
ls -ap | egrep "^\..*/$" # print all hidden directories in current directory

# File Count
find . -type f | wc -l # print quantity of all files in current directory (and all child directories)
find . -type f -name "*.<desired_extension>" | wc -l # print quantity of all files with <desired_extension> in current directory (and all child directories)

# Lines of Code
find . -name '*.<desired_extension>' | xargs wc -l # print lines of code for all files in current directory (including all child directories) with <desired_extension> (no spaces allowed in path names)
cloc . # third party application for printing lines of code ; install with "brew install cloc"


# -------------------------------------------------------------------------------------------------
# COMPILATION

g++ -c <program_name>.cpp # compiles the cpp program into a binary object file (.o)
g++ -o <program_name> <program_name>.o # links the binary object file with other cpp libraries into an executable
./<program_name> # runs the resulting executable

g++ -fsanitize=address -g -o <program_name> <program_name>.cpp # compiles and links with an address sanitizer tool ; used for memory checks

gcc -c <program_name>.c # compiles the c program into a binary object file (.o)
gcc -o <program_name> <program_name>.o # links the binary object file with other c libraries into an executable
./<program_name> # runs the resulting executable

gcc -fsanitize=address -g -o <program_name> <program_name>.c # compiles and links with an address sanitizer tool ; used for memory checks

# -------------------------------------------------------------------------------------------------
# PATH EXPORTS

# PATH files are in the home directory /Users/<username>/ and will be called .bashrc, .zshrc, yarnrc, mkshrc, etc...
export PATH=$PATH:path/to/desired/directory # add directory to your "$PATH"
export PATH=$PATH:$HOME/.composer/vendor/bin # example for adding composer's "bin" folder to $PATH

# -------------------------------------------------------------------------------------------------
# FUNCTIONS

function <func_name>() { eval $( head -1 $1 | cut -c3- ) ; } # compile file into executable if the very first line contains compilation instructions as a comment

# -------------------------------------------------------------------------------------------------
# SFTP

sftp <user_name>@shell.<server>.<domain> # open sftp connection with remote server ; jagibson44@shell.hpc.tntech.edu
put <file_name> # move file from local to remote
get <file_name> # move file form remote to local
bye # quit sftp connection


# -------------------------------------------------------------------------------------------------
# SLURM (Simple Linux Utility for Resource Management)

# compiler directives:
#!/bin/bash
#SBATCH --nodes=1 ; cores to reserve
#SBATCH --cpus-per-task=1 ; cores per job
#SBATCH --time=00:01:00 ; time to reserve

slurm-<job_id>.out # output file in executable directory

# -------------------------------------------------------------------------------------------------
# HPCSHELL (High Performance Computer)

hpcshell # reserves a compute node separate from the login node
ssh <compute_node_name> # login directly to a compute node ; Example <compute_node_name> = gpunode001
top # view activity on a node
squeue -u <user_name> # view queued jobs by a certain user
scancel <job_id> # cancel an HPC job
sbatch <executable_name>.sh # submit job to the HPC cluster with SLURM

g++ -fopenmp -o <executable_name> <file_name>.cpp # compile a C++ file for OpenMP
gcc -fopenmp -o <executable_name> <file_name>.c # compile a C file for OpenMP

# -------------------------------------------------------------------------------------------------
# BREW

brew cleanup # free up unecessary brew files
brew doctor # display current potential brew vulnerabilities
brew install <packageName> # install brew package
brew uninstall <packageName> # uninstall brew package


# -------------------------------------------------------------------------------------------------
# HEROKU

heroku logs --tail # gives latest heroku error logs
heroku update # get latest version of heroku
heroku login # login to account
keroku create # create new https heroku application
heroku keys:add # sync public rsa key
heroku rename <appName> # https://<appName>.herokuapp.com
git push heroku master
heroku open # opens the url for the application
heroku ps # displays current project dyno usage


# -------------------------------------------------------------------------------------------------
# ATOM

apm list # list installed Atom packages
apm update # list packages that have updates avaliable
apm upgrade # upgrade Atom packages
apm clean # removes extraneous modules
atom . # open Atom at the current directory location


# -------------------------------------------------------------------------------------------------
# SUBLIME TEXT

stt # open sublime text at the current directory location ; dependent on .zshrc plugins


# -------------------------------------------------------------------------------------------------
# CRONTAB

crontab -e # open the crontab scheduler via vim


# -------------------------------------------------------------------------------------------------
# MISC

# Get process information on a port (including PID):
	# Using netstat:
	netstat -vanp tcp | grep <port_num>

	# For macOS El Capitan and newer (or if your netstat doesnt support -p), use lsof:
	lsof -i tcp:<port_num> 

	# For Centos 7 use:
	netstat -vanp --tcp | grep <port_num>

	# Then kill the process if necessary:
	kill <PID_num>
