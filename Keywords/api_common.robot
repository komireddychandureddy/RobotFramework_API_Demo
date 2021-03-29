*** Settings ***
Resource          ../Config/super.robot

*** Keywords ***
Session Creation
    Create Session    baseURI    ${BASE_URI}    verify=True

Read Testdata from Excel
    [Arguments]    ${testcase_id}    ${sheet_name}
    ${test_data}    CustomLibrary.Get Ms Excel Row Values Into Dictionary Based On Key    ${TESTDATA_PATH}    ${testcase_id}    ${sheet_name}
    ${rowcount}    Get Length    ${test_data}
    Run Keyword If    ${rowcount}==0    Fail    Customer test data is not read from Excel file
    Set Test Variable    ${test_data}
