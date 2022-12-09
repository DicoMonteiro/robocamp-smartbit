*** Settings ***
Documentation        Bibliotecas e estrturuas para teste mobile


Library              AppiumLibrary


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

    Sleep    10

Finish app
    Close Application