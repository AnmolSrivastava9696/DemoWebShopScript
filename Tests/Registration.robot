*** Settings ***
Documentation  This is the test suite for automating demowebshop site
Resource  ../Resources/Commons.robot
Resource  ../Resources/Demowebshop.robot
Resource  ../DataManager/GetData.robot
Test Setup  Open Chrome Browser
Test Teardown  Close The Browser
*** Variables ***

*** Test Cases ***
Test Case For Login Attempt For Both Registered And Unregistered User
    User Open Homepage
    FOR  ${row}  IN RANGE  2  8  
    @{c}  Read from Excel File  ${row}
    User Go To Login Tab  
    User Attempts Login  ${row}  @{c}  
    END    