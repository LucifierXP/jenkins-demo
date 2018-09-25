*** Settings ***
Library  CsvLibrary.py

*** Test cases ***
Try to read from user.csv
    ${users}=  Read Data  user.csv
    Log to console  ${users}
    Log to console  User=${users[0][0]} Pass=${users[0][1]}

Try to read from user.csv with for loop
    ${users} =  Read Data  user.csv
    :FOR  ${data}  IN  @{users}
    \    Log to console  ${data[0]}=${data[1]}

Try to write dictionary data to csv file
    &{user_info}=  Create Dictionary
    ...  email=somkiat3@gmail.com
    ...  mobile_no=0865696203
    Write Data  user1.csv  ${user_info}

Try to write list data to csv file
    [Tags]  dev
    &{user_info}=  Create Dictionary
    ...  email=somkiat3@gmail.com
    ...  mobile_no=0865696203
    @{all_data} =  Create List  
    ...  ${user_info}  
    ...  ${user_info} 
    Write Data List  user1.csv  ${all_data}

Try to append dictionary data to csv file
    &{user_info}=  Create Dictionary
    ...  email=somkiat4@gmail.com
    ...  mobile_no=0865696203
    Append Data  user1.csv  ${user_info}


