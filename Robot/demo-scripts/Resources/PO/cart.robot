########################################################
# Author: Jonathan Alexander Gibson
# Date: November 29, 2021
# Execution Command: N/A
# Credit: Udemy Course - https://www.udemy.com/course/robot-framework-level-1/
########################################################

*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${CART_ADD_CONFIRMATION} =  Added to Cart
${CART_PROCEED_TO_CHECKOUT_BUTTON} =  id=hlb-ptc-btn-native

*** Keywords ***
Verify Product Added
    Wait Until Page Contains  ${CART_ADD_CONFIRMATION}

Proceed to Checkout
    Click Link  ${CART_PROCEED_TO_CHECKOUT_BUTTON}