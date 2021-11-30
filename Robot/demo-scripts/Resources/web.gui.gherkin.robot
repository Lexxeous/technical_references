########################################################
# Author: Jonathan Alexander Gibson
# Date: November 29, 2021
# Execution Command: N/A
# Credit: Udemy Course - https://www.udemy.com/course/robot-framework-level-1/
########################################################

*** Settings ***
Documentation  Gherkin-based suite specifically for testing the Amazon website GUI.

Resource  ./PO/Cart.robot
Resource  ./PO/Landing-Page.robot
Resource  ./PO/Product.robot
Resource  ./PO/Search-Results.robot
Resource  ./PO/Sign-In.robot
Resource  ./PO/Top-Nav.robot

*** Keywords ***
user is not logged in
    Log  Check to see whether user is logged in

user searches for products
    [Arguments]  ${url}  ${search_term}
    Landing-Page.Load  ${url}
    Top-Nav.Search for Products  ${search_term}

search results contains relevant products
    [Arguments]  ${search_term}
    Search-Results.Verify Search Completed  ${search_term}

user selects a product from search results
    Search-Results.Click Product link
    Product.Verify Page Loaded

user selects a searched product
    [Documentation]  This 2nd level keyword calls other 1st level keywords to help simplify the test case
    user searches for products
    search results contains relevant products
    user selects a product from search results

correct product page loads
    Product.Verify Page Loaded

user adds that product to their cart
    Product.Add to Cart

user adds a product to their cart
    [Documentation]  This 2nd level keyword calls other 1st level keywords to help simplify the test case
    user searches for products
    search results contains relevant products
    user selects a product from search results
    correct product page loads
    user adds that product to their cart
    the product is present in cart

the product is present in cart
    Cart.Verify Product Added

user attempts to checkout
    Cart.Proceed to Checkout

the user is required to sign in
    Sign-In.Verify Page Loaded
