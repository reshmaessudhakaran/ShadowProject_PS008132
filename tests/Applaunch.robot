
*** Variables ***
${display_locator}      com.google.android.youtube:id/youtube_logo
${Home_Launch_Button1}      //android.widget.TextView[@text="Home"]
${Shorts_Launch_Button1}        //android.widget.Button[@index=1]
${Plus_Launch_Button1}          //android.widget.Button[@index=2]
${Subscription_Launch_Button1}       //android.widget.Button[@index=3]
${Library_Launch_Button1}       //android.widget.Button[@index=4]
${Search_Button1}       //android.widget.ImageView[@content-desc="Search"]
${Search_Launch_Button1}      //android.widget.EditText[@text="Search YouTube"]
${Video_List_Locator}       //com.google.android.youtube:id/text[@index=1]
${Search_Result_Locator}   //android.widget.TextView[@index=1]
${Video_Number_Locator}        //android.view.ViewGroup[contains(@content-desc,'Beginners')]
${Skip_Button}                  //android.widget.LinearLayout[@content-desc="Skip ad"]
${Seek_Bar}                 //android.widget.SeekBar[@index=0]
${Video_Launch_Button1}     //android.view.ViewGroup[@package="com.google.android.youtube"]
${Shorts_Launch_Button2}    //android.widget.FrameLayout[@id=com.google.android.youtube:id/reel_video_interactions"]

*** Keywords ***
Verify_Page
    #Open Application    http://localhost:4723/wd/hub    platformName=Android    deviceName=5203acd0feaa7321       appPackage=com.google.android.youtube   appActivity=com.google.android.youtube.HomeActivity

    ${success}     Run Keyword And Return Status    Page Should Contain Element    ${display_locator}
    #Log To Console    ${success}
    Run Keyword If    "${success}" == "True"  Success        ELSE     Unsuccess
Success
    Log To Console    Launch Successful
Unsuccess
    Log To Console    Launch Unsuccessful


Operate_Options

    Wait Until Page Contains Element   ${display_locator}
    Start Screen Recording
    Sleep    5
    Click Element    ${Shorts_Launch_Button1}

    Stop Screen Recording   filename= home_to_shorts

    Wait Until Page Contains Element   ${display_locator}   3s
    Click Element    ${Plus_Launch_Button1}
    Go Back

    Click Element    ${Subscription_Launch_Button1}
    Go Back

    Click Element    ${Library_Launch_Button1}
    Go Back

Playback_verification
    [Arguments]     ${text_search}
    Wait Until Page Contains Element   ${display_locator}
    Wait Until Page Contains Element   ${Search_Button1}
    Click Element    ${Search_Button1}
    Wait Until Page Contains Element   ${Search_Launch_Button1}   3s
    Input Text    ${Search_Launch_Button1}    ${text_search}
    Click Element    //android.widget.TextView[@text="${text_search}"]
    Wait Until Page Contains Element   ${Search_Result_Locator}
    Wait Until Page Contains Element   ${Video_Number_Locator}   20s
    Click Element    ${Video_Number_Locator}
    Start Screen Recording
    Sleep    10

    ${skip_status}  Run Keyword And Return Status    Wait Until Page Contains Element    ${Skip_Button}
    #Log To Console    ${skip_status}
    Run Keyword If    "${skip_status}" == 'True'  Skip_And_Play
    Stop Screen Recording   filename= Start_Or_Stop

Skip_And_Play
    Log To Console    Skip ads
    Click Element    ${Skip_Button}
    Sleep    10

