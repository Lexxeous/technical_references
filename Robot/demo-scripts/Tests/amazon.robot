########################################################
# Author: Jonathan Alexander Gibson
# Date: November 22, 2021
# Execution Command: python -m robot -d Results/ Tests/amazon.robot
# Credit: Udemy Course - https://www.udemy.com/course/robot-framework-level-1/
########################################################

*** Settings ***
Documentation  Main suite file for testing the Amazon website.

# Import resources
Resource  ../Resources/amazon.web.gui.robot
Resource  ../Resources/common.web.robot
Resource  ../Resources/common.robot

# Define setup and tear-down
Suite Setup  Common.Init Suite
Test Setup  Common.Web.Begin Web Test
Test Teardown  Common.Web.End Web Test
Suite Teardown  Common.Clean Suite

*** Variables ***

*** Test Cases ***
User must sign in to checkout (chrome)
    [Documentation]  Attempt to checkout on Amazon without logging in (chrome)
    [Tags]  Chrome

    Log  Starting "User must sign in to checkout (chrome)" test case

    Amazon.Web.Gui.Search for Products
    Amazon.Web.Gui.Select Product from Search Results
    Amazon.Web.Gui.Add Product to Cart
    Amazon.Web.Gui.Begin Checkout
    Common.Pause