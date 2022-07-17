*** Settings ***
Library     AutoItLibrary

*** Test Cases ***
TC1
    #Start Screen Recording
    #Sleep    5s  # Play video for 5s
    #Stop Screen Recording    ${EXECDIR}${/}videos${/}Videos



    IF    ${Skip_Button} == 'True'
        Click Element    ${Skip_Button}
        ${seek}     Run Keyword And Return Status    Page Should Contain Element    ${Seek_Bar}
        IF    ${seek} == 'True'
            Log To Console    Video Played successful
        ELSE
           Log To Console    video playback Failed
        END
    ELSE
        ${seek}     Run Keyword And Return Status    Page Should Contain Element    ${Seek_Bar}
        IF    ${seek} == 'True'
            Log To Console    Video Played Successful
        ELSE
           Log To Console    video playback Failed
        END
    END