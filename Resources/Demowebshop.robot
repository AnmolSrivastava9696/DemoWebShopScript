*** Settings ***
Documentation  Details about user activities on SUT
Resource  ../PageObjects/Homepage.robot
Resource  ../PageObjects/Loginpage.robot
Resource  ../PageObjects/Registerpage.robot
Resource  ../PageObjects/SuccessfulLogin.robot
*** Variables ***
*** Keywords ***
User Open Homepage
    Go To Homepage
    Verify Homepage
User Go To Login Tab
    Go To Login Tab
User Registers
    [Arguments]  ${row}  @{creden}  
    Register Yourself
    Enter Credentials    @{creden}
    Verify Registration    ${row}  @{creden}
 
User Attempts Login
    [Arguments]  ${roww}  @{credentialss}  
    Login Into Account  @{credentialss}
    ${booool} =  Get Status Code
    Run Keyword If  ${booool}  User Registers  ${roww}  @{credentialss}  ELSE  Verify Successful Login  ${roww}  @{credentialss}                 
   
    