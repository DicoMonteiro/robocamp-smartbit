*** Settings ***
Documentation        Componente que controla o footer

Resource         ../base.resource


*** Keywords ***
Request Help
    Wait Until Element Is Visible    xpath=//android.widget.TextView[@text="Pedir ajuda"]/..    timeout=5
    Click Element    xpath=//android.widget.TextView[@text="Pedir ajuda"]/..