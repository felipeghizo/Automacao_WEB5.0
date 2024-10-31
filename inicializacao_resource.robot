*** Settings ***
Library    SeleniumLibrary
Variables    variaveis_inicializacao.py  # Certifique-se de que este arquivo Python está acessível

*** Variables ***
${BROWSER}    chrome

*** Keywords ***
Acessar a interface web
    Open Browser    ${CAMERA}    ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains    Região

Alterar Região
    Click Element    css=.ant-select-selection-selected-value:nth-last-child(2)
    Click Element At Coordinates    css=.ant-select-selection-selected-value:nth-last-child(2)    0    100
    Wait Until Page Contains    Region Setting
    
Alterar Idioma
    Click Element    css=.ant-select-selection-selected-value:nth-last-child(1)
    Click Element At Coordinates    css=.ant-select-selection-selected-value:nth-last-child(1)    0    75
    Wait Until Page Contains    Config. de región
    Click Button    css=.ant-btn.init-btn-action.ant-btn-primary