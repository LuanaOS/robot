*** Settings ***
Documentation    Suite description

*** Variables ***
${WEBSITE}            https://www.phptravels.net/
${BROWSER}            chrome
${DELAY_TIME}            2
${MY_ACCOUNT}        //ul[@class='nav navbar-nav navbar-right hidden-sm go-left']//li[@id='li_myaccount']//a[@class='dropdown-toggle go-text-right']
${LOGIN}             //ul[@class='nav navbar-nav navbar-right hidden-sm go-left']//ul[@class='nav navbar-nav navbar-side navbar-right sidebar go-left user_menu']//li[@id='li_myaccount']//ul[@class='dropdown-menu']//li//a[@class='go-text-right'][contains(text(),'Login')]
${EMAIL_FIELD}    //*[@id="loginfrm"]/div[1]/div[5]/div/div[1]/input
${EMAIL}     user@phptravels.com
${PASSWORD_FIELD}    //*[@id="loginfrm"]/div[1]/div[5]/div/div[2]/input
${PASSWORD}    demouser
${LOGIN_BTN}    //*[@id="loginfrm"]/button


*** Keywords ***
Setting browser
    Open Browser    ${WEBSITE}    ${BROWSER}
    Set Selenium Speed    ${DELAY_TIME}
    Maximize Browser Window

Login
    Click Element    ${MY_ACCOUNT}
    Wait Until Element Is Visible    ${LOGIN}
    Click Element    ${LOGIN}
    Input Text    ${EMAIL_FIELD}    ${EMAIL}
    Input Password    ${PASSWORD_FIELD}    ${PASSWORD}
    Click Element    ${LOGIN_BTN}
