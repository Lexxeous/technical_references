########################################################
# Author: Jonathan Alexander Gibson
# Date: November 30, 2021
# Execution Command: python -m robot -d Results/ Tests/amazon-gherkin.robot
# Credit: Udemy Course - https://www.udemy.com/course/robot-framework-level-1/
########################################################

*** Settings ***
Documentation  Gherkin-based suite file for testing the Amazon website.

# Import resources
Resource  ../Resources/amazon.web.gui-gherkin.robot
Resource  ../Resources/common.web.robot
Resource  ../Resources/common.robot

# Define setup and tear-down
Suite Setup  Common.Init Suite
Test Setup  Common.Web.Begin Web Test
Test Teardown  Common.Web.End Web Test
Suite Teardown  Common.Clean Suite

*** Variables ***

*** Test Cases ***
Logged out user can search for products
    [Tags]  gherkin

    Given user is not logged in
    When user searches for products
    Then search results contains relevant products

Logged out user can view a product
    [Tags]  gherkin

    Given user is not logged in
    And user searches for products
    And search results contains relevant products
    And user selects a product from search results
    Then correct product page loads

Logged out user can add product to cart
    [Tags]  gherkin

    Given user is not logged in
    And user searches for products
    And search results contains relevant products
    And user selects a product from search results
    And correct product page loads
    When user adds that product to their cart
    Then the product is present in cart

Logged out user must sign in to check out
    [Documentation]  This approach uses first level keywords, and it's clear what's happening under the covers
    [Tags]  gherkin

    Given user is not logged in
    And user searches for products
    And search results contains relevant products
    And user selects a product from search results
    And correct product page loads
    And user adds that product to their cart
    And the product is present in cart
    When user attempts to checkout
    Then the user is required to sign in








