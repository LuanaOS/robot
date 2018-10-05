*** Settings ***
Library    FakerLibrary
Library    Selenium2Library
Library    String
Documentation    This is some basic example on how to use robot with FakerLibrary
Suite Setup    Setting browser
Suite Teardown    Close All Browsers
Resource    formResources.robot

*** Test Cases ***
Words Generation and Fill up form
    [Tags]    wordsgeneration
    FakerLibrary Words Generation

Check out the information
    [Tags]    checkinfo
    Verify all data
    [Teardown]    Close Browser