*** Settings ***
Documentation        Suite de testes de autenticação
...                  Administrador deve acessar o portal de gestão de academias

Resource             ../resources/base.resource


*** Variables ***
${alert_credentials}        Suas credenciais são inválidas, por favor tente novamente!


*** Test Cases ***
Login do Administrador
    Go To Login Page
    Fill Credentials    admin@smartbit.com    qacademy
    Submit Credentials
    User Should Be Logged In    Admin


Email não cadastrado
    Go To Login Page
    Fill Credentials    404@smartbit.com    qacademy
    Submit Credentials
    Verify Toaster      ${alert_credentials}


Senha incorreta
    Go To Login Page
    Fill Credentials    admin@smartbit.com    qacademi
    Submit Credentials
    Verify Toaster      ${alert_credentials}


Senha em branco
    Go To Login Page
    Fill Credentials    admin@smartbit.com    ${EMPTY}
    Submit Credentials
    Alert Text Should Be     password    A senha é obrigatória

Email em branco
    Go To Login Page
    Fill Credentials    ${EMPTY}    qacademy
    Submit Credentials
    Alert Text Should Be     email    O e-mail é obrigatório

Email no formato incorreto
    Go To Login Page
    Fill Credentials    @.com.br    qacademy
    Submit Credentials
    Field Type Should Be Email

Email e senha são obrigatórios
    Go To Login Page    
    Submit Credentials
    Alert Text Should Be     email       O e-mail é obrigatório
    Alert Text Should Be     password    A senha é obrigatória