*** Settings ***
Library     Selenium2Library

*** Variables ***
${url}   http://tester1.test.apps360.id/login
${Browser}      Edge  


*** Test Cases *** 
Valid login
        Open Browser                        ${url}                              ${Browser} 
        Maximize Browser Window         
        Wait Until Element is Enabled       id:email                            5
        Input Text                          id:email                            ceo@bigio.id  
        Input Text                          id:password                         ceobigio
        Select Checkbox                     class:rounded
        Click Element                       class:inline-flex

        Page Should Contain                 Applicants List
        Close Browser

*** Test Cases *** 
login with wrong email
        Open Browser                        ${url}                              ${Browser} 
        Maximize Browser Window         
        Wait Until Element is Enabled       id:email                            5
        Input Text                          id:email                            ceo@bigio  
        Input Text                          id:password                         ceobigio
        
        Click Element                       class:inline-flex

        Page Should Contain                 These credentials do not match our records.
        Close Browser

*** Test Cases *** 
login with wrong password
        Open Browser                        ${url}                              ${Browser} 
        Maximize Browser Window         
        Wait Until Element is Enabled       id:email                            5
        Input Text                          id:email                            ceo@bigio.id  
        Input Text                          id:password                         ceo
        
        Click Element                       class:inline-flex

        Page Should Contain                 These credentials do not match our records.
        Close Browser

*** Test Cases *** 
view detail applicant
        Open Browser                        ${url}                              ${Browser}
        Maximize Browser Window         
        Wait Until Element is Enabled       id:email                            5
        Input Text                          id:email                            ceo@bigio.id  
        Input Text                          id:password                         ceobigio
        
        Click Element                       class:inline-flex

        Page Should Contain                 Applicants List
        Click Element                       class:mr-3 

        Page Should Contain                 Detail
        Close Browser

*** Test Cases *** 
Process applicant
        Open Browser                        ${url}                              ${Browser}
        Maximize Browser Window         
        Wait Until Element is Enabled       id:email                            5
        Input Text                          id:email                            ceo@bigio.id  
        Input Text                          id:password                         ceobigio
        
        Click Element                       class:inline-flex

        Page Should Contain                 Applicants List
        Click Element                       name:proceed

        Page Should Contain                 Applicants List
        Close Browser

*** Test Cases *** 
Delete applicant
        Open Browser                        ${url}                              ${Browser}
        Maximize Browser Window         
        Wait Until Element is Enabled       id:email                            5
        Input Text                          id:email                            ceo@bigio.id  
        Input Text                          id:password                         ceobigio
        
        Click Element                       class:inline-flex

        Page Should Contain                 Applicants List
        Click Element                       name:delete

        Page Should Contain                 Dashboard
        Close Browser



*** Test Cases ***
Registration with blank email
        Open Browser                        ${url}                              ${Browser} 
        Maximize Browser Window         
        Wait Until Element is Enabled       id:email                            5
        Press Keys                          id:email                            A+BACKSPACE 
        Input Text                          id:password                         ceobigio
        
        Click Element                       class:inline-flex

        Wait Until Element Contains         class:text-danger                  Please fill this out
        Close Browser

*** Test Cases ***
Registration with blank password
        Open Browser                        ${url}                              ${Browser} 
        Maximize Browser Window         
        Wait Until Element is Enabled       id:email                            5
        Input Text                          id:email                            ceo@bigio.id  
        Press Keys                          id:password                         A+BACKSPACE
        
        Click Element                       class:inline

        Wait Until Element Contains         class:text-danger                  Please fill this out
        Close Browser


