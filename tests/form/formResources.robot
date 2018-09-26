*** Settings ***
Documentation    Suite description

*** Variables ***
${FORM_URL}        https://formsmarts.com/html-form-example
${BROWSER}         chrome
${DELAY_TIME}      2
${LOC_FNAME}       //input[@placeholder="Your first name"]
${LOC_LNAME}       //input[@placeholder="Your last name"]
${LOC_EMAIL}       //input[@placeholder="Your email address"]
${LOC_SELECT}      //select
#${LOC_SUBJ_INQ}    //option[text()="Select an option:"]
${LOC_INQUIRY}     //textarea[@placeholder="Your comment"]
${LOC_CONTINUE}    //input[@name="submit"]
${LOC_TABLE}       //table

*** Keywords ***
Setting browser
    Open Browser    ${FORM_URL}    ${BROWSER}
    Set Selenium Speed    ${DELAY_TIME}
    Maximize Browser Window

FakerLibrary Words Generation
    ${fname}=    FakerLibrary.First Name
    ${lname}=    FakerLibrary.Last Name

    ${flettername}=    String.Get Substring    ${fname}    0    1
    ${email}=    Catenate    SEPARATOR=    ${flettername}    ${lname}
    ${emaildomain}=    FakerLibrary.Free Email Domain
    ${email}=    Catenate    SEPARATOR=@    ${email}    ${emaildomain}
    ${email}=    String.Convert To Lowercase    ${email}

    ${inquiry}=    FakerLibrary.Text    100

    Run Keyword    Fill up form    ${fname}    ${lname}    ${email}    ${inquiry}
    Set Global Variable    ${G_FNAME}    ${fname}
    Set Global Variable    ${G_LNAME}    ${lname}
    Set Global Variable    ${G_EMAIL}    ${email}
    Set Global Variable    ${G_INQUIRY}    ${inquiry}

Fill up form
    [Arguments]    ${firstname}    ${lastname}    ${email}    ${message}
    Select Frame    xpath=//iframe
    Input Text    ${LOC_FNAME}    ${firstname}
    Input Text    ${LOC_LNAME}    ${lastname}
    Input Text    ${LOC_EMAIL}    ${email}
    Input optiondata    ${LOC_SELECT}
    Input Text    ${LOC_INQUIRY}    ${message}
    Click Element    ${LOC_CONTINUE}

Input optiondata
    [Arguments]    ${locator}
    Click Element    ${locator}
    ${randomnumber}=    FakerLibrary.Random Int    1    3
    ${randomnumber}=    BuiltIn.Convert To String    ${randomnumber}
    Select From List By Index    ${LOC_SELECT}    ${randomnumber}
    ${subj_inq}=    Get Selected List Value    ${LOC_SELECT}
    Set Global Variable    ${G_SUBJ_INQ}    ${subj_inq}

Verify data
    ${fname}=    Get Table Cell    ${LOC_TABLE}    1    2
    Should Be Equal   ${fname}    ${G_FNAME}
    ${lname}=    Get Table Cell    ${LOC_TABLE}    2    2
    Should Be Equal   ${lname}    ${G_LNAME}
    ${email}=    Get Table Cell    ${LOC_TABLE}    3    2
    Should Be Equal   ${email}    ${G_EMAIL}
    ${subj__inq}=    Get Table Cell    ${LOC_TABLE}    4    2
    Should Be Equal   ${subj__inq}    ${G_SUBJ_INQ}
    ${inquiry}=    Get Table Cell    ${LOC_TABLE}    5    2
    Should Be Equal   ${inquiry}    ${G_INQUIRY}
