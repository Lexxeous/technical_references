<!-- MySQL Management -->

# <img src="../.pics/Lexxeous/lexx_headshot_clear.png" width="100px"/> Lexxeous's MySQL Management: <img src="../.pics/SQL/sql_logo.png" width="150px"/>
### Multiple MySQL Versions with Homebrew.

#### Install the current version of MySQL.
```sh
# Install current MySQL version.
brew install mysql
    
# Start agent for current version of MySQL (including on login).
ln -sfv /usr/local/opt/mysql/*.plist ~/Library/LaunchAgents
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist
```

#### Install the older version of MySQL.      
```sh
# Find older MySQL versions.
brew search mysql  
      
# Install older MySQL version.
brew install homebrew/versions/mysql56
    
# Start agent for older version of MySQL (including on login).
ln -sfv /usr/local/opt/mysql56/*.plist ~/Library/LaunchAgents
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.mysql56.plist
```

#### Then to switch to the older version.    
```sh  
# Unlink current MySQL version.
brew unlink mysql 
    
# Check older MySQL version.
ls /usr/local/Cellar/mysql56 # => 5.6.27
    
# Link the older version.
brew switch mysql56 5.6.27
```  

#### And to switch back to the current version.    
```sh  
# Unlink older MySQL version.
brew unlink mysql56 
    
# Check current MySQL version.
ls /usr/local/Cellar/mysql # => 5.7.10
    
# Link the current version.
brew switch mysql 5.7.10
```  

#### To verify which MySQL version you're on at any time.
```sh
# Check which version of MySQL is currently symlinked.
ls -l /usr/local/bin/mysql # => /usr/local/bin/mysql@ -> ../Cellar/mysql56/5.6.27/bin/mysql
    
# Or using the MySQL command.
mysql --version
```

#### And to unload a MySQL agent for a given version.    
```sh 
# Stop agent for current version of MySQL.
launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist
rm ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist
    
# Stop agent for older version of MySQL.
launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.mysql56.plist
rm ~/Library/LaunchAgents/homebrew.mxcl.mysql56.plist
```

#### Other MySQL commands (From Terminal Prompt).   
```sh
# Login to MySQL user without password.
mysql -u user

# Login to MySQL user with password.
mysql -u user -p

mysql_upgrade -u root -p
sudo mysql

mysql -u root <db_name> < path/to/db_dump.sql
```

#### Other MySQL commands (From MySQL Prompt).
```sql
CREATE USER 'user'@'%' IDENTIFIED BY 'password';
DROP USER user;
GRANT ALL PRIVILEGES ON *.* TO 'user'@'%';
GRANT FILE ON *.* TO user;
FLUSH PRIVILEGES;

SHOW DATABASES;
SHOW SCHEMAS;
SHOW VARIABLES LIKE '%version%';
SELECT host, user FROM mysql.user;
```