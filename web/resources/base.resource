*** Settings ***
Documentation        Suite que centraliza todas as keywords implementadas


Library              Browser
Library              pages/libs/get_date.py
Library              JSONLibrary
Library              RequestsLibrary

Resource             database.resource
Resource             services/sessions.resource
Resource             services/students.resource

Resource             pages/login.resource
Resource             pages/enrolls.resource

Resource             components/navbar.resource
Resource             components/toast.resource
Resource             components/notification.resource
Resource             components/popDoubt.resource


*** Keywords ***
#Helpers
Go To Login Page
    New Browser          headless=false    browser=${BROWSER}
    New Page             http://localhost:3000/
    Set Viewport Size    1280    720

Do Login
    [Arguments]    ${user}
    Fill Credentials    ${user}[email]    ${user}[password]
    Submit Credentials
    User Should Be Logged In    ${user}[name]

Go To Enroll Page
    Click    css=a[href="/matriculas"]

Get Fixture
    [Arguments]    ${fixture_file}

    ${fixtue}    Load Json From File
    ...           ${EXECDIR}/resources/fixtures/${fixture_file}.json
    ...           encoding=UTF-8

    [Return]    ${fixtue}

Screenshot
    Take Screenshot