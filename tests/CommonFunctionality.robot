*** Settings ***
Library     AppiumLibrary

*** Keywords ***
Launch_Youtube
    Open Application    http://localhost:4723/wd/hub    platformName=Android    deviceName=5203acd0feaa7321       appPackage=com.google.android.youtube   appActivity=com.google.android.youtube.HomeActivity

