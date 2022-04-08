*** Settings ***
Documentation    Arquivo base do projeto
Library          SeleniumLibrary
Resource         actions/login.robot

*** Keywords ***
Abrir o navegador
    Open Browser    browser=chrome
    Maximize Browser Window

Fechar o navegador
    Capture Page Screenshot
    Close Browser 
