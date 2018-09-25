*** Settings ***
Library  SeleniumLibrary
Library  OperatingSystem

*** Test cases ***
Upload 3 file
    Open angular upload page
    Select file  upload1.png
    Select file  upload2.png
    Select file  upload3.png
    Selected file should have 3 files
    Upload file  1
    Upload should be succeed  33
    Upload file  2
    Upload should be succeed  67
    Upload file  3
    Upload should be succeed  100
    Count Files

*** Keywords ***
Open angular upload page
    Open Browser 
    ...  http://nervgh.github.io/pages/angular-file-upload/examples/simple/
    ...  browser=chrome

Select file
    [Arguments]  ${filename}
    Choose File  
    ...  xpath://*[@id="ng-app"]/body/div/div[2]/div[1]/input[2]
    ...  ${CURDIR}/${filename}

Selected file should have 3 files
    Page Should Contain Element
    ...  xpath://*[@ng-repeat="item in uploader.queue"]
    ...  limit=3

Upload file
    [Arguments]  ${seq}
    Click Element  xpath://*[@id="ng-app"]/body/div/div[2]/div[2]/table/tbody/tr[${seq}]/td[5]/button[1]

Upload should be succeed
    [Arguments]  ${percent}
    Wait Until Page Contains Element
    ...  xpath://div[@style="width: ${percent}%;"]
    ...  timeout=10

Count Files
    ${count}=  List Files In Directory
    ...  path=${CURDIR}
    ...  pattern="*.png"
    Log to console  ${count}
