########################################################
# Author: Jonathan Alexander Gibson
# Date: November 30, 2021
# Execution Command: python -m robot -d Results/Main/Gherkin Tests/main.gherkin.robot
# Credit: Udemy Course - https://www.udemy.com/course/robot-framework-level-1/
########################################################

*** Settings ***
Documentation  Gherkin-based suite file for testing the Amazon website.

# Import resources
Resource  ../Resources/web.gui.gherkin.robot
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

*** Test Cases ***
Logged out user can search for products
    [Tags]  gherkin

    Given user is not logged in
    When user searches for products  ${URL}  ${SEARCH_TERM}
    Then search results contains relevant products  ${SEARCH_TERM}

Logged out user can view a product
    [Tags]  gherkin

    Given user is not logged in
    And user searches for products  ${URL}  ${SEARCH_TERM}
    And search results contains relevant products  ${SEARCH_TERM}
    And user selects a product from search results
    Then correct product page loads

Logged out user can add product to cart
    [Tags]  gherkin

    Given user is not logged in
    And user searches for products  ${URL}  ${SEARCH_TERM}
    And search results contains relevant products  ${SEARCH_TERM}
    And user selects a product from search results
    And correct product page loads
    When user adds that product to their cart
    Then the product is present in cart

Logged out user must sign in to check out
    [Documentation]  This approach uses first level keywords, and it's clear what's happening under the covers
    [Tags]  gherkin  all

    Given user is not logged in
    And user searches for products  ${URL}  ${SEARCH_TERM}
    And search results contains relevant products  ${SEARCH_TERM}
    And user selects a product from search results
    And correct product page loads
    And user adds that product to their cart
    And the product is present in cart
    When user attempts to checkout
    Then the user is required to sign in








