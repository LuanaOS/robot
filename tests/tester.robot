*** Settings ***
Library  Selenium2Library
Suite Setup  Setting browser
Suite Teardown  Close All Browsers
Documentation  This is some basic example on how to use robot with Selenium
Resource  resources.robot

*** Test Cases ***
Googling Daitan Group webpage
    Google and search  daitan group  www.daitangroup.com

Go to daitan homepage
    Enter daitan webpage
    Navigation on daitan webpage    On QA
    Navigation on daitan webpage    On Resources
    Navigation on daitan webpage    On Contact Us
