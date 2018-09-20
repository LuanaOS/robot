*** Settings ***
Documentation  Suite description

*** Variables ***
${HOMEPAGE}    http://www.google.com/
${BROWSER}    chrome
${DELAY_TIME}    2
${INPUT_TEXT_ID}    id=lst-ib
${ENTER_KEY}    \\13
${DAITAN_URL}    http://www.daitangroup.com/
${MENU_SERVICES}    id=menu-item-30
${SERVICES_QA}    id=menu-item-445
${QA_TEXT}    Full Service Quality Assurance & Testing Teams
${MENU_RESOURCES}    id=menu-item-28
${RESOURCES_VIDEOS}    id=menu-item-195
${A_VIDEO}    //a[@href='https://vimeo.com/139724872']
${IFRAME_VIDEO}    //div[@class='nivo-lightbox-content']
${SLEEP_TIME}    10s
${IFRAME_CLOSE}    //a[@title='Close']
${MENU_CONTACTUS}    id=menu-item-26  #//li[@id='menu-item-26']
${CONTACT_REQUEST}    //a[contains(text(),'Contact Request')]
${NEW_TAB}    http://www.daitangroup.com/form-page/

*** Keywords ***
Setting browser
    Open Browser    ${HOMEPAGE}    ${BROWSER}    #<webpage> and <browser>
    Set Selenium Speed    ${DELAY_TIME}    #set the delay time
    maximize browser window    #Maximize the browser window

Google and search
    [Arguments]    ${searchkey}    ${result}    #set arguments as <searchkey> and <result>
    input text    ${INPUT_TEXT_ID}    ${searchkey}    #<locator/id> and <input_text>
    Press Key    ${INPUT_TEXT_ID}    ${ENTER_KEY}    #<locator/id> and <Key> #ASCII code for enter key
    wait until page contains    ${result}

Enter daitan webpage
    click link    ${DAITAN_URL}

Navigation on daitan webpage
    [Arguments]    ${menu_page}
    Run Keywords   ${menu_page}


On QA
    mouse over    ${MENU_SERVICES}    #Mouse over on Services
    mouse over    ${SERVICES_QA}    #Mouse over on QA & Testing
    click element    ${SERVICES_QA}    #Click on QA & Testing
    Page Should Contain    ${QA_TEXT}    #Check if the page contains the <text>

On Resources
    mouse over    ${MENU_RESOURCES}    #Mouse over on Resources
    mouse over    ${RESOURCES_VIDEOS}    #Mouse over on Videos
    click element    ${RESOURCES_VIDEOS}    #Click on Videos
    click element    ${A_VIDEO}    #Click on 2nd video
    click element    ${IFRAME_VIDEO}    #Click on the iframe to play the video
    sleep    ${SLEEP_TIME}
    click element    ${IFRAME_CLOSE}    #Click on the x/close

On Contact Us
    click element    ${MENU_CONTACTUS}    #Click on Contact Us
    click element    ${CONTACT_REQUEST}    #Click on Contact Request
    go to    ${NEW_TAB}

