########################################################
# Author: Jonathan Alexander Gibson
# Date: November 29, 2021
# Execution Command: N/A
# Credit: Udemy Course - https://www.udemy.com/course/robot-framework-level-1/
########################################################

*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${LANDING_PAGE_WELCOME_MSG} =  Hello, Sign in

*** Keywords ***
Load
    [Arguments]  ${url}
    Go To  ${url}

Verify Page Loaded
    Wait Until Page Contains  ${LANDING_PAGE_WELCOME_MSG}