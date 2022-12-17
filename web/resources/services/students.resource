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

    ${id}    Set Variable   ${response.json()}[id]

    [Return]    ${id}
    
POST Question
    [Arguments]    ${student_id}    ${question}

    ${payload}    Create Dictionary    question=${question}

    POST        http://localhost:3333/students/${student_id}/help-orders
    ...         json=${payload}
    ...         expected_status=201