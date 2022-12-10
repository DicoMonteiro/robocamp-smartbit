*** Settings ***
Documentation        Suite de testes da tela de login

Resource             ../resources/base.resource

Test Setup       Start app
Test Teardown    Finish app

*** Variables ***
${msg_alert}        Acesso não autorizado! Entre em contato com a equipe de atendimento.


*** Test Cases ***
Deve logar com sucesso no app Smartbit
   
    ${falcao}    Get Fixture    falcao

    Fill Credentials    ${API_URL}     ${falcao}[student][id]
    Submit Credentials
    Validate Element    Olá, ${falcao}[student][name]!

Login sem sucesso - Código de Acesso inexistente ou inválido

    ${falcao}    Get Fixture    falcao

    Fill Credentials    ${API_URL}     9999
    Submit Credentials
    Validate Element    ${msg_alert}

Login sem sucesso - Código de Acesso negativo

    ${falcao}    Get Fixture    falcao

    Fill Credentials    ${API_URL}     -1
    Submit Credentials
    Validate Element    ${msg_alert}

Login sem sucesso - Código de Acesso alfanumérico

    ${falcao}    Get Fixture    falcao

    Fill Credentials    ${API_URL}     abc123
    Submit Credentials
    Validate Element    ${msg_alert}

Login sem sucesso - Sem preencher Código de Acesso e o Endereço de Ip da API

    ${falcao}    Get Fixture    falcao

    Submit Credentials
    Validate Element    Por favor informe endereço da API!

Login sem sucesso - Sem preencher Código de Acesso

    ${falcao}    Get Fixture    falcao
    
    Fill Credentials    ${API_URL}     ${EMPTY}
    Submit Credentials
    Validate Element    Por favor informe o seu código de acesso!