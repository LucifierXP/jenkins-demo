*** Settings ***
Library  SeleniumLibrary

*** Test cases ***
ยื่นแบบ online ไม่ได้
    Open tax online page
    Open manual of compatability view setting
    Close warning popup

*** Keywords ***
Open tax online page
    Open Browser 
    ...  https://rdserver.rd.go.th/publish/index.php?page=taxonline
    ...  browser=chrome

Open manual of compatability view setting
    Select Frame  xpath://*[@id='lightboxdialog']/p/iframe
    Click Link  คลิก

Close warning popup
    Select Window  locator=NEW
    Close Window
    
    Select Window  locator=MAIN
    Click Element
    ...  xpath://*[@id='lightboxdialog']/button
