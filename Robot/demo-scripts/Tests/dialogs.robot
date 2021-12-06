*** Settings ***
Documentation  These are some web tests
Library  Dialogs
Resource  ../Resources/web/common.robot
Resource  ../Resources/web/gui.robot
Test Setup  common.Begin Web Test
Test Teardown  common.End Web Test

# python -m robot -d Results/dialogs/ Tests/dialogs.robot
# python -m robot -d Results/dialogs/ -i Web Tests/


# Nothing extra to install
# Interaction with the user/tester
# https://robotframework.org/robotframework/latest/libraries/Dialogs.html

*** Variables ***
${BROWSER} =  chrome
${START_URL} =  https://www.amazon.com
${SEARCH_TERM} =  Ferrari 458

*** Test Cases ***
Logged out user can search for products
    [Tags]  Web
    ${new_browser} =  Get Selection From User  Select next browser:  chrome  ie  firefox
    Set Global Variable  ${BROWSER}  ${new_browser}
    gui.Search for Products

Logged out user can add product to cart
    [Tags]  Web
    gui.Search for Products
    Execute Manual Step  Do something manually!  It failed!
    gui.Select Product from Search Results
    Pause Execution
    gui.Add Product to Cart