*** Settings ***
Library    RequestsLibrary
Suite Teardown    Delete All Sessions

*** Variables ***
${URL}        https://reqres.in
${ID_SUCCESS}        12
${ID_FAIL}           1234
${EMAIL_SUCCESS}        rachel.howell@reqres.in
${FNAME_SUCCESS}        Rachel
${LNAME_SUCCESS}        Howell
${AVATAR_SUCCESS}        https://reqres.in/img/faces/12-image.jpg

*** Keywords ***
Get user profile success
    ${resp_success}=    GET  ${URL}/api/users/${ID_SUCCESS}

    #Verify response status codeshould be '200'
    Log To Console        ${resp_success.status_code}
    Status Should Be        200

    Log To Console        ${resp_success.headers}
    Should Be Equal       ${resp_success.headers}[Content-Type]        application/json; charset=utf-8

    #Compare the response body with expected
    Log To Console        ${resp_success.content}
    Should Be Equal As Strings         ${resp_success.json()}[data][id]    ${ID_SUCCESS}        
    Should Be Equal As Strings         ${resp_success.json()}[data][email]    ${EMAIL_SUCCESS}        
    Should Be Equal As Strings         ${resp_success.json()}[data][first_name]    ${FNAME_SUCCESS}        
    Should Be Equal As Strings         ${resp_success.json()}[data][last_name]    ${LNAME_SUCCESS}        
    Should Be Equal As Strings         ${resp_success.json()}[data][avatar]    ${AVATAR_SUCCESS}   
         
Get user profile but user not found
    ${resp_fail}=        GET        ${URL}/api/users/${ID_FAIL}        expected_status=404

    #Verify response status code should be '404'
    Log To Console        ${resp_fail.status_code}
    Status Should Be        404

    #Response body should be '{}'
    Log To Console        ${resp_fail.content}
    Should Be Equal As Strings         ${resp_fail.json()}    {}        

    Log To Console        ${resp_fail.headers}
    Should Be Equal       ${resp_fail.headers}[Content-Type]    application/json; charset=utf-8    

*** Test Cases ***
TC1
    [Documentation]    Get user profile success
    [tags]    passed
    Get user profile success

TC2
    [Documentation]    Get user profile but user not found
    [tags]    failed
    Get user profile but user not found