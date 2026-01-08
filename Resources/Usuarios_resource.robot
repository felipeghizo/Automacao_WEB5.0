*** Settings ***
Library    SeleniumLibrary
Variables  ../Variaveis/Variaveis.py
Variables  ../Variaveis/variaveis_conta.py

*** Variables ***
${BROWSER}    chrome

*** Keywords ***
Clique Seguro
    [Arguments]    ${locator}

    # Aguarda qualquer modal do Ant Design sumir
    Run Keyword And Ignore Error
    ...    Wait Until Element Is Not Visible    css=.ant-modal-wrap    5s

    Wait Until Element Is Visible    ${locator}    10s
    Scroll Element Into View         ${locator}
    Sleep    300ms

    ${ok}=    Run Keyword And Return Status
    ...    Click Element    ${locator}

    Run Keyword If    not ${ok}
    ...    Clique JS    ${locator}


Clique JS
    [Arguments]    ${locator}
    ${element}=    Get WebElement    ${locator}
    Execute Javascript    arguments[0].click();    ARGUMENTS    ${element}


Acessa menu conta
    ${existe}=    Run Keyword And Return Status
    ...    Wait Until Element Is Visible    css=[aria-label="Configurações"]    5s

    Run Keyword If    ${existe}
    ...    Clique Seguro    css=[aria-label="Configurações"]

    Run Keyword If    not ${existe}
    ...    Clique Seguro    css=i.anticon.myicon-set

    Wait Until Element Is Visible    xpath=//li[contains(text(),'Sistema')]    10s
    Clique Seguro    xpath=//li[contains(text(),'Sistema')]

    Wait Until Element Is Visible    id=ugmSet    10s
    Clique Seguro    id=ugmSet


Criar usuario
    FOR    ${letra}    IN    @{LETRAS}
        ${usuario}=    Set Variable    usuario_${letra}
        ${senha}=      Set Variable    senha_${letra}123

        ${existe}=    Run Keyword And Return Status
        ...    Wait Until Element Is Visible
        ...    xpath=//button[.//span[text()='Adicionar']]    10s

        Run Keyword If    not ${existe}
        ...    Exit For Loop

        ${habilitado}=    Run Keyword And Return Status
        ...    Element Should Be Enabled
        ...    xpath=//button[.//span[text()='Adicionar']]

        Run Keyword If    not ${habilitado}
        ...    Exit For Loop

        Clique Seguro
        ...    xpath=//button[.//span[text()='Adicionar']]

        Wait Until Element Is Visible    id=add_user_form_Name    10s
        Input Text    id=add_user_form_Name    ${usuario}
        Input Text    css=input.passwordCheck-new    ${senha}
        Input Text    css=input.passwordCheck-confirm    ${senha}

        Clique Seguro
        ...    xpath=//div[contains(@class,'ant-modal')]//button[.//span[text()='Aplicar']]

        Wait Until Element Is Not Visible
        ...    css=.ant-modal-wrap    10s
    END
