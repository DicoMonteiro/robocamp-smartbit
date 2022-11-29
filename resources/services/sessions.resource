*** Settings ***
Documentation        Consumindo a rota services sessions da API Rest

Resource         ../base.resource

*** Keywords ***
Get Service Token
    [Arguments]    ${payload}
    
    ${response}    POST    http://localhost:3333/sessions
                   ...     json=${payload}
                   ...     expected_status=200
    

    #Log To Console    ${response.json()}
    #Log To Console    ${response.json()}[token]

    ${token}    Set Variable    Bearer ${response.json()}[token]

    [Return]    ${token}