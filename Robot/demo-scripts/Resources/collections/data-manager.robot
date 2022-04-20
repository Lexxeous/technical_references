*** Settings ***
Documentation  Use this layer to get data from external files
Library  ../../Libraries/collections/read_csv_file.py


*** Keywords ***
Get CSV Data
    [Arguments]  ${FilePath}
    ${Data} =  Read CSV File  ${FilePath}
    [Return]  ${Data}