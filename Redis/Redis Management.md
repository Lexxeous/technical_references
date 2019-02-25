<!-- Redis Management -->

# <img src="../.pics/Lexxeous/lexx_headshot_clear.png" width="100px"/> Lexxeous's Redis Management <img src="../.pics/Redis/redis_logo.png" width="100"/>
### Manage your local Redis Server.

#### Start the Redis server.
```sh
# Start the server and exit cursor.
redis-server

# Start the server and persist cursor.
# You can append additional commands after the `&` if desired.
redis-server &

# To have launchd start redis now and restart at login.
brew services start redis
# Or, if you don't want/need a background service you can just run:
redis-server /usr/local/etc/redis.conf
```

#### Stop the Redis server.
```sh
redis-cli shutdown
```

#### Monitor Redis processes.
```sh
# Monitor and exit cursor.
redis-cli monitor

# Monitor and persist cursor.
# You can append additional commands after the `&` if desired.
redis-cli monitor &
```
