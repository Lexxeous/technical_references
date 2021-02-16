<!-- MongoDB Management -->

# <img src="../.pics/Lexxeous/lexx_headshot_clear.png" width="100px"/> Lexxeous's MongoDB Management: <img src="../.pics/MongoDB/mongodb_logo.png" width="100"/>

## For macOSX:

Official documentation <a href="https://docs.mongodb.com/manual/tutorial/install-mongodb-on-os-x/">here</a>.

```bash
brew tap mongodb/brew
brew install mongodb-community@4.2
```

  * Configuration file location: `/usr/local/etc/mongod.conf`
  * Log directory path: `/usr/local/var/log/mongodb`
  * Data directory path: `/usr/local/var/mongodb`

```bash
brew services start mongodb-community@4.2 # start the mongodb server instance

brew services stop mongodb-community@4.2 # stop the mongodb server instance

mongo # connect to a currently running mongodb server instance
```

> The default port for `MongoDB` is **27017**.


## Schemas:

### Shema Types:

  * Number
  * String
  * ...