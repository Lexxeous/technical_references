<!-- Django Management.md -->

# <img src="../../.pics/Lexxeous/lexx_headshot_clear.png" width="90px"/> Lexxeous's Django Management: <img src="../../.pics/Python/Django/django_logo.png" width="90px"/>

### I. Summary:

Partial credit to: https://www.youtube.com/watch?v=rHux0gMZ3Eg

most popular out of Hug Falcon Bottle Tornado Flask and it for Python web dev frameowkrs

Batteries included framework

admin CLI

ORM - object relational mapper

built in authentication

built in data caching

### 2. Process:

`mkdir <project_name> && cd <project_name>`

`pip install pipenv` <!-- installs virtual python environment and provides `Pipfile` and `Pipfile.lock` -->

`pipenv install django` <!-- creates default django application framework -->

`pipenv install django-debug-toolbar`

`pipenv shell` <!-- launch pipenv virtual environment shell to interact with django application -->

`django-admin startproject <django_app_name> && cd <django_app_name>`

`python manage.py runserver [port]` <!-- starts django app server (on port 8000 by default) -->

`python manage.py startapp <endpoint_name>` <!-- create Django app directory in this project's directory -->

### 3. CLI Documentation:

`django-admin`
```bash
Type 'django-admin help <subcommand>' for help on a specific subcommand.

Available subcommands:

[django]
    check
    compilemessages
    createcachetable
    dbshell
    diffsettings
    dumpdata
    flush
    inspectdb
    loaddata
    makemessages
    makemigrations
    migrate
    runserver
    sendtestemail
    shell
    showmigrations
    sqlflush
    sqlmigrate
    sqlsequencereset
    squashmigrations
    startapp
    startproject
    test
    testserver
```

`python manage.py <command>`:

```bash
compilemessages   -- compile .po files to .mo for use with gettext
createcachetable  -- creates table for SQL cache backend
createsuperuser   -- create a superuser
dbshell           -- run command-line client for the current database
diffsettings      -- display differences between the current settings and Django defaults
dumpdata          -- output contents of database as a fixture
flush             -- execute 'sqlflush' on the current database
inspectdb         -- output Django model module for tables in database
loaddata          -- install the named fixture(s) in the database
makemessages      -- pull out all strings marked for translation
reset             -- executes 'sqlreset' for the given app(s)
runfcgi           -- run this project as a fastcgi
runserver         -- start a lightweight web server for development
shell             -- run a Python interactive interpreter. Tries to use IPython, if it's available
sql               -- print the CREATE TABLE statements for the given app(s)
sqlall            -- print the CREATE TABLE, CREATE INDEX and custom statements for the given app(s)
sqlclear          -- print the DROP TABLE statements for the given app(s)
sqlcustom         -- print the custom table-modifying SQL statements for the given app(s)
sqlflush          -- print the SQL statements required to return all tables to installation state
sqlindexes        -- print the CREATE INDEX statements for the given app(s)
sqlreset          -- print the DROP TABLE and CREATE TABLE statements for the given app(s)
sqlsequencereset  -- print the SQL statements for resetting sequences for the given app(s)
startapp          -- create Django app directory in this project's directory
startproject      -- create a Django project directory structure for a given project name
syncdb            -- create database tables for apps in INSTALLED_APPS where required
test              -- run the test suite for the specified app, or the entire site
testserver        -- run a development server with data from the given fixture(s)
validate          -- validate all installed modules
```