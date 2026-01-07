*** Settings ***
Library    SeleniumLibrary
Variables    ../Variaveis/Variaveis.py
Variables   ../Variaveis/variaveis_conta.py

*** Variables ***
${BROWSER}    chrome

*** Keywords ***

Acessa menu conta
    ${existe}=    Run Keyword And Return Status
    ...    Wait Until Element Is Visible
    ...    css=[aria-label="Configurações"]
    ...    timeout=5s

    Run Keyword If    ${existe}
    ...    Click Element    css=[aria-label="Configurações"]
    ...    ELSE
    ...    Wait Until Element Is Visible    css=i.anticon.myicon-set    timeout=10s
    ...    Click Element    css=i.anticon.myicon-set

    Wait Until Element Is Visible    xpath=//li[contains(text(),'Sistema')]    timeout=10s
    Click Element    xpath=//li[contains(text(),'Sistema')]

    Wait Until Element Is Visible    id=ugmSet    timeout=10s
    Click Element    id=ugmSet



Criar usuario   
  FOR    ${letra}    IN    @{LETRAS}
        ${usuario}=    Set Variable    usuario_${letra}
        ${senha}=    Set Variable    senha_${letra}123
        
        # Fluxo de criação do usuário
        Click Element    css=[aria-label="Configurações"]
        Click Element    xpath=//li[contains(text(),'Sistema')]
        Click Element    id=ugmSet
        Click Element    xpath=//button[contains(.,'Adicionar')]
        
        Input Text    id=add_user_form_Name    ${usuario}
        Input Text    css=input.passwordCheck-new    ${senha}
        Input Text    css=input.passwordCheck-confirm    ${senha}
        
        Click Element    xpath=//button[contains(.,'Aplicar')]
        Wait Until Element Is Visible    css=.ant-message-success    timeout=5
        
        # Voltar para lista de usuários
        Click Element    xpath=//button[contains(.,'Voltar')] ou Wait Until Page Contains Element    xpath=//button[contains(.,'Adicionar')]
    END