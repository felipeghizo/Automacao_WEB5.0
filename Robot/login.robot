*** Settings ***
Resource    login_resource.robot


*** Test Cases ***
Login
    Acessar a interface web

    Usuario e senha errados
    Validar o resultado de inputs errados
    Recarregar a Página

    Usuario errado e senha certa
    Validar o resultado de inputs errados
    Recarregar a Página

    Senha errada e usuario certo
    Validar o resultado de inputs errados
    Recarregar a Página

    Usuario e senha corretos
    Validar o resultado de inputs corretos