*** Variables ***
&{user_info_1}  email=somkiat@gmail.com
...  mobile_no=0865696200

&{user_info_2}  email=somkiat1@gmail.com
...  mobile_no=0865696202

*** Test cases ***
Test 1
    Fill in customer information  ${user_info_1}

Test 2
    Fill in customer information  ${user_info_2}

Test 3
    &{user_info}=  Create Dictionary
    ...  email=somkiat3@gmail.com
    ...  mobile_no=0865696203
    Fill in customer information  ${user_info}

*** Keywords ***
Fill in customer information
    [Arguments]  ${user}
    Log to console  ${user.email}
    Log to console  ${user.mobile_no}
