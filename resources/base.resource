*** Settings ***
Documentation        Suite que centraliza todas as keywords implementadas


Library              Browser
Library              pages/libs/get_date.py

Resource             pages/login.resource
Resource             pages/enrolls.resource

Resource             components/navbar.resource
Resource             components/toast.resource


*** Keywords ***
#Helpers
Go To Login Page
    New Browser    headless=false    browser=chromium
    New Page       http://localhost:3000/

Do Login
    [Arguments]    ${user}
    Fill Credentials    ${user}[email]    ${user}[pass]
    Submit Credentials
    User Should Be Logged In    ${user}[name]

Go To Enroll Page
    Click    css=a[href="/matriculas"]