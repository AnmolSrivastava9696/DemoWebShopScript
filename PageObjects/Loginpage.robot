*** Settings ***
Documentation  This is the PageObject for login page of SUT
Library  SeleniumLibrary

*** Variables ***
${email_textfield} =  xpath=//input[@id='Email']
${password_textfield} =  xpath=//input[@id='Password']
${login_button} =  xpath=//input[@value='Log in']
${register} =  xpath=//input[@value='Register']


*** Keywords ***
Verify Loginpage
    Title Should Be  Demo Web Shop. Login
    Page Should Contain  Welcome, Please Sign In!
Login Into Account
    [Arguments]  @{credentials}
    Input Text  ${email_textfield}  ${credentials[2]}  
    Input Text  ${password_textfield}  ${credentials[3]}
    Click Element  ${login_button}  
Register Yourself
    Click Element  ${register}
Verify Error Message For Not Registered
    Page Should Contain  Login was unsuccessful. Please correct the errors and try again.
    Page Should Contain  No customer account found
Get Status Code

   
    ${status_code} =  Run Keyword And Return Status  Verify Error Message For Not Registered
    [Return]  ${status_code}
            
    
