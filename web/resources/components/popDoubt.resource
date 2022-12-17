*** Settings ***
Documentation        Controle de notificações de pedido de ajuda

Resource         ../base.resource

*** Keywords ***
Validate Notification
    [Arguments]    ${question}

    Wait For Elements State
    ...            css=aside h3 >> text=RESPONDER DÚVIDA
    ...            visible
    ...            5

    Wait For Elements State
    ...            xpath=//aside//form[@id="answer"]/..//span >> text=${question}
    ...            visible
    ...            5

Answer Doubt
    [Arguments]    ${answer}
    
    Fill Text      css=textarea[id=answer]    ${answer}
    Click          css=form[id=answer] button >> text=Enviar resposta
