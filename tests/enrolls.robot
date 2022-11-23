*** Settings ***
Documentation        Suite de testes de matriculas de alunos
...                  Administrador uma vez logado consegue matricular alunos na academia

Resource             ../resources/base.resource


*** Test Cases ***
Deve matricular um aluno
    ${admin}    Create Dictionary
    ...         name=Admin
    ...         email=admin@smartbit.com
    ...         pass=qacademy
    
    
    Go To Login Page
    Do Login    ${admin}

    Go To Enroll Page
    Go To Enroll Form
    Select Student     Falcão
    Select Plan        Smart
    Fill Start Date

    Sleep    10