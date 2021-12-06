*** Settings ***
Documentation  These are some SQL Server Database tests
Resource  ../Resources/db/sql-server.robot
Test Setup  sql-server.Connect
Test Teardown  sql-server.Disconnect

# python -m robot -d Results/sql-server/ Tests/sql-server.robot
# python -m robot -d Results/sql-server/ -i SqlServerDB Tests/

# external library, not standard

# The following 2 Python libraries are "dbapiModuleName"s in the rf-databaselibrary docs
# pip install pymssql
# pip install pymysql

# pip install robotframework-databaselibrary
# https://github.com/franz-see/Robotframework-Database-Library
# https://franz-see.github.io/Robotframework-Database-Library/

*** Variables ***


*** Test Cases ***
Insert a Record
    [Tags]  SqlServerDB
    sql-server.Save Current Row Count
    sql-server.Get Input Data
    sql-server.Insert Record
    sql-server.Verify New Record Added

Verify Insert Contains Correct Input Data
    [Tags]  SqlServerDB
    sql-server.Verify Last Record

Log All Rows
    [Tags]  SqlServerDB
    sql-server.Log All Rows    }
