*** Settings ***
Resource    inicializacao_resource.robot


*** Test Cases ***
Caso teste Exemplo
    Acessar a interface web
    
    Alterar Região
    Alterar Idioma

    Aviso legal sem aceitar
    Aviso legal com aceitar

    Senha fraca
    Senhas diferentes 
    Senhas válidas

    Box nCelular inválido
    Box nCelular válido

    Box email não preenchido
    Box email inválido

    Recarregar a pagina

    Alterar Região ingles

    Aviso legal com aceitar ingles

    Senhas válidas ingles

    Box nCelular válido ingles

    Box email válido ingles
    