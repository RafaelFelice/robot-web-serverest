*** Settings ***        
Resource    ../base.robot

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

Quando insiro os dados faker
    ${NOMEFAKE}                      FakerLibrary.Name
    ${EMAILFAKE}                     FakerLibrary.Email
    ${SENHAFAKE}                     FakerLibrary.Password

    Wait Until Element Is Visible    locator=${NOME_USUARIO}
    Input Text                       locator=${NOME_USUARIO}        text=${NOMEFAKE}
    Wait Until Element Is Visible    locator=${EMAIL_USUARIO}
    Input Text                       locator=${EMAIL_USUARIO}       text=${EMAILFAKE}
    Wait Until Element Is Visible    locator=${SENHA_USUARIO}
    Input Text                       locator=${SENHA_USUARIO}       text=${EMAILFAKE}
    Wait Until Element Is Visible    locator=${CB_ADM}
    Click Element                    locator=${CB_ADM}
    Wait Until Element Is Visible    locator=${BTN_CADASTRAR}
    Click Element                    locator=${BTN_CADASTRAR}
    
Quando insiro os dados:
    [Arguments]    ${NAME}    ${EMAIL}    ${PASSWORD}
    Wait Until Element Is Visible    locator=${NOME_USUARIO}
    Input Text                       locator=${NOME_USUARIO}        text=${NAME}
    Wait Until Element Is Visible    locator=${EMAIL_USUARIO}
    Input Text                       locator=${EMAIL_USUARIO}       text=${EMAIL}
    Wait Until Element Is Visible    locator=${SENHA_USUARIO}
    Input Text                       locator=${SENHA_USUARIO}       text=${PASSWORD}
    Wait Until Element Is Visible    locator=${CB_ADM}
    Click Element                    locator=${CB_ADM}
    Wait Until Element Is Visible    locator=${BTN_CADASTRAR}
    Click Element                    locator=${BTN_CADASTRAR}
    
Então deve retornar mensagem "${MSG}"
    Wait Until Page Contains    text=${MSG}
    