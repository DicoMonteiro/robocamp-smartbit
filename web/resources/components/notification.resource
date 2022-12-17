*** Settings ***
Documentation        Controle de notificações de pedido de ajuda

Resource         ../base.resource

*** Keywords ***
Check Notification
    [Arguments]    ${question}

    Click    xpath=(//aside//button)[1]
    Click    css=.scrollbar-container p >> text=${question}