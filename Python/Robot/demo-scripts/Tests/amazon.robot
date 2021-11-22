*** Settings ***
Documentation   Test checkout for guest user on Amazon
Library Selenium2Library

*** Variables ***
${Browser} = chrome

*** Test Cases ***
Guest must be logged in to check out
  [Documentation]   Attempt to checkout on Amazon without logging in
  Open Browser https://www.amazon.com ${Browser}

  # <span id="nav-link-accountList-nav-line-1" class="nav-line-1 nav-progressive-content">Hello, Sign in</span>
  Wait Until Page Contains Hello, Sign in

  Input Text id=twotabsearchtextbox Ferrari 458

  Click Buttonxpath=//*[@id="nav-search"]/form/div[2]/div/input

  Wait Until Page Contains results for "Ferrari 458"

  Close Browser
