########################################################
# Author: Jonathan Alexander Gibson
# Date: November 29, 2021
# Execution Command: N/A
# Credit: Udemy Course - https://www.udemy.com/course/robot-framework-level-1/
########################################################

*** Settings ***
Documentation  Suite for general testing.
Library  SeleniumLibrary

*** Keywords ***
Pause
    BuiltIn.Sleep  3s

Init Suite
    Log  I am initializing a web suite.

Clean Suite
    Log  I am cleaning up a web suite.