*** Settings ***
Documentation   Casos de testes para validar a funcionalidade cadastrar usuário na página cadastrar usuários
Resource        ../resource/base.robot
Resource        ../resource/pages/usuarioKW.robot
Default Tags      @regressivo

Test Setup      Abrir browser
Test Teardown   Fechar browser

***Test Cases***
Cenário 1: Cadastrar usuário administrador com sucesso
    Dado que estou na page cadastrar usuarios
    Quando insiro os dados faker
    Então deve retornar mensagem "Cadastro realizado com sucesso"

Cenário 2: Cadastrar usuário já existente
    Dado que estou na page cadastrar usuarios
    Quando insiro os dados:    Fulano da Silva    fulano@qa.com    teste
    Então deve retornar mensagem "Este email já está sendo usado"

Cenário 3: Cadastrar usuário com os dados em branco
    Dado que estou na page cadastrar usuarios
    Quando insiro os dados:    ${EMPTY}    ${EMPTY}    ${EMPTY}
    Então deve retornar mensagem "Nome é obrigatório"
    Então deve retornar mensagem "Email é obrigatório"
    Então deve retornar mensagem "Password é obrigatório"

Cenário 4: Cadastrar usuário com o dado nome em branco
    Dado que estou na page cadastrar usuarios
    Quando insiro os dados:    ${EMPTY}    fulano@qa.com    teste
    Então deve retornar mensagem "Nome é obrigatório"

Cenário 5: Cadastrar usuário com o dado email em branco
    Dado que estou na page cadastrar usuarios
    Quando insiro os dados:    Fulado da Silva    ${EMPTY}    teste
    Então deve retornar mensagem "Email é obrigatório"

Cenário 6: Cadastrar usuário com o dado senha em branco
    Dado que estou na page cadastrar usuarios
    Quando insiro os dados:    Fulado da Silva    fulano@qa.com    ${EMPTY}
    Então deve retornar mensagem "Password é obrigatório"

Cenário 7: Cadastrar usuário com os dados nome e email em branco
    Dado que estou na page cadastrar usuarios
    Quando insiro os dados:    ${EMPTY}    ${EMPTY}    teste
    Então deve retornar mensagem "Nome é obrigatório"
    Então deve retornar mensagem "Email é obrigatório"

Cenário 8: Cadastrar usuário com os dados nome e senha em branco
    Dado que estou na page cadastrar usuarios
    Quando insiro os dados:    ${EMPTY}    fulano@qa.com    ${EMPTY}
    Então deve retornar mensagem "Nome é obrigatório"
    Então deve retornar mensagem "Password é obrigatório"

Cenário 9: Cadastrar usuário com os dados email e senha em branco
    Dado que estou na page cadastrar usuarios
    Quando insiro os dados:    Fulano da Silva    ${EMPTY}    ${EMPTY}
    Então deve retornar mensagem "Email é obrigatório"
    Então deve retornar mensagem "Password é obrigatório"

