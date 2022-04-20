*** Settings ***
Documentation  These are some Library tests
Resource  ../Resources/library/library.robot

# python -m robot -d Results/library/ Tests/library.robot
# python -m robot -d Results/library/ -i Library Tests/

# Custom library that exists in ../Libraries/custom_library.py

*** Variables ***


*** Test Cases ***
Do a custom thing from resources
  [Tags]  Library

  library.Do a custom thing from libraries