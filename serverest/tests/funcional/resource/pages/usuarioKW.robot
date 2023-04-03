*** Settings ***        
Library         SeleniumLibrary

*** Variables ***
${URL}                      https://front.serverest.dev/cadastrarusuarios
${BTN_CADASTRAR}            //button[contains(.,'Cadastrar')]
${TEXTO_CADASTRAR}          //h2[@class='font-robot'][contains(.,'Cadastro')]
${NOME_USUARIO}             nome
${EMAIL_USUARIO}            email
${SENHA_USUARIO}            password
${CB_ADM}                   administrador


*** Keywords ***
Dado que estou na page cadastrar usuarios
    Go To                           url=${URL}
    Wait Until Element Is Visible   locator=${TEXTO_CADASTRAR}

Quando insiro os dados:
    [Arguments]    ${NAME}    ${EMAIL}    ${PASSWORD}
    Input Text                       locator=${NOME_USUARIO}        text=${NAME}
    Input Text                       locator=${EMAIL_USUARIO}       text=${EMAIL}
    Input Text                       locator=${SENHA_USUARIO}       text=${PASSWORD}
    Click Element                    locator=${CB_ADM}
    Click Element                    locator=${BTN_CADASTRAR}
    
Então deve retornar mensagem "${MSG}"
    Wait Until Page Contains    text=${MSG}
    