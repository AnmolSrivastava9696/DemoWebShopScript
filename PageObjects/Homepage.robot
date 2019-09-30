*** Settings ***
Documentation  This is the documentation for PageObjects of homepage
Library  SeleniumLibrary
*** Variables ***
${login_link} =  xpath=//a[@href='/login']
${demowebshop_image} =  xpath=//img[@src='/Themes/DefaultClean/Content/images/logo.png']  
*** Keywords ***
Go To Homepage
    Go To  http://demowebshop.tricentis.com/
Verify Homepage
    Title Should Be  Demo Web Shop
    Page Should Contain Element  ${login_link}
    Page Should Contain Element  ${demowebshop_image}
Go To Login Tab
    Click Link  ${login_link}
    
    
    
