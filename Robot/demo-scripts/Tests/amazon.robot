########################################################
# Author: Jonathan Alexander Gibson
# Date: November 22, 2021
# Execution Command: python -m robot -d Results/ Tests/amazon.robot
# Credit: Udemy Course - https://www.udemy.com/course/robot-framework-level-1/
########################################################

*** Settings ***
Documentation  info
Library  SeleniumLibrary

*** Variables ***

*** Test Cases ***
User must sign in to checkout (chrome)
    [Documentation]  Attempt to checkout on Amazon without logging in (chrome)
    [Tags]  Chrome

    Log  Starting "User must sign in to checkout (chrome)" test case

    # Pre-conditions
    Open Browser  https://www.amazon.com  chrome

    Wait Until Page Contains  Hello, Sign in
    Input Text  id=twotabsearchtextbox  Ferrari 458
    Click Button  id=nav-search-submit-button
    Wait Until Page Contains  results for "Ferrari 458"
    Click Link  xpath=//*[@id="search"]/div[1]/div[1]/div/span[3]/div[2]/div[5]/div/span/div/div/span/a
    Wait Until Page Contains  Back to results
    Click Button  id=add-to-cart-button
    Wait Until Page Contains  Added to Cart

    # Test case steps
    Click Link  id=hlb-ptc-btn-native
    Page Should Contain Element  continue

    # Post-conditions
    BuiltIn.Sleep  3s
    Close Browser