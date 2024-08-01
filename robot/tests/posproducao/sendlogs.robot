* Settings *
Documentation                       Test API

Resource                            ../../resources/base.robot
# Library                             ../../resources/libs/header.py
Library                             Process
Suite Setup                         Abrir Navegador

*** Test Cases ***
# Teste
#     Go To    https://webhook.site/
#     ${url}    Get Text    xpath=//p/code
#     Http    ${url}
#     Sleep        5
#     Take Screenshot

Teste
    # Sleep    1
    Go To    https://meuip.com.br/
    Sleep    10
    # ${status}    Run Process    resources/libs/header.py
    # Log    ${status}
    # Sleep        2