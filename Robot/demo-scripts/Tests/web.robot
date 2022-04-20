*** Settings ***
Documentation  These are some web tests
Resource  ../Resources/web/common.robot
Resource  ../Resources/web/gui.robot
Test Setup  common.Begin Web Test
Test Teardown  common.End Web Test

# python -m robot -d Results/web/ Tests/web.robot
# python -m robot -d Results/web/ -i Web Tests/

# external
# pip install robotframework-seleniumlibrary
# https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html


*** Variables ***
${BROWSER} =  chrome
${START_URL} =  https://www.amazon.com
${SEARCH_TERM} =  Ferrari 458

*** Test Cases ***
Logged out user can search for products
    [Tags]  Web
    gui.Search for Products

Logged out user can add product to cart
    [Tags]  Web
    gui.Search for Products
    gui.Select Product from Search Results
    gui.Add Product to Cart
