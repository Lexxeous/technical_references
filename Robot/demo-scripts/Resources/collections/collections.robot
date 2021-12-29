*** Settings ***
Resource  po/sign-in.robot

*** Keywords ***
Test Multiple Login Scenarios
    [Arguments]  ${Credentials}
    Navigate to Sign In Page
    Attempt Login  ${Credentials}
    Verify Login Page Error Message  ${Credentials.ExpectedErrorMessage}

Navigate to Sign In Page
    sign-in.Navigate To

Attempt Login
    [Arguments]  ${Credentials}
    sign-in.Enter Credentials  ${Credentials}
    sign-in.Click Submit
    Sleep  1s

Verify Login Page Error Message
    [Arguments]  ${ExpectedErrorMessage}
    sign-in.Verify Error Message  ${ExpectedErrorMessage}