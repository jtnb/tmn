*** Settings ***
# Library     Dialogs
Library     PuppeteerLibrary

Test Setup        Open browser to Login Page
Test Teardown        Test teardown
Suite Teardown        Close Puppeteer

Resource    keywords/login-page-keywords.robot
Resource    variables/login-page-variables.robot

*** Test Cases ***
TC1
    [Documentation]    Login success
    [tags]    passed
    Input a correct username and password
    Click Login button success
    Click Logout button

TC2
    [Documentation]    Login failed - Password incorrect
    [tags]    failed
    Input a correct username but wrong password
    Click Login button failed - Password is invalid

TC3
    [Documentation]    Login failed - Username not found
    [tags]    failed
    Input a username that did not exist
    Click Login button failed - Username is invalid