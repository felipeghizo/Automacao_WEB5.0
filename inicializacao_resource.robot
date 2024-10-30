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
    Click Element    css=.ant-select-selection-item  
    # Obtendo o elemento onde queremos mover o mouse
    ${elemento}    Get WebElement    css=.ant-select-selection-item
    
    # Usando JavaScript para mover o mouse 50px para baixo
    ${js}    Set Variable    var rect = arguments[0].getBoundingClientRect(); var event = new MouseEvent('mousemove', {clientX: rect.left, clientY: rect.top + 50}); document.dispatchEvent(event);
    Execute JavaScript    ${js}    ${elemento}

    Sleep    5s  # Pausa para observar o movimento