*** Settings ***
Documentation        Gerenciando a massa de testes atraves do banco de dados


Library              DatabaseLibrary


*** Keywords ***
Connect To Postgres
    Connect To Database    psycopg2
    ...                    uxthzzwk
    ...                    uxthzzwk
    ...                    XJGELdFUskfJkTRi8Hi0-RcPOlvn6W6P
    ...                    babar.db.elephantsql.com
    ...                    5432


Select Student Where email
    [Arguments]    ${email}

    ${query}       Set Variable
    ...            SELECT * FROM public.students WHERE email = '${email}'

    ${queryResults}    Query    ${query}

    #Log To Console    ${queryResults}
    #Log To Console    ${queryResults}[0]
    #Log To Console    ${queryResults}[0][0]

    [Return]    ${queryResults}[0]


Delete Enroll By Email
    [Arguments]    ${email}

    ${student}    Select Student Where email    ${email}

    ${query}       Set Variable
    ...            DELETE FROM public.enrollments WHERE student_id = ${student}[0]

    Execute SQL String    ${query}

#Helpers
Reset Student Enroll
    [Arguments]    ${student}

    Connect To Postgres
    Delete Enroll By Email    ${student}[email]
    Disconnect From Database