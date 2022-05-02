<!-- Django Management.md -->

# <img src="../../.pics/Lexxeous/lexx_headshot_clear.png" width="90px"/> Lexxeous's Django Management: <img src="../../.pics/Python/Django/django_logo.png" width="90px"/>

### I. Summary:

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

`pipenv shell` <!-- launch pipenv virtual environment shell to interact with django application -->

`django-admin startproject <django_app_name> && cd <django_app_name>`

`python manage.py runserver [port]` <!-- starts django app server (on port 8000 by default) -->

`python manage.py startapp <endpoint_name>`

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