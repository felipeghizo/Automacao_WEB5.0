*** Settings ***
Library    SeleniumLibrary
Variables    ../Variaveis/Variaveis.py

*** Variables ***
${BROWSER}    chrome

*** Keywords ***
Acessar a interface web
    Open Browser    ${CAMERA}    ${BROWSER}
    Wait Until Element Is Visible    class:ant-input    timeout=10

Usuario e senha errados
    Input Text    class:ant-input    ${USUARIO_ERRADO}
    Input Text    css=[id^='PasswordInput_']    admin1234
    Click Element    css=.ant-btn.ant-btn-primary.login-button

Usuario errado e senha certa
    Input Text    class:ant-input    ${USUARIO_ERRADO}
    Input Text    css=[id^='PasswordInput_']    admin123
    Click Element    css=.ant-btn.ant-btn-primary.login-button

Senha errada e usuario certo
    Input Text    class:ant-input    ${USUARIO_ERRADO}
    Input Text    css=[id^='PasswordInput_']    admin1234
    Click Element    css=.ant-btn.ant-btn-primary.login-button

Usuario e senha corretos
    Input Text    class:ant-input    ${USUARIO_CORRETO}
    Input Text    css=[id^='PasswordInput_']    ${SENHA_CORRETA}
    Click Element    css=.ant-btn.ant-btn-primary.login-button

Esqueceu a senha
    Click Element    css=.login-forget
    Wait Until Element Is Visible    css=.ant-modal-content   timeout=10
    Click Element      css=.ant-modal-content .ant-btn.ant-btn-primary
    Wait Until Page Contains    Alterar senha

Enviar email de recuperação
    Sleep    2s 
    Click Element    css=.ant-btn-default
    Wait Until Page Contains    Email enviado com sucesso

Validar o resultado de inputs errados
    Wait Until Page Contains    Wrong username or password.

Validar o resultado de inputs corretos
    Wait Until Page Contains    admin

Recarregar a Página
    Reload Page  
    Wait Until Element Is Visible    class:ant-input    timeout=10
