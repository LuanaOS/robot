*** Settings ***
Library  Selenium2Library
Suite Setup  Setting browser
Suite Teardown  Close All Browsers
Documentation  This is some basic example on how to use robot with Selenium
Resource  resources.robot

*** Test Cases ***
Googling Daitan Group webpage
    [Tags]    googlensearch
    Google and search  daitan group  www.daitangroup.com

Go to daitan homepage
    [Tags]    navdaitan
    Enter daitan webpage

Navigate to QA
    [Tags]    qa
    Navigation on daitan webpage    On qa

Navigate to Resources
    [Tags]    resources
    Navigation on daitan webpage    On resources

Navigate to Contact Us
    [Tags]    contact
    Navigation on daitan webpage    On contact us