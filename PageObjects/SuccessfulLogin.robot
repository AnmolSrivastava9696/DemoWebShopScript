*** Settings ***
Documentation  This is the resource file of successful login page
Library  SeleniumLibrary
Library  ExcelLibrary    
*** Variables ***
${logout} =  xpath=//a[@href='/logout']
*** Keywords ***
Verify Successful Login 
    [Arguments]  ${roww}  @{credentials1}  
    Page Should Contain  ${credentials1[2]}
    ${message} =  Set Variable  Already Registerd User
    ${col_no} =  Set Variable  6
    Open Excel Document  filename=DemoWebShopData.xlsx  doc_id=${roww}
    Write Excel Cell  ${roww}  ${col_no}  ${message}
    Save Excel Document    filename=DemoWebShopData.xlsx  
    Close Current Excel Document     
    Click Element  ${logout}