*** Settings ***
Library     SeleniumLibrary
Library     FakerLibrary

*** Variables ***
${BASE_URL}                             https://front.serverest.dev
${BROWSER}                              chrome


*** Keywords ***
Abrir browser
    Open Browser    ${BASE_URL}    ${BROWSER}
    Maximize Browser Window
    

Fechar browser
    Capture Page Screenshot
    Close browser

