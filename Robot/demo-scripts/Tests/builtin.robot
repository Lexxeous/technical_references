*** Settings ***
Library  SeleniumLibrary
Documentation  Checking out the built-in library

# python -m robot -d Results/builtin/ Tests/builtin.robot
# python -m robot -d Results/builtin/ -i BuiltIn Tests/

# Nothing extra to install
# https://robotframework.org/robotframework/latest/libraries/BuiltIn.html

*** Variables ***
${GLOBAL1} =  I am global variable 1
${SOME_GLOBAL_DATA}

*** Test Cases ***
Declare and set variables
    ${some_test_data} =  Set Variable  This is only available within this test
    Set Test Variable  ${more_test_data}  This is also only available within this test

    # Available in all tests in the current set suite
    Set Suite Variable  ${some_suite_data}  This is available within all tests in this suite

    # Available in all tests in all suites
    # Dynamically created global variables should instead be put in the "variables" section for better readability and consistency
    Set Global Variable  ${SOME_GLOBAL_DATA}  This available everywhere

Logging stuff
    [Tags]  BuiltIn

    # Comments do not show the value that a variable contains
    Comment  ${unset_variable}
    Comment  Just a random comment
    Comment  ${GLOBAL1}

    # Logs show variable names and the value that the variable contains
    Log  I have something to say
    Log Many  Something to say 1  Something to say 2  Something to say 3
    Log to Console  This can only be seen in the console, not the log!
    Log Variables  # this should log all the variables in scope ; very powerful to see everything that is available in current "location"
    Log  ${some_suite_data}
    Log  ${GLOBAL1}
    Log  ${SOME_GLOBAL_DATA}

Ignore failures in this test
    [Tags]  BuiltIn
    Open Browser  http://www.amazon.com  ie

    # Notice the log will contain a summary of errors which were encountered
    Run Keyword And Continue On Failure  Wait Until Page Contains  This text doesn't exist
    Run Keyword And Continue On Failure  Wait Until Page Contains  More text that doesn't exist
    #Run Keyword And Continue on Failure  Log  ${some_test_data}

    Log  ${some_suite_data}
    Log  ${GLOBAL1}
    Log  ${SOME_GLOBAL_DATA}
    Close Browser

Repeat things
    [Tags]  Loop

    Repeat Keyword  3 Times  Say Something Funny
    Log  ${some_suite_data}
    Log  ${GLOBAL1}
    Log  ${SOME_GLOBAL_DATA}


*** Keywords ***
Say something funny
    Log  These pretzels are making me thirsty...


#  The "Log Variables" keyword also contains some potentially useful system level global variables behind the scenes.
#  ${/} = \
#  ${:} = ;
#  ${\n} =
#  ${DEBUG_FILE} = NONE
#  ${EXECDIR} = C:\Users\jagibson\Prog_Projects\explore-libraries
#  ${False} = False
#  ${GLOBAL1} = I am global variable 1
#  ${LOG_FILE} = C:\Users\jagibson\Prog_Projects\explore-libraries\results\built-in\log.html
#  ${LOG_LEVEL} = INFO
#  ${None} = None
#  ${null} = None
#  ${OUTPUT_DIR} = C:\Users\jagibson\Prog_Projects\explore-libraries\results\built-in
#  ${OUTPUT_FILE} = C:\Users\jagibson\Prog_Projects\explore-libraries\results\built-in\output.xml
#  ${PREV_TEST_MESSAGE} =
#  ${PREV_TEST_NAME} = Declare and set variables
#  ${PREV_TEST_STATUS} = PASS
#  ${REPORT_FILE} = C:\Users\jagibson\Prog_Projects\explore-libraries\results\built-in\report.html
#  ${SOME_GLOBAL_DATA} = This available everywhere
#  ${some_suite_data} = This is available within all tests in this suite
#  ${SPACE} =
#  ${SUITE_DOCUMENTATION} = Checking out the built-in library
#  &{SUITE_METADATA} = { }
#  ${SUITE_NAME} = Built in
#  ${SUITE_SOURCE} = C:\Users\jagibson\Prog_Projects\explore-libraries\tests\Built_in.robot
#  ${TEMPDIR} = C:\Users\jagibson\AppData\Local\Temp
#  ${TEST_DOCUMENTATION} =
#  ${TEST_NAME} = Logging stuff
#  @{TEST_TAGS} = [ BuiltIn ]
#  ${True} = True