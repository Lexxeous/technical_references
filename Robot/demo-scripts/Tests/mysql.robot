*** Settings ***
Documentation  These are some MySql Database tests
Resource  ../Resources/db/mysql.robot
Test Setup  mysql.Connect
Test Teardown  mysql.Disconnect

# python -m robot -d Results/mysql/ Tests/mysql.robot
# python -m robot -d Results/mysql/ -i MySqlDB Tests/

# external library, not standard

# The following 2 Python libraries are "dbapiModuleName"s in the rf-databaselibrary docs
# pip install pymssql
# pip install pymysql

# pip install robotframework-databaselibrary
# https://github.com/franz-see/Robotframework-Database-Library
# https://franz-see.github.io/Robotframework-Database-Library/

*** Variables ***


*** Test Cases ***
Test DB Connection
    [Tags]  MySqlDB
    mysql.Connect

Insert a Record
    [Tags]  MySqlDB
    mysql.Save Current Row Count
    mysql.Get Input Data
    mysql.Insert Record
    mysql.Verify New Record Added

Verify Insert Contains Correct Input Data
    [Tags]  MySqlDB
    mysql.Verify Last Record

Log All Rows
    [Tags]  MySqlDB
    mysql.Log All Rows