*** Settings ***
Documentation            Suite de testes de recebimento de pedido de ajuda

Resource             ../resources/base.resource


Test Setup       Go To Login Page
Test Teardown    Screenshot


*** Test Cases ***
Deve receber uma notificação de pedido de ajuda
    
    ${admin}    Get Fixture    admin
    ${joao}     Get Fixture    joao

    Reset Student           ${joao}[student][email]

    ${token_session}    Get Service Token    ${admin}
    ${id_student}       POST New Student     ${token_session}     ${joao}

    POST Question    ${id_student}    ${joao}[question]

    Do Login    ${admin}

    Check Notification       ${joao}[question]
    Validate Notification    ${joao}[question]
    Answer Doubt             Comprando Whey Protein

    Verify Toaster Notification            Resposta enviada com sucesso

    Sleep    1

