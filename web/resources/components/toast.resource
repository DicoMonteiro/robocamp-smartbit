*** Settings ***
Documentation        Toast Componente - representação das mensagens de toast

Resource         ../base.resource

*** Keywords ***
Verify Toaster
    [Arguments]    ${alert_credentials}

    Wait For Elements State
    ...            css=.Toastify__toast-body div >> text=${alert_credentials}
    ...            visible
    ...            15

    Wait For Elements State
    ...            css=.Toastify__toast-body div
    ...            detached    10

Verify Toaster Notification
    [Arguments]    ${alert_credentials}

    Wait For Elements State
    ...            css=.Toastify__toast-body div >> text=${alert_credentials}
    ...            visible
    ...            15