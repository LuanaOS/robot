*** Settings ***
Documentation  Suite description

*** Variables ***
${GOOGLE_URL}                  http://www.google.com/
${BROWSER}                     chrome
${DELAY_TIME}                  2
${SEARCH_INPUT_LOCATOR}        id=lst-ib
${ENTER_KEY}                   \\13
${DAITAN_URL}                  http://www.daitangroup.com/
${MENU_SERVICES_LOCATOR}       id=menu-item-30
${SERVICES_QA_LOCATOR}         id=menu-item-445
${QA_TEXT}                     Full Service Quality Assurance & Testing Teams
${MENU_RESOURCES_LOCATOR}      id=menu-item-28
${RESOURCES_VIDEOS_LOCATOR}    id=menu-item-195
${A_VIDEO_LOCATOR}             //a[@href='https://vimeo.com/139724872']
${IFRAME_VIDEO_LOCATOR}        //div[@class='nivo-lightbox-content']
${SLEEP_TIME}                  10s
${IFRAME_CLOSE_LOCATOR}        //a[@title='Close']
${MENU_CONTACTUS_LOCATOR}      id=menu-item-26  #//li[@id='menu-item-26']
${CONTACT_REQUEST_LOCATOR}     //a[contains(text(),'Contact Request')]
${NEW_TAB}                     http://www.daitangroup.com/form-page/
${INPUT_EMAIL_LOCATOR}         EMAIL
${EMAIL}                       lsawada@daitangroup.com
${INPUT_FNAME_LOCATOR}         FNAME
${FNAME}                       Luana
${INPUT_LNAME_LOCATOR}         LNAME
${LNAME}                       Sawada
${INPUT_COMPANY_LOCATOR}       MMERGE3
${COMPANY}                     Daitan
${INPUT_PHONE_LOCATOR}         MMERGE4
${PHONE}                       +DDI (DD) 99999-9999
${INPUT_NEWSLETTER_LOCATOR}    MMERGE6
${YESPLEASE}                   Yes Please
${INPUT_HELP_LOCATOR}          MMERGE5
${HELP}                        Welcome

*** Keywords ***
Setting browser
#To start with google search uncomment line 42 and comment line 44 more instructions on tester.robot
#Open Browser with google url
#    Open Browser    ${GOOGLE_URL}    ${BROWSER}    #<webpage> and <browser>
#Open browser with daitan url
    Open Browser    ${DAITAN_URL}    ${BROWSER}    #<webpage> and <browser>
    Set Selenium Speed    ${DELAY_TIME}    #set the delay time
    maximize browser window    #Maximize the browser window

Google and search
    [Arguments]    ${searchkey}    ${result}    #set arguments as <searchkey> and <result>
    input text    ${SEARCH_INPUT_LOCATOR}    ${searchkey}    #<locator/id> and <input_text>
    Press Key    ${SEARCH_INPUT_LOCATOR}    ${ENTER_KEY}    #<locator/id> and <Key> #ASCII code for enter key
    wait until page contains    ${result}
    click link    ${DAITAN_URL}

Navigation on daitan webpage
    [Arguments]    ${menu_page}
    Run Keyword    ${menu_page}

Click on menu-hover item
    [Arguments]    ${menu_item}    ${click_item}
    mouse over    ${menu_item}    #Mouse over ${menu_item}
    click element    ${click_item}    #Click on ${click_item}


On qa
    mouse over    ${MENU_SERVICES_LOCATOR}    #Mouse over on Services
    click element    ${SERVICES_QA_LOCATOR}    #Click on QA & Testing
    Page Should Contain    ${QA_TEXT}    #Check if the page contains the <text>

On resources
    mouse over    ${MENU_RESOURCES_LOCATOR}    #Mouse over on Resources
    click element    ${RESOURCES_VIDEOS_LOCATOR}    #Click on Videos
    click element    ${A_VIDEO_LOCATOR}    #Click on 2nd video
    click element    ${IFRAME_VIDEO_LOCATOR}    #Click on the iframe to play the video
    sleep    ${SLEEP_TIME}
    click element    ${IFRAME_CLOSE_LOCATOR}    #Click on the x/close

On contact us
    click element    ${MENU_CONTACTUS_LOCATOR}    #Click on Contact Us
    Run Keywords    Fill form

Fill form
    click element    ${CONTACT_REQUEST_LOCATOR}    #Click on Contact Request
    Select Window    url=${NEW_TAB}
    input text    ${INPUT_EMAIL_LOCATOR}    ${EMAIL}    #<locator/id> and <input_text>
    input text    ${INPUT_FNAME_LOCATOR}    ${FNAME}    #<locator/id> and <input_text>
    input text    ${INPUT_LNAME_LOCATOR}    ${LNAME}    #<locator/id> and <input_text>
    input text    ${INPUT_COMPANY_LOCATOR}    ${COMPANY}    #<locator/id> and <input_text>
    input text    ${INPUT_PHONE_LOCATOR}    ${PHONE}    #<locator/id> and <input_text>
    Select Radio Button    ${INPUT_NEWSLETTER_LOCATOR}    ${YESPLEASE}
    input text    ${INPUT_HELP_LOCATOR}    ${HELP}    #<locator/id> and <input_text>
    [Teardown]    Close Browser
