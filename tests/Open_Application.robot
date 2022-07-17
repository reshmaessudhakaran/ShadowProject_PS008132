*** Settings ***
Resource    ../resource/base/CommonFunctionality.robot
Resource    ../resource/pages/Applaunch.robot
Library     AppiumLibrary
Library     Launch_Time.py
Library     Navigation_Time.py
Library     Play_Back.py

*** Test Cases ***
App_launch _time
    Launch_Youtube
    Start Screen Recording  20s
    Verify_Page
    Stop Screen Recording
     ${applaunchtime} =   Video_to_Frame_Convert
    Log To Console    App Launch time : ${applaunchtime} sec

Navigation_time
    Operate Options
    ${navigation_time} =   Navigation_Time
    Log To Console    Navigation time : ${navigation_time} sec
    Search_Element    java telusko
Playback_verification

    #Skip_And_Play
    ${playback_time} =    Video_Play_Back
    Log To Console    Video PlayBack Time: ${playback_time} sec