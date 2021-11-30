########################################################
# Author: Jonathan Alexander Gibson
# Date: November 29, 2021
# Execution Command: N/A
# Credit: Udemy Course - https://www.udemy.com/course/robot-framework-level-1/
########################################################

*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${PRODUCT_ADD_TO_CART_BUTTON} =  id=add-to-cart-button
${PRODUCT_BACK_MSG} =  Back to results

*** Keywords ***
Verify Page Loaded
    Wait Until Page Contains  ${PRODUCT_BACK_MSG}

Add to Cart
    Click Button  ${PRODUCT_ADD_TO_CART_BUTTON}