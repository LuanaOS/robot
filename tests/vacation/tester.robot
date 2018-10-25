*** Settings ***
Library    Selenium2Library
Suite Setup    Setting browser
Suite Teardown    Close All Browsers
Documentation    This is some basic example
Resource    resources.robot

*** Test Cases ***
Login on the page
    Login