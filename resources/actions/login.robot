*** Settings ***
Documentation    Arquivo com as ações de login
Library     SeleniumLibrary


*** Variables ***
${URL}           https://front.serverest.dev/login
${inputEmail}    email 
${inputSenha}    password
${btnEntrar}     //button[@class='btn btn-primary']

*** Keywords ***
Acessar home page do site front.serverest.dev
    Go To    url=${URL}

Preencher os campos: email e senha
    [Arguments]    ${email}    ${senha}
    Wait Until Element Is Visible    locator=${email} 
    Input Text    locator=${email}    text=${email} 
    Input Password    locator=${senha}    password=${senha} 

Clicar no botao entrar
    Wait Until Element Is Visible    locator=${btnEntrar}
    Click Element    locator=${btnEntrar}

Validar texto "${TEXTO}"
    Wait Until Page Contains    text=${TEXTO}