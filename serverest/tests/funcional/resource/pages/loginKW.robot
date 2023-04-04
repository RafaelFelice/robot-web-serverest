*** Settings ***        
Library         SeleniumLibrary

*** Variables ***
${URL}                      https://front.serverest.dev/login
${TEXTO_LOGIN}              //h1[@class='font-robot'][contains(.,'Login')]
${EMAIL_LOGIN}              email
${PASSWORD_LOGIN}           password
${BTN_ENTRAR}               //button[@data-testid='entrar'][contains(.,'Entrar')]


*** Keywords ***
Dado que estou na page login
    Go To                            url=${URL}
    Wait Until Element Is Visible    locator=${TEXTO_LOGIN}

Quando insiro os dados:
    [Arguments]    ${EMAIL}    ${PASSWORD}
    Input Text                       locator=${EMAIL_LOGIN}       text=${EMAIL}
    Input Text                       locator=${PASSWORD_LOGIN}       text=${PASSWORD}
    Click Element                    locator=${BTN_ENTRAR}        

Então deve retornar mensagem "${MSG}"
    Wait Until Page Contains    text=${MSG}