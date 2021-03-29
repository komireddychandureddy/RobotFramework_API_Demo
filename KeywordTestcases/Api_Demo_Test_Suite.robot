*** Settings ***
Suite Setup       Session Creation
Resource          ../Config/super.robot

*** Test Cases ***
TC-01 Validate Register and Login New User
    [Setup]    api_common.Read Testdata from Excel    TC_01    API
    Comment    Register New Users
    Register New Users
    Comment    Login with New User
    Login with New User

TC-02 Update Registered Customer Details
    [Setup]    api_common.Read Testdata from Excel    TC_02    API
    Comment    Update Customer Details
    Create User
    Update User

TC-03 Patch existing user and delete user
    [Setup]    api_common.Read Testdata from Excel    TC_03    API
    Run Keyword If    '${id}'=='None'    Fail    Execute testcase 2 to generate id
    Comment    Patch existing user
    Patch User
    Comment    Delete existing user
    Delete User
