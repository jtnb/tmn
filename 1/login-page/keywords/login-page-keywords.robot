*** Keywords ***
Open browser to Login Page
    ${BROWSER} =        Get variable value    ${BROWSER}    ${DEFAULT_BROWSER}
    ${HEADLESS} =       Get variable value    ${HEADLESS}    ${False}
    &{options} =        Create dictionary   headless=${HEADLESS}
    Open Browser        ${HOME_PAGE_URL}   browser=${BROWSER}    options=${options}

    #Save Log
    Start tracing

    #Login page is shown
    Wait Until Element Contains        xpath://h2[contains(text(),'Login Page')]        Login Page
    #Dialogs.Pause Execution  
Input a correct username and password
    Input Text        id:username        ${USERNAME_SUCCESS}
    Input Password    id:password        ${PASSWORD_SUCCESS}

Input a correct username but wrong password
    Input Text        id:username        ${USERNAME_SUCCESS}
    Input Password    id:password        ${PASSWORD_FAIL}

Input a username that did not exist
    Input Text        id:username        ${USERNAME_FAIL}
    Input Password    id:password        ${PASSWORD_FAIL}

Click Login button success
    #Login success and the message 'You logged into a secure area!' is shown
    Click Button        css:button[type='submit']
    Wait Until Element Contains        id:flash        You logged into a secure area!

Click Login button failed - Password is invalid
    #Login failed and the message 'Your password is invalid!' is shown
    Click Button        css:button[type='submit']
    Wait Until Element Contains        id:flash        Your password is invalid!

Click Login button failed - Username is invalid
    #Login failed and the message 'Your username is invalid!' is shown
    Click Button        css:button[type='submit']
    Wait Until Element Contains        id:flash        Your username is invalid!

Click Logout button
    #Go back to the Login page and the message 'You logged out of the secure area!' is shown
    Wait Until Element Contains        xpath://h2[normalize-space()='Secure Area']         Secure Area
    Click Element        xpath://a[@class='button secondary radius']
    Wait Until Element Contains        id:flash        You logged out of the secure area!

Test teardown
    # Write log file
    Stop Tracing
    Close All Browser