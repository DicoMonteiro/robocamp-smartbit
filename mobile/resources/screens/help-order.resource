*** Settings ***
Documentation        Dash screen

Resource         ../base.resource


*** Keywords ***
Create Student Mass
    [Arguments]    ${admin}    ${adriano}

    Reset Student    ${adriano}[student][email]
    
    ${token_session}    Get Service Token    ${admin}
    ${id_student}       POST New Student     ${token_session}     ${adriano}

    ${id_plan}    GET Plan    ${token_session}    ${adriano}
    POST New Enroll    ${token_session}    ${id_plan}    ${id_student}

    [Return]    ${id_student}

Request Doubt
    Wait Until Page Contains        Enviar dúvida
    Click Text       Enviar dúvida

Write Your Help
    [Arguments]    ${text_help}

    Wait Until Element Is Visible    xpath=//android.widget.EditText[@text="Escreva sua dúvida aqui"]    timeout=5
    Input Text    xpath=//android.widget.EditText[@text="Escreva sua dúvida aqui"]    ${text_help}

Send Help
    Wait Until Page Contains        Enviar
    Click Text       Enviar
