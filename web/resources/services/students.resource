*** Settings ***
Documentation        Consumindo a rota services students da API Rest

Resource         ../base.resource


*** Keywords ***
POST New Student
    [Arguments]    ${token}    ${payload}

    ${headers}    Create Dictionary    Authorization=${token}
    
    ${response}    POST    http://localhost:3333/students
                   ...     json=${payload}[student]
                   ...     headers=${headers}
                   ...     expected_status=201
    
    #Log To Console    ${response}

    #Log To Console    ${response.json()}