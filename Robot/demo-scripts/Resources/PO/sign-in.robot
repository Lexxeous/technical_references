########################################################
# Author: Jonathan Alexander Gibson
# Date: November 29, 2021
# Execution Command: N/A
# Credit: Udemy Course - https://www.udemy.com/course/robot-framework-level-1/
########################################################

*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${SIGN_IN_EMAIL_BOX} =  id=ap_email
${SIGN_IN_INVLID_EMAIL_MSG} =  We cannot find an account with that email address
${SIGN_IN_TEXT} =  Sign-In
${SIGN_IN_CONTINUE_BUTTON} =  id=continue

*** Keywords ***
Verify Page Loaded
    Wait Until Page Contains  ${SIGN_IN_TEXT}
    Page Should Contain Element  ${SIGN_IN_CONTINUE_BUTTON}

Verify Invalid Email
    Wait Until Page Contains  ${SIGN_IN_INVLID_EMAIL_MSG}

Sign In
    [Arguments]  ${email}  ${password}
    Wait Until Page Contains  ${SIGN_IN_TEXT}
    Page Should Contain Element  ${SIGN_IN_CONTINUE_BUTTON}
    Fill Email Field  ${email}
    Click "Continue" Button

Fill "Email" Field
    [Arguments]  ${email}
    Input Text  ${SIGN_IN_EMAIL_BOX}  ${email}

# Fill "Password" Field
#   [Arguments]  ${password}
#   Input Text  ${SIGN_IN_EMAIL_BOX}  ${email}

Click "Continue" Button
    Click Button  ${SIGN_IN_CONTINUE_BUTTON}
