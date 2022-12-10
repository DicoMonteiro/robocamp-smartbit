*** Settings ***
Documentation        Componente que controla os alertas

Resource         ../base.resource


*** Keywords ***
Validate Element
    [Arguments]    ${expected_text}

    Wait Until Page Contains    ${expected_text}

Click Ok Alert
    Wait Until Element Is Visible    id=android:id/button1    timeout=5
    Click Element    id=android:id/button1