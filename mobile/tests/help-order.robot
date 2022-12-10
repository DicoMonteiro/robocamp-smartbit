*** Settings ***
Documentation        Suite de testes de pedido de ajuda

Resource             ../resources/base.resource

Test Setup       Start app
Test Teardown    Finish app

*** Variables ***
${msg_sucsess}        Recebemos a sua dúvida. Agora é só aguardar até 24 horas para receber o nosso feedback.

*** Test Cases ***
Deve poder solicitar ajuda

    ${admin}      Get Fixture    admin
    ${adriano}    Get Fixture    adriano

    ${id_student}      Create Student Mass    ${admin}    ${adriano}

    Fill Credentials    ${API_URL}     ${id_student}
    Submit Credentials
    Validate Element    Olá, ${adriano}[student][name]!
    Click Ok Alert

    Request Help
    Request Doubt
    Write Your Help     ${adriano}[help]
    Send Help
    Validate Element    ${msg_sucsess}

