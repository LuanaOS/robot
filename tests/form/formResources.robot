*** Settings ***
Documentation    Suite description

*** Variables ***
${FORM_URL}         https://formsmarts.com/html-form-example
${BROWSER}          chrome
${DELAY_TIME}       2
${LOCATOR_FIELDS}   //input[@placeholder="$$"]
${LOC_SELECT}       //select
${LOC_INQUIRY}      //textarea[@placeholder="Your comment"]
${LOC_CONTINUE}     //input[@name="submit"]
${LOC_TABLE}        //table
${LOC_TABLECELL}    //tbody/tr[$$]/td[1]

*** Keywords ***
Setting browser
    Open Browser    ${FORM_URL}    ${BROWSER}
    Set Selenium Speed    ${DELAY_TIME}
    Maximize Browser Window

FakerLibrary Words Generation
    [Documentation]    Use the FakerLibrary to create the variables to complete the form
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
    [Documentation]    Fill up the form and click in continue
    [Arguments]    ${firstname}    ${lastname}    ${email}    ${message}
    Select Frame    xpath=//iframe

    ${loc}=    New Locator    Your first name
    Input Text    ${loc}    ${firstname}
    ${loc}=    New Locator    Your last name
    Input Text    ${loc}    ${lastname}
    ${loc}=    New Locator    Your email address
    Input Text    ${loc}    ${email}

    Input optiondata    ${LOC_SELECT}
    Input Text    ${LOC_INQUIRY}    ${message}
    Click Element    ${LOC_CONTINUE}

String Replace
    [Documentation]    Replaces the ocurrences of '$$' for the respective strings.
    [Arguments]    ${template_string}    @{replacement_string}

    :FOR    ${string}    IN    @{replacement_string}
    \    ${template_string} =   Replace String    ${template_string}   $$   ${string}    count=1

    [Return]    ${template_string}


New Locator
    [Documentation]    Return the new locator: e.g.: //input[@placeholder="${string}"]
    [Arguments]  ${string}
    ${new_locator}=   String Replace    ${LOCATOR_FIELDS}    ${string}
    [Return]    ${new_locator}

Input optiondata
    [Documentation]    Choose random input option from the selector
    [Arguments]    ${locator}
    Click Element    ${locator}
    ${randomnumber}=    FakerLibrary.Random Int    1    3
    ${randomnumber}=    BuiltIn.Convert To String    ${randomnumber}
    Select From List By Index    ${LOC_SELECT}    ${randomnumber}
    ${subj_inq}=    Get Selected List Value    ${LOC_SELECT}
    Set Global Variable    ${G_SUBJ_INQ}    ${subj_inq}

Verify all data
    [Documentation]    Verify if the data on the table is the same as the ones inputted on the form
## TABLE WAY
#    ${fname}=    Get Table Cell    ${LOC_TABLE}    1    2
#    ${lname}=    Get Table Cell    ${LOC_TABLE}    2    2
#    Should Be Equal   ${lname}    ${G_LNAME}
#    ${email}=    Get Table Cell    ${LOC_TABLE}    3    2
#    Should Be Equal   ${email}    ${G_EMAIL}
#    ${subj__inq}=    Get Table Cell    ${LOC_TABLE}    4    2
#    Should Be Equal   ${subj__inq}    ${G_SUBJ_INQ}
#    ${inquiry}=    Get Table Cell    ${LOC_TABLE}    5    2
#    Should Be Equal   ${inquiry}    ${G_INQUIRY}

## STRING REPLACE WAY
    Run Keyword    Verify data    ${G_FNAME}    1
    Run Keyword    Verify data    ${G_LNAME}    2
    Run Keyword    Verify data    ${G_EMAIL}    3
    Run Keyword    Verify data    ${G_SUBJ_INQ}    4
    Run Keyword    Verify data    ${G_INQUIRY}    5

Verify data
    [Documentation]    Verify if the data of one single field
    [Arguments]    ${global_locator}    ${row}
    ${locator}=    String Replace    ${LOC_TABLECELL}    ${row}
    ${locator}=    Get Text   ${locator}
    Should Be Equal    ${locator}    ${global_locator}