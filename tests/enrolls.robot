*** Settings ***
Documentation        Suite de testes de matriculas de alunos
...                  Administrador uma vez logado consegue matricular alunos na academia

Resource             ../resources/base.resource

*** Test Cases ***
Deve matricular um aluno
    ${admin}    Get Fixture    admin

    ${student}    Get Fixture    student
    
    Reset Student Enroll    ${student}

    Go To Login Page
    Do Login    ${admin}

    Sleep    1

    Go To Enroll Page
    Go To Enroll Form
    Select Student     ${student}[name]
    Select Plan        ${student}[enroll][plan]
    Fill Start Date
    Submit Enroll
    Verify Toaster     Matrícula cadastrada com sucesso
