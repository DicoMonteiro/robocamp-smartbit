*** Settings ***
Documentation        Consumindo a rota services enrolls da API Rest

Resource         ../base.resource
Library          DateTime

*** Keywords ***
GET Plan
    [Arguments]    ${token}    ${payload}

    ${headers}    Create Dictionary    Authorization=${token}
    
    ${response}    GET    http://localhost:3333/plans
                   ...     headers=${headers}
                   ...     params=title=${payload}[enroll][plan]
                   ...     expected_status=200

    ${id_plan}    Set Variable   ${response.json()}[data][0][id]

    [Return]    ${id_plan}

POST New Enroll
    [Arguments]    ${token}    ${id_plan}    ${id_student}

    ${start_date}    Get Current Date

    &{payload}    Create dictionary
    ...           start_date=${start_date}
    ...           plan_id=${id_plan}
    ...           student_id=${id_student}

    ${headers}    Create Dictionary    Authorization=${token}
    
    ${response}    POST    http://localhost:3333/enrollments
                   ...     json=${payload}
                   ...     headers=${headers}
                   ...     expected_status=201
    
    #Log To Console    ${response}

    #Log To Console    ${response.json()}