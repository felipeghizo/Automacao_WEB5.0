*** Settings ***
Library    SeleniumLibrary
Library    XML
Variables    Variaveis.py  # Certifique-se de que este arquivo Python está acessível

*** Variables ***
${BROWSER}    chrome

*** Keywords ***
Acessar a interface web
    Open Browser    ${CAMERA}    ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains    Região

Alterar Região
    Wait Until Page Contains    Região
    Click Element    css=.ant-select-selection-selected-value:nth-last-child(2)
    Click Element At Coordinates    css=.ant-select-selection-selected-value:nth-last-child(2)    0    100
    Wait Until Page Contains    Region

Alterar Região ingles
    Wait Until Page Contains    Região
    Click Element    css=.ant-select-selection-selected-value:nth-last-child(2)
    Click Element At Coordinates    css=.ant-select-selection-selected-value:nth-last-child(2)    0    100
    Wait Until Page Contains    Region
    Click Button    css=.ant-btn.init-btn-action.ant-btn-primary

Alterar Idioma
    Click Element    css=.ant-select-selection-selected-value:nth-last-child(1)
    Click Element At Coordinates    css=.ant-select-selection-selected-value:nth-last-child(1)    0    75
    Wait Until Page Contains    Config. de región
    Click Button    css=.ant-btn.init-btn-action.ant-btn-primary

Aviso legal sem aceitar
    Wait Until Page Contains    Descargo de responsabilidad
    Click Element    css=.ant-btn.init-btn-action.ant-btn-primary
    Sleep    2s

Aviso legal com aceitar
    Wait Until Page Contains    Descargo de responsabilidad
    Click Element    css=.ant-checkbox-input
    Click Element    css=.ant-btn.init-btn-action.ant-btn-primary
    Sleep    2s

Aviso legal com aceitar ingles
    Wait Until Page Contains    Software License Agreement
    Click Element    css=.ant-checkbox-input
    Click Element    css=.ant-btn.init-btn-action.ant-btn-primary
    Sleep    2s

Senha fraca
    Wait Until Page Contains    Config de la contraseña
    Input Text    css=[id^='PasswordInput_']    a
    Wait Until Page Contains    La contraseña debe ser de 8 a 32 caracteres, incluyendo al menos dos de las siguientes categorías: números, mayúsculas, minúsculas y caracteres especiales (caracteres como ' " ; : & no deben utilizarse). 
    Input Text    css=[class^='ant-input false passwordCheck-confirm']    a
    Click Element    css=.ant-checkbox-input:nth-of-type(1)
    Click Element    css=.ant-checkbox.ant-checkbox-checked:nth-of-type(1)
    Click Element    css=.ant-btn.init-btn-action.ant-btn-primary
    Wait Until Page Contains    La contraseña debe ser de 8 a 32 caracteres, incluyendo al menos dos de las siguientes categorías: números, mayúsculas, minúsculas y caracteres especiales (caracteres como ' " ; : & no deben utilizarse). 

Senhas diferentes
    Wait Until Page Contains    Config de la contraseña
    Input Text    css=[id^='PasswordInput_']    a
    Wait Until Page Contains    La contraseña debe ser de 8 a 32 caracteres, incluyendo al menos dos de las siguientes categorías: números, mayúsculas, minúsculas y caracteres especiales (caracteres como ' " ; : & no deben utilizarse). 
    Input Text    css=[class^='ant-input false passwordCheck-confirm']    b
    Wait Until Page Contains    Las contraseñas no son iguales.
    Click Element    css=.ant-btn.init-btn-action.ant-btn-primary
    Wait Until Page Contains    Las contraseñas no son iguales.

Senhas válidas
    Wait Until Page Contains    Config de la contraseña
    Clear Element Text    css=[id^='PasswordInput_']
    Clear Element Text   css=[class^='ant-input false passwordCheck-confirm']
    Input Text    css=[id^='PasswordInput_']    admin123
    Input Text    css=[class^='ant-input false passwordCheck-confirm']    admin123

Senhas válidas ingles
    Wait Until Page Contains    Password Setting
    Clear Element Text    css=[id^='PasswordInput_']
    Clear Element Text   css=[class^='ant-input false passwordCheck-confirm']
    Input Text    css=[id^='PasswordInput_']    admin123
    Input Text    css=[class^='ant-input false passwordCheck-confirm']    admin123

Box nCelular inválido
    Wait Until Page Contains    Config de la contraseña
    Click Element    css=.ant-checkbox-input:nth-of-type(1)
    Click Element    css=.ant-btn.init-btn-action.ant-btn-primary 
    Wait Until Page Contains    Error de formato del número de teléfono.
  
Box nCelular válido
    Wait Until Page Contains    Config de la contraseña
    Input Text     css=.ant-col.ant-col-9.labelSelect-label-dark input    123456789

Box nCelular válido ingles
    Wait Until Page Contains    Password Setting
    Input Text     css=.ant-col.ant-col-9.labelSelect-label-dark input    123456789

Box email não preenchido
    Wait Until Page Contains    Config de la contraseña
    Click Element    css=.fn-center li:nth-last-of-type(1) input
    Click Element    css=.ant-btn.init-btn-action.ant-btn-primary 
    Wait Until Page Contains    Error del Formato del Email

Box email inválido
    Wait Until Page Contains    Config de la contraseña
    Input Text    css=.fn-center li:nth-last-of-type(1) .ant-col.ant-col-11.labelSelect-label-dark input    testeçlaskdjf
    Click Element    css=.ant-btn.init-btn-action.ant-btn-primary 
    Wait Until Page Contains    Error del Formato del Email

Box email válido
    Wait Until Page Contains    Config de la contraseña
    Input Text    css=.fn-center li:nth-last-of-type(1) .ant-col.ant-col-11.labelSelect-label-dark input    teste@intelbras.com.br
    Click Element    css=.init-steps-action.fn-textcenter .ant-btn.init-btn-action.ant-btn-primary
    Wait Until Page Contains    Inicialización exitosa.

Box email válido ingles
    Wait Until Page Contains    Password Setting
    Input Text    css=.fn-center li:nth-last-of-type(1) .ant-col.ant-col-11.labelSelect-label-dark input    teste@intelbras.com.br
    Click Element    css=.init-steps-action.fn-textcenter .ant-btn.init-btn-action.ant-btn-primary
    Wait Until Page Contains    Initialization succedded.

Recarregar a pagina
    Reload Page