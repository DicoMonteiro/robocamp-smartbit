*** Settings ***
Documentation        Enroll Page
...                  Keywords que representam a página de Matrícula

Resource         ../base.resource


*** Keywords ***
Go To Enroll Form
    Click    css=a[href="/matriculas/new"]

Select Student
    [Arguments]    ${student}
    Fill Text    xpath=//div[text()="Digite o nome do aluno..."]/..//input
    ...          ${student}

    Click        css=div[class$=option] >> text=${student}

Select Plan
    [Arguments]    ${plan}
    Click        xpath=//label[text()="PLANO"]/..//div[contains(text(), "Selecione")]
    Click        css=div[class$=option] >> text=${plan}

Fill Start Date

    Focus          css=input[name=start_date]
    ${start_date}    Get Start date

    FOR  ${number}  IN  @{start_date}
        Keyboard Key    press    ${number}   
    END

Submit Enroll
    Click          css=button >> text=Salvar