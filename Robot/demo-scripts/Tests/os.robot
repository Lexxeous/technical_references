*** Settings ***
Documentation  These are some file & directory tests
Resource  ../Resources/os/os.robot

# python -m robot -d Results/os/ Tests/os.robot
# python -m robot -d Results/os/ -i OperatingSystem Tests/

# Nothing extra to install
# Interact with files, folders, env variables, in you local system
# https://robotframework.org/robotframework/latest/libraries/OperatingSystem.html

*** Variables ***


*** Test Cases ***
Create Some Directories
    [Tags]  OperatingSystem
    os.Create the Base Directory
    os.Create Directory 1
    os.Create Directory 2

Create Some Files
    [Tags]  OperatingSystem
    os.Create the First File
    os.Create the Second File
    os.Create the Third File

Move a File
    [Tags]  OperatingSystem
    os.Move File 3 from Directory 2 to Directory 1

Copy a File
    [Tags]  OperatingSystem
    os.Copy File 1 from Directory 1 to Directory 2