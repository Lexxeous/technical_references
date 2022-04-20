*** Settings ***
Resource  po/sign-in.robot

*** Keywords ***
# Using CSV data
Login with Many Invalid Credentials
    [Arguments]  ${InvalidLoginScenarios}
    #  The BuiltIn RF library already handles errors for failing inside a loop, we have to do it manually otherwise
    FOR  ${LoginScenario}  IN  @{InvalidLoginScenarios}
        Run Keyword and Continue on Failure  sign-in.Navigate To
        Run Keyword and Continue on Failure  Attempt Login  ${LoginScenario}  csv=${TRUE}
        Run Keyword and Continue on Failure  Verify Login Page Error Message  ${LoginScenario}  csv=${TRUE}
    END

Test Multiple Login Scenarios
    [Arguments]  ${Credentials}
    Navigate to Sign In Page
    Attempt Login  ${Credentials}
    Verify Login Page Error Message  ${Credentials.ExpectedErrorMessage}

Navigate to Sign In Page
    sign-in.Navigate To

Attempt Login
    [Arguments]  ${Credentials}  ${csv}=${FALSE}
    sign-in.Enter Credentials  ${Credentials}  csv=${csv}
    sign-in.Click Submit
    Sleep  1s

Verify Login Page Error Message
    [Arguments]  ${ExpectedErrorMessage}  ${csv}=${FALSE}
    sign-in.Verify Error Message  ${ExpectedErrorMessage}  csv=${csv}