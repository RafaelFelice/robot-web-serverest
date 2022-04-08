*** Settings ***
Documentation    Suíte de teste para validar as funcionalidade de login do site front.serverest.dev
Resource    ../resources/base.robot

Test Setup       Abrir o navegador
Test Teardown    Fechar o navegador


*** Test Cases ***
CT001 - Login - sucesso
    [Documentation]  Teste para verificar se o login foi realizado com sucesso
    [Tags]           Login  Regressivo
    Acessar home page do site front.serverest.dev
    Preencher os campos: email e senha    fulano@qa.com    teste
    Clicar no botao entrar
    Validar texto "Este é seu sistema para administrar seu ecommerce."

CT002 - Login - email invalido
    [Documentation]  Teste para verificar se o login retornou com email inválido 
    [Tags]           Login  Regressivo
    Acessar home page do site front.serverest.dev
    Preencher os campos: email e senha    invalido@qa.com    teste    
    Clicar no botao entrar
    Validar texto "Email e/ou senha inválidos"

CT003 - Login - email em branco
    [Documentation]  Teste para verificar se o login retornou com email em branco
    [Tags]           Login  Regressivo
    Acessar home page do site front.serverest.dev
    Preencher os campos: email e senha    ${empty}    teste
    Clicar no botao entrar
    Validar texto "Email é obrigatório"

CT004 - Login - senha invalido
    [Documentation]  Teste para verificar se o login retornou com senha inválida
    [Tags]           Login  Regressivo
    Acessar home page do site front.serverest.dev
    Preencher os campos: email e senha    teste@qa.com    invalido    
    Clicar no botao entrar
    Validar texto "Email e/ou senha inválidos"

CT005 - Login - senha em branco
    [Documentation]  Teste para verificar se o login retornou com senha em branco
    [Tags]           Login  Regressivo
    Acessar home page do site front.serverest.dev
    Preencher os campos: email e senha    teste@qa.com    ${empty}
    Clicar no botao entrar
    Validar texto "Password é obrigatório"

CT006 - Login - email e senha em branco
    [Documentation]  Teste para verificar se o login retornou com email e senha em branco
    [Tags]           Login  Regressivo
    Acessar home page do site front.serverest.dev
    Preencher os campos: email e senha    ${empty}    ${empty}  
    Clicar no botao entrar
    Validar texto "Email é obrigatório"
    Validar texto "Password é obrigatório"
