*** Settings ***
Documentation        Suite de testes de matriculas de alunos
...                  Administrador uma vez logado consegue matricular alunos na academia

Resource             ../resources/base.resource

Test Setup       Go To Login Page
Test Teardown    Screenshot

*** Test Cases ***
Deve matricular um aluno

    ${admin}      Get Fixture    admin
    ${student}    Get Fixture    falcao
    
    Reset Student           ${student}[student][email]

    ${token_session}    Get Service Token    ${admin}
    POST New Student    ${token_session}     ${student}

    Do Login    ${admin}

    Sleep    1

    Go To Enroll Page
    Go To Enroll Form
    Select Student     ${student}[student][name]
    Select Plan        ${student}[enroll][plan]
    Fill Start Date
    Submit Enroll
    Verify Toaster     Matrícula cadastrada com sucesso
