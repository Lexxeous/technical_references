########################################################
# Author: Jonathan Alexander Gibson
# Date: November 29, 2021
# Execution Command: N/A
# Credit: Udemy Course - https://www.udemy.com/course/robot-framework-level-1/
########################################################

*** Settings ***
Library  SeleniumLibrary

*** Keywords ***
Verify Page Loaded
    Wait Until Page Contains  Back to results

Add to Cart
    Click Button  id=add-to-cart-button