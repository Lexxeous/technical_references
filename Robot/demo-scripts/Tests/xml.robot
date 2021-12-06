*** Settings ***
Documentation  These are some XML tests
Resource  ../Resources/xml/breakfast-menu.robot

# python -m robot -d Results/xml/ Tests/xml.robot
# python -m robot -d Results/xml/ -i XML Tests/

# internal, standard, nothing extra to install
# https://robotframework.org/robotframework/latest/libraries/XML.html

*** Variables ***


*** Test Cases ***
Verify Menu Count
    [Tags]  XML
    breakfast-menu.Should be one menu in the file

Verify Root
    [Tags]  XML
    breakfast-menu.Verify Menu Name

Verify Food Count
    [Tags]  XML
    breakfast-menu.Verify Food Count

Verify First Food
    [Tags]  XML
    breakfast-menu.Verify First Food Name
    breakfast-menu.Verify First Food Price
    breakfast-menu.Verify First Food Calories

Add a Food
    [Tags]  XML
    breakfast-menu.Add New Food

Verify New Food Was Added
    [Tags]  XML
    breakfast-menu.Verify New Food Exists