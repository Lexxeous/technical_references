########################################################
# Author: Jonathan Alexander Gibson
# Date: November 29, 2021
# Execution Command: N/A
# Credit: Udemy Course - https://www.udemy.com/course/robot-framework-level-1/
########################################################

*** Settings ***
Documentation  Amazon top navigation
Library  SeleniumLibrary

*** Variables ***
${TOP_NAV_SEARCH_BAR} =  id=twotabsearchtextbox
${TOP_NAV_SEARCH_BUTTON} =  id=nav-search-submit-button
${TOP_NAV_ACCOUNT_BUTTON} =  id=nav-link-accountList

*** Keywords ***
Search for Products
    [Arguments]  ${search_term}
    Enter Search Term  ${search_term}
    Submit Search

Enter Search Term
    [Arguments]  ${search_term}
    Input Text  ${TOP_NAV_SEARCH_BAR}  ${search_term}

Submit Search
    Click Button  ${TOP_NAV_SEARCH_BUTTON}

View Account
    Click Link  ${TOP_NAV_ACCOUNT_BUTTON}