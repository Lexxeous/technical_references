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

less <file_name> # view contents of <file_name> ; 'q' to exit
nano <file_name> # view and edit contents of <file_name> ; "CRTL+x" to exit
pico <file_name> # view and edit contents of <file_name> ; "CRTL+x" to exit
emacs <file_name> # view and edit contents of <file_name> ; "CRTL+x+c" to save and exit
vim <file_name> # view and edit contents of <file_name> ; ":wq" to save and exit

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
