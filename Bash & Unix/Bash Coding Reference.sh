# Bash Coding Reference.sh (command line stuff ; brew ; navigation)

# -------------------------------------------------------------------------------------------------
# BREW

brew cleanup # free up unecessary brew files
brew doctor
brew install <packageName>
brew uninstall <packageName>

# -------------------------------------------------------------------------------------------------
# HEROKU
# do while inside project directory

heroku logs --tail # gives latest heroku error logs
heroku update # get latest version of heroku
heroku login # login to account
keroku create # create new https heroku application
heroku keys:add # sync public rsa key
heroku rename <app-name> # https://<app-name>.herokuapp.com
git push heroku master
heroku open # opens the url for the application


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