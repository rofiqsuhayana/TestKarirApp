*** Settings ***
Library     Selenium2Library

*** Variables ***
${Browser}      Edge      
${url}   http://tester1.test.apps360.id/


*** Test Cases *** 
Valid Registration
        Open Browser                        ${url}                              ${Browser}  
        Maximize Browser Window         
        Wait Until Element is Enabled       id:name                             5
        Input Text                          id:name                             Doni  
        Input Text                          id:email                            Doni@gmail.com
        Input Text                          id:phone                            08712345611
        Input Text                          id:description                      Freshgraduet

        Click Element                       class:group

        Page Should Contain                 Welcome to the club!
        Close Browser

*** Test Cases ***
Registration with invalid email
        Open Browser                        ${url}                              ${Browser}  
        Maximize Browser Window         
        Wait Until Element is Enabled       id:name                             5
        Input Text                          id:name                             Doni  
        Input Text                          id:email                            2222222aaaa.gmail.com
        Input Text                          id:phone                            08712345611
        Input Text                          id:description                      Freshgraduet

        Click Element                       class:group 

        Page Should Contain                 Please Include an '@' in the email address.
        Close Browser

*** Test Cases ***
Registration with invalid name
        Open Browser                        ${url}                              ${Browser}  
        Maximize Browser Window         
        Wait Until Element is Enabled       id:name                             5
        Input Text                          id:name                             12345  
        Input Text                          id:email                            Doni@gmail.com
        Input Text                          id:phone                            08712345611
        Input Text                          id:description                      Freshgraduet

        Click Element                       class:group 

        Wait Until Element Contains         class:text-danger                   Please use character(a-z) for name
        Close Browser

*** Test Cases ***
Registration with invalid phone number
        Open Browser                        ${url}                              ${Browser}  
        Maximize Browser Window         
        Wait Until Element is Enabled       id:name                             5
        Input Text                          id:name                             Doni  
        Input Text                          id:email                            Doni@gmail.com
        Input Text                          id:phone                            087aiue5611
        Input Text                          id:description                      Freshgraduet

        Click Element                       class:group 

        Wait Until Element Contains         class:text-danger                   Please use just number for phone 
        Close Browser

*** Test Cases ***
Registration with invalid phone number 1
        Open Browser                        ${url}                              ${Browser}  
        Maximize Browser Window         
        Wait Until Element is Enabled       id:name                             5
        Input Text                          id:name                             Doni  
        Input Text                          id:email                            Doni@gmail.com
        Input Text                          id:phone                            0871234561190008000
        Input Text                          id:description                      Freshgraduet

        Click Element                       class:group 

        Wait Until Element Contains         class:text-danger                   Please input a correct phone number
        Close Browser
       

*** Test Cases ***
Registration with blank name
        Open Browser                        ${url}                              ${Browser}  
        Maximize Browser Window             
        Wait Until Element is Enabled       id:name                             5                      
        Press Keys                          id:name                             A+BACKSPACE
        Input Text                          id:email                            Doni@gmail.com
        Input Text                          id:phone                            08712345611                           
        Input Text                          id:description                      Freshgraduet

        Click Element                       class:group 

        Wait Until Element Contains         class:text-danger                   The name field is required.
        Close Browser

*** Test Cases ***
Registration with blank email
        Open Browser                        ${url}                              ${Browser}  
        Maximize Browser Window             
        Wait Until Element is Enabled       id:name                             5                      
        Input Text                          id:name                             Doni
        Press Keys                          id:email                            A+BACKSPACE
        Input Text                          id:phone                            08712345611                           
        Input Text                          id:description                      Freshgraduet

        Click Element                       class:group 

        Wait Until Element Contains         class:text-danger                   The email field is required.
        Close Browser

*** Test Cases ***
Registration with blank phone
        Open Browser                        ${url}                              ${Browser}  
        Maximize Browser Window             
        Wait Until Element is Enabled       id:name                             5                      
        Input Text                          id:name                             Doni
        Input Text                          id:email                            Doni@gmail.com
        Press Keys                          id:phone                            A+BACKSPACE                           
        Input Text                          id:description                      Freshgraduet

        Click Element                       class:group 

        Wait Until Element Contains         class:text-danger                   The phone field is required.
        Close Browser

*** Test Cases ***
Registration with blank description
        Open Browser                        ${url}                              ${Browser}  
        Maximize Browser Window             
        Wait Until Element is Enabled       id:name                             5                      
        Input Text                          id:name                             Doni
        Input Text                          id:email                            Doni@gmail.com
        Input Text                          id:phone                            08712345611                            
        Press Keys                          id:description                      A+BACKSPACE 

        Click Element                       class:group 

        Wait Until Element Contains         class:text-danger                   The description field is required.
        Close Browser

*** Test Cases ***
Registration with blank space
        Open Browser                        ${url}                              ${Browser}  
        Maximize Browser Window             
        Wait Until Element is Enabled       id:name                             5                      
        Press Keys                          id:name                             A+BACKSPACE 
        Press Keys                          id:email                            A+BACKSPACE 
        Press Keys                          id:phone                            A+BACKSPACE                            
        Press Keys                          id:description                      A+BACKSPACE 

        Click Element                       class:group 

        Wait Until Element Contains         class:text-danger                   The name field is required. The email field is required. The phone field is required. The description field is required.
        Close Browser