*** Settings ***
Resource    ../Resources/Usuarios_resource.robot
Resource    ../Resources/login_resource.robot


*** Test Cases ***
Caso teste Exemplo
    Acessar a interface web
    
    Usuario e senha corretos
    Validar o resultado de inputs corretos

    Acessa menu conta
    Criar usuario