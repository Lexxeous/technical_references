*** Settings ***
Documentation  Amazon top navigation
Library  SeleniumLibrary

*** Variables ***
${TOP_NAV_SEARCH_BUTTON} =  id=nav-search-submit-button

*** Keywords ***
Search for Products
    Enter Search Term
    Submit Search

Enter Search Term
    Input Text  id=twotabsearchtextbox  ${SEARCH_TERM}

Submit Search
    Click Button  ${TOP_NAV_SEARCH_BUTTON}