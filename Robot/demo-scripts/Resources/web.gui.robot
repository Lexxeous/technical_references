########################################################
# Author: Jonathan Alexander Gibson
# Date: November 29, 2021
# Execution Command: N/A
# Credit: Udemy Course - https://www.udemy.com/course/robot-framework-level-1/
########################################################

*** Settings ***
Documentation  Suite specifically for testing the Amazon website GUI.

Resource  ./PO/Cart.robot
Resource  ./PO/Landing-Page.robot
Resource  ./PO/Product.robot
Resource  ./PO/Search-Results.robot
Resource  ./PO/Sign-In.robot
Resource  ./PO/Top-Nav.robot

*** Keywords ***
Search for Products
    [Arguments]  ${url}  ${search_term}
    Landing-Page.Load  ${url}
    Landing-Page.Verify Page Loaded
    Top-Nav.Search for Products  ${search_term}
    Search-Results.Verify Search Completed  ${search_term}

Select Product from Search Results
    Search-Results.Click Product link
    Product.Verify Page Loaded

Add Product to Cart
    Product.Add to Cart
    Cart.Verify Product Added

Begin Checkout
    Cart.Proceed to Checkout
    Sign-In.Verify Page Loaded

Begin Login
    [Arguments]  ${url}
    Landing-Page.Load  ${url}
    Landing-Page.Verify Page Loaded
    Top-Nav.View Account

Submit "Email" Value
    [Arguments]  ${email}
    Sign-In.Fill "Email" Field  ${email}
    Sign-In.Click "Continue" Button

Verify "Email" Error
    Sign-In.Verify Invalid Email
