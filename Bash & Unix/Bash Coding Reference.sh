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

heroku update # get latest version of heroku
heroku login # login to account
keroku create # create new https heroku application
heroku keys:add # sync public rsa key
heroku rename <app-name> # https://<app-name>.herokuapp.com
git push heroku master
