*** Settings ***
Documentation  These are some Collections tests demonstrating a need for data-driven testing
Library  Collections
Resource  ../Inputs/collections/collections_data.robot
Resource  ../Resources/common.robot
Resource  ../Resources/collections/collections.robot
Test Setup  common.Begin Web Test
Test Teardown  common.End Web Test

# Test Template  Test Multiple Login Scenarios  # applies template to all test cases in this suite/file

# python -m robot -d Results/collections/ Tests/collections.robot
# python -m robot -d Results/collections/ -i Collections Tests/
# python -m robot -d Results/collections/ -v ENVIRONMENT:dev -v BROWSER:ie Tests/collections.robot
  # this last one wont work without URL validation

# internal, standard, nothing extra to install
# https://robotframework.org/robotframework/latest/libraries/Collections.html

*** Variables ***

*** Test Cases ***
Unregistered user should see error message at login
    [Tags]  Collections
    collections.Navigate to Sign In Page
    collections.Attempt Login  ${UNREGISTERED_USER}
    collections.Verify Login Page Error Message  ${UNREGISTERED_USER.ExpectedErrorMessage}
    Sleep  3s

Login with invalid password should show error message
    [Tags]  Collections
    collections.Navigate to Sign In Page
    collections.Attempt Login  ${INVALID_PASSWORD_USER}
    collections.Verify Login Page Error Message  ${INVALID_PASSWORD_USER.ExpectedErrorMessage}
    Sleep  3s

Login with blank email and password should show error message
    [Tags]  Collections
    collections.Navigate to Sign In Page
    collections.Attempt Login  ${BLANK_CREDENTIALS_USER}
    collections.Verify Login Page Error Message  ${BLANK_CREDENTIALS_USER.ExpectedErrorMessage}
    Sleep  3s

# This 1 iterative test case replaces all 3 of the previous test cases with
# a FOR loop and a list variable containing all dictionary credential data
Should show error message with different invalid credentials
    [Tags]  Collections
    ${cred_list_len} =  Get Length  ${ATTEMPT_DATA}  #  get the quantity of dictionaries to loop over
    FOR  ${idx}  IN  0  ${cred_list_len-1}  #  create loop that loops through list indexes
        ${cred_dict} =  Get From List  ${ATTEMPT_DATA}  ${idx}  #  get dictionary at list index
        collections.Navigate to Sign In Page
        collections.Attempt Login  ${cred_dict}  #  pass respective dictionary data through
        collections.Verify Login Page Error Message  ${cred_dict.ExpectedErrorMessage}
        Sleep  2s
    END

# This 1 data-driven test case replaces all 4 of the previous test cases with test case templating
Should show error message with different invalid credentials as test case template
    [Template]  Test Multiple Login Scenarios  # for individual test case template specification
    ${UNREGISTERED_USER}
    ${INVALID_PASSWORD_USER}
    ${BLANK_CREDENTIALS_USER}