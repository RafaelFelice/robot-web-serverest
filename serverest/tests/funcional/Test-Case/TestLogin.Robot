*** Settings ***
Documentation   Casos de testes para validar a funcionalidade de login na página login
Resource        ../resource/base.robot
Resource        ../resource/pages/loginKW.robot
Default Tags    @login

Test Setup      Abrir browser
Test Teardown   Fechar browser

***Test Cases***
Cenário 1: Realizar login com sucesso
    Dado que estou na page login
    Quando insiro os dados:    fulano@qa.com    teste
    Então deve retornar mensagem "Bem Vindo"

Cenário 2: Realizar login sem sucesso - usuario não cadastrado
    Dado que estou na page login
    Quando insiro os dados:    teste2023@qa.com    teste
    Então deve retornar mensagem "Email e/ou senha inválidos"

Cenário 3: Realizar login sem sucesso - email e senha em branco
    Dado que estou na page login
    Quando insiro os dados:     ${EMPTY}    ${EMPTY}
    Então deve retornar mensagem "Email é obrigatório"
    Então deve retornar mensagem "Password é obrigatório"

Cenário 4: Realizar login sem sucesso - email em branco
    Dado que estou na page login
    Quando insiro os dados:    ${EMPTY}    teste
    Então deve retornar mensagem "Email é obrigatório"

Cenário 5: Realizar login sem sucesso - senha em branco
    Dado que estou na page login
    Quando insiro os dados:    fulano@qa.com    ${EMPTY}
    Então deve retornar mensagem "Password é obrigatório"

Cenário 6: Realizar login sem sucesso - email incorreto
    Dado que estou na page login
    Quando insiro os dados:    teste2023@qa.com    teste
    Então deve retornar mensagem "Email e/ou senha inválidos"

Cenário 7: Realizar login sem sucesso - senha incorreta
    Dado que estou na page login
    Quando insiro os dados:    fulano@qa.com    test
    Então deve retornar mensagem "Email e/ou senha inválidos"

Cenário 8: Realizar login sem sucesso - email e senha incorretos
    Dado que estou na page login
    Quando insiro os dados:    teste2023@qa.c    test
    Então deve retornar mensagem "Email deve ser um email válido"

Cenário 9: Realizar login sem sucesso - email incorreto e senha em branco
    Dado que estou na page login
    Quando insiro os dados:    teste2023@qa.c    ${EMPTY}
    Então deve retornar mensagem "Email deve ser um email válido"
    Então deve retornar mensagem "Password é obrigatório"

Cenário 10: Realizar login sem sucesso - email em branco e senha incorreta
    Dado que estou na page login
    Quando insiro os dados:    ${EMPTY}    test
    Então deve retornar mensagem "Email é obrigatório"

