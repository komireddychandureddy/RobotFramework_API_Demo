*** Settings ***
Resource          ../Config/super.robot

*** Keywords ***
Get All Users
    ${resp}    RequestsLibrary.Get On Session    baseURI    /users/2
    Should Be Equal As Strings    ${resp.status_code}    200

Register New Users
    ${headers}    Create Dictionary    Content-Type=application/json
    ${resp}    RequestsLibrary.Post On Session    baseURI    /api/register    data={ \ \ "email": "${test_data}[EmailId]", \ \ "password": "{test_data}[Password]" }    headers=${headers}
    Should Be Equal As Strings    ${resp.status_code}    201

Login with New User
    ${headers}    Create Dictionary    Content-Type=application/json
    ${resp}    RequestsLibrary.Post On Session    baseURI    /api/login    data={ \ \ "email": "${test_data}[EmailId]", \ \ "password": "{test_data}[Password]" }    headers=${headers}
    Should Be Equal As Strings    ${resp.status_code}    201

Create User
    ${headers}    Create Dictionary    Content-Type=application/json
    ${resp}    RequestsLibrary.Post On Session    baseURI    /api/users    data={ \ \ "name": "${test_data}[Name]", \ \ "job": "${test_data}[Job]" }    headers=${headers}
    Should Be Equal As Strings    ${resp.status_code}    201
    Dictionary Should Contain Key    ${resp.json()}    id
    ${id}    Get Variable Value    ${resp.json()['id']}
    Set Global Variable    ${id}

Update User
    ${headers}    Create Dictionary    Content-Type=application/json
    ${resp}    RequestsLibrary.Put On Session    baseURI    /api/users/${id}    data={ \ \ "name": "${test_data}[Name]", \ \ "job": "${test_data}[UpdatedJob]" }    headers=${headers}
    Should Be Equal As Strings    ${resp.status_code}    200

Patch User
    ${headers}    Create Dictionary    Content-Type=application/json
    ${resp}    RequestsLibrary.Patch On Session    baseURI    /api/users/${id}    data={ \ \ "name": "${test_data}[Name]", \ \ "job": "${test_data}[PatchJob]" }    headers=${headers}
    Should Be Equal As Strings    ${resp.status_code}    200

Delete User
    ${resp}    RequestsLibrary.Delete On Session    baseURI    /api/users/${id}
    Should Be Equal As Strings    ${resp.status_code}    204
