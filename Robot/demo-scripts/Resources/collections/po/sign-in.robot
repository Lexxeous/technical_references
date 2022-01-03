*** Settings ***
Library  SeleniumLibrary

*** Variables ***
# Locators are for https://www.cars.com/signin webpage
${SIGN_IN_EMAIL} =          xpath=//input[@id='email']
${SIGN_IN_PASSWORD} =       xpath=//input[@id='password']
${LOGIN_SUBMIT_BUTTON} =    xpath=//button[@type='submit']

*** Keywords ***
Navigate To
    ${SignInUrl} =  Catenate  SEPARATOR=/  ${BASE_URL.${ENVIRONMENT}}  ${LOGIN_URL}
    go to  ${SignInUrl}
    #  TODO check that dev and qa pages dont exist and pass a test

Enter Credentials
    [Arguments]  ${Credentials}  ${csv}=${FALSE}
    Run Keyword If
    ...  ${csv} == ${TRUE}
    ...  Enter CSV Credentials  ${Credentials}
    ...  ELSE
    ...  Enter Dictionary Credentials  ${Credentials}

Click Submit
    Click Button  ${LOGIN_SUBMIT_BUTTON}

Verify Error Message
    [Arguments]  ${ExpectedErrorMessage}  ${csv}=${FALSE}
    Run Keyword If
    ...  ${csv} == ${TRUE}
    ...  Page Should Contain  ${ExpectedErrorMessage[2]}
    ...  ELSE
    ...  Page Should Contain  ${ExpectedErrorMessage}

Clear Input Fields
    Clear Element Text  ${SIGN_IN_EMAIL}
    Clear Element Text  ${SIGN_IN_PASSWORD}



# Private
Enter CSV Credentials
    [Arguments]  ${Credentials}
    Run Keyword Unless  '${Credentials[0]}' == '#BLANK'  Input Text  ${SIGN_IN_EMAIL}  ${Credentials[0]}
    Run Keyword Unless  '${Credentials[1]}' == '#BLANK'  Input Text  ${SIGN_IN_PASSWORD}  ${Credentials[1]}


Enter Dictionary Credentials
    [Arguments]  ${Credentials}
    Run Keyword Unless  '${Credentials.Email}' == '#BLANK'  Input Text  ${SIGN_IN_EMAIL}  ${Credentials.Email}
    Run Keyword Unless  '${Credentials.Password}' == '#BLANK'  Input Text  ${SIGN_IN_PASSWORD}  ${Credentials.Password}