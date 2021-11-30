########################################################
# Author: Jonathan Alexander Gibson
# Date: November 29, 2021
# Execution Command: N/A
# Credit: Udemy Course - https://www.udemy.com/course/robot-framework-level-1/
########################################################

*** Settings ***
Documentation  Suite for general web testing.
Library  SeleniumLibrary

*** Keywords ***
Begin Web Test
    [Arguments]  ${browser}
    Open Browser  about:blank  ${browser}
    Maximize Browser Window  # maximize browser for more consistent results w/ locators ; dynamic pages can mess things up

End Web Test
    Close Browser