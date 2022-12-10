*** Settings ***
Documentation        Login screen

Resource         ../base.resource


*** Keywords ***
Fill Credentials
    [Arguments]    ${api_url}    ${codigo_acesso}
    
    Input Text      xpath=//android.widget.EditText[@text="Informe o endereço ip da api"]    ${api_url}
    Input Text      xpath=//android.widget.EditText[@text="Informe seu código de acesso"]    ${codigo_acesso}

Submit Credentials
    Click Element    xpath=//android.widget.TextView[@text="Entrar"]/..