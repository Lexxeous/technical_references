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

stt # open sublime text at the current directory location


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
