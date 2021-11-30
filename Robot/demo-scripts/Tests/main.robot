########################################################
# Author: Jonathan Alexander Gibson
# Date: November 22, 2021
# Execution Command: python -m robot -d Results/Main/ Tests/main.robot
# Credit: Udemy Course - https://www.udemy.com/course/robot-framework-level-1/
########################################################

*** Settings ***
Documentation  Main suite file for testing the Amazon website.

# Import resources
Resource  ../Resources/web.gui.robot
Resource  ../Resources/common.web.robot
Resource  ../Resources/common.robot

# Define setup and tear-down
Suite Setup  common.Init Suite
Test Setup  common.web.Begin Web Test  ${BROWSER}
Test Teardown  common.web.End Web Test
Suite Teardown  common.Clean Suite

*** Variables ***
${BROWSER} =  chrome
${URL} =  https://amazon.com
${SEARCH_TERM} =  Ferrari 458

${INVALID_EMAIL} =  invalid_user@email.com
${INVALID_PASSWORD} =  invalid_pass

*** Test Cases ***
User must sign in to checkout
    [Documentation]  Attempt to checkout on Amazon without logging in.
    [Tags]  main

    Log  Testing guest user checkout.

    Web.Gui.Search for Products  ${URL}  ${SEARCH_TERM}
    Web.Gui.Select Product from Search Results
    Web.Gui.Add Product to Cart
    Web.Gui.Begin Checkout
    Common.Pause


User cannot sign in with invalid email
    [Documentation]  Attempt to login with invalid email.
    [Tags]  email

    Log  Testing invalid credential sign-in.

    Web.Gui.Begin Login  ${URL}
    Web.Gui.Submit "Email" Value  ${INVALID_EMAIL}
    Web.Gui.Verify "Email" Error
    Common.Pause