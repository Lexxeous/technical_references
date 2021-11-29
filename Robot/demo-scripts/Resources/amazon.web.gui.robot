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
    Landing-Page.Load
    Landing-Page.Verify Page Loaded
    Top-Nav.Search for Products
    Search-Results.Verify Search Completed

Select Product from Search Results
    Search-Results.Click Product link
    Product.Verify Page Loaded

Add Product to Cart
    Product.Add to Cart
    Cart.Verify Product Added

Begin Checkout
    Cart.Proceed to Checkout
    Sign-In.Verify Page Loaded