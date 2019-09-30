*** Settings ***
Documentation  This is the resource file for all the common activities for tests of SUT
Library  SeleniumLibrary


*** Variables ***

*** Keywords ***
Open Chrome Browser
    [Documentation]  This is the common activity for opening the chrome browser
    Open Browser  about:blank  chrome
    Maximize Browser Window
Close The Browser
	[Documentation]  This is the common activity for closing the chrome browser
    Close Browser