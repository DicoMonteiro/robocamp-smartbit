*** Settings ***
Documentation        Bibliotecas e estrturuas para teste mobile


Library              AppiumLibrary
Library              JSONLibrary
Library              RequestsLibrary

Resource             database.resource
Resource             services/sessions.resource
Resource             services/students.resource
Resource             services/enrolls.resource
Resource             screens/login.resource
Resource             screens/help-order.resource
Resource             components/alerts.resource
Resource             components/footer.resource

*** Variables ***
${API_URL}        http://192.168.1.74:3333


*** Keywords ***
Start app
    Open Application	
    ...                http://localhost:4723/wd/hub
    ...                alias=Smartbit
    ...                automationName=UiAutomator2
    ...                platformName=Android
    ...                deviceName=Android Emulator
    ...                app=${EXECDIR}/app/smartbit-beta.apk
    ...                uuid=emulator-5556
    ...                autoGrantPermissions=true

    Wait Until Page Contains        Informe seu código de acesso

Finish app
    Capture Page Screenshot
    Close Application

#Helpers
Get Fixture
    [Arguments]    ${fixture_file}

    ${fixtue}    Load Json From File
    ...           ${EXECDIR}/resources/fixtures/${fixture_file}.json
    ...           encoding=UTF-8

    [Return]    ${fixtue}