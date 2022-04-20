*** Settings ***
Documentation  These are some API tests
Resource  Resources/api/github.robot

# python -m robot -d Results/api/ Tests/api.robot
# python -m robot -d Results/api/ -i API Tests/

# external

# pip install requests
# pip install robotframework-requests

# less flaky, use fewer tests, & faster than application testing on all browsers and devices

# https://marketsquare.github.io/robotframework-requests/doc/RequestsLibrary.html
# https://github.com/MarketSquare/robotframework-requests#readme
# http://marketsquare.github.io/robotframework-requests/
# https://github.com/kennethreitz/requests

*** Variables ***


*** Test Cases ***
Make a simple REST API call
    [Tags]  API
    Check Github Username

Display emoji from Github
    [Tags]  API
    Display Emoji