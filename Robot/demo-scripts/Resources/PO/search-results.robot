########################################################
# Author: Jonathan Alexander Gibson
# Date: November 29, 2021
# Execution Command: N/A
# Credit: Udemy Course - https://www.udemy.com/course/robot-framework-level-1/
########################################################

*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${SEARCH_RESULTS_THIRD_PRODUCT_LINK} =  xpath=//*[@id="search"]/div[1]/div[1]/div/span[3]/div[2]/div[5]/div/span/div/div/span/a

*** Keywords ***
Verify Search Completed
    [Arguments]  ${search_term}
    Wait Until Page Contains  results for "${search_term}"

Click Product Link
    [Documentation]  Clicks on the third product link in the search results list.
    Click Link  ${SEARCH_RESULTS_THIRD_PRODUCT_LINK}