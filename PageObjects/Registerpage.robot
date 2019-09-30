*** Settings ***
Documentation  This is the pageobject file for registerpage of SUT
Library  SeleniumLibrary
Library  ExcelLibrary
*** Variables ***
${email} =  xpath=//input[@id='Email']
${password} =  xpath=//input[@id='Password']
${firstname} =  xpath=//input[@id='FirstName']
${lastname} =  xpath=//input[@id='LastName']
${confirmpassword} =  xpath=//input[@id='ConfirmPassword']
${register} =  xpath=//input[@id='register-button']
${logout} =  xpath=//a[@href='/logout']
*** Keywords ***
Enter Credentials
    [Arguments]  @{credentials}
    ${base} =  Set Variable  xpath=//input[@id='gender-
    ${tail} =  Set Variable  ']
    ${gender} =  Set Variable  ${base}${credentials[4]}${tail}
    Click Element  ${gender}  
    Input Text  ${firstname}  ${credentials[0]}  
    Input Text  ${lastname}  ${credentials[1]}
    Input Text  ${email}  ${credentials[2]}
    Input Text  ${password}  ${credentials[3]}
    Input Text  ${confirmpassword}  ${credentials[3]}
    Click Element  ${register}
Verify Registration
    [Arguments]  ${row}  @{credentials1}
    Page Should Contain  ${credentials1[2]}  
    Page Should Contain  Your registration completed
    ${message} =  Set Variable  New User Registered
    ${col_no} =  Set Variable  6
    Open Excel Document  filename=DemoWebShopData.xlsx  doc_id=${row}
    Write Excel Cell  ${row}  ${col_no}  ${message}
    Save Excel Document    filename=DemoWebShopData.xlsx  
    Close Current Excel Document    
    Click Link  ${logout}