*** Settings ***
Documentation        Verifica se a aplicação está online.

Resource             ../resources/base.resource


*** Test Cases ***
Portal Admin deve estar online
    Go To Login Page
    Get Text       h1    contains    Painel do Administrador
    Sleep          1