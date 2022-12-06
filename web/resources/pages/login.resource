*** Settings ***
Documentation        Login Page
...                  Keywords que representam a página de Login

Resource         ../base.resource



*** Keywords ***
Fill Credentials
    [Arguments]    ${email}    ${password}
    
    Fill Text      css=input[placeholder="Seu e-mail"]    ${email}
    Fill Text      css=input[name=password]               ${password}

Submit Credentials
    Click          css=button >> text=Entrar no sistema

Alert Text Should Be
    [Arguments]    ${field}    ${expected_text}

    Get Text        xpath=//input[@type="${field}"]/..//span
    ...             equal    ${expected_text}

Field Type Should Be Email
    Get Attribute       css=input[placeholder="Seu e-mail"]
    ...                 type    equal    email