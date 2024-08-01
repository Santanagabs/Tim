* Settings *
Documentation                       Ações da funcionalidade de validação do token

Resource                            ../base.robot

* Keywords *
Preencher Telefone Para Recebimento do Token
    [Arguments]                     ${phone}
    Fill Text                       css=input[id="phone"]                  ${phone}

Pegar e Confirmar Token
    Pegar Token Novo Hermes


Confirmar Token
    [Arguments]        ${token}
    Click                           css=input[id="pin-1"]
    Keyboard Input                  type                ${token}
    Click                           xpath=//form[2]//button[@type="submit"]
    Sleep                           1

Reenviar Token
    Click                           css=button[class="bt-send-code"]

Start Hermes Session
    New Page                    http://hermes-sms.services.local/
    Set Viewport Size           1920    1080
    Fill Text                   css=#username       filho.arion
    Fill Text                   css=#password       43Yu;Sw{&p9Joutubro
    Click                       css=button >> text=Acessar
    Wait For Elements State     css=div[class="row"]    visible     15

Go To Search
    Click                       css=a[href$="PesquisaSMS"]

Go To Detail
    Click                       css=a[class="waves-effect waves-light btn"]
    Click                       xpath=//html/body/div[1]/div/main/section/div/div/div[3]/div[1]/div[2]/div[1]/div/div[6]/a

Phone
    [Arguments]                 ${ddd}              ${phone}
    Fill Text                   css=#DDD            ${ddd}
    Fill Text                   css=#Telefone       ${phone}

Pegar Token
    Start Hermes Session
    Go To Search
    Phone                           ${client}[ddd]       ${client}[number]
    Go To Detail
    ${string}                       Get Text            css=input[value*="código de segurança"]
    ${message}                      Split String From Right         ${string}     ${SPACE}       -1
    Set Suite Variable              ${token}            ${message}[2]
    Close Page
    
Pegar Token Novo Hermes
    Sleep                           3
    ${sms}                          Pegar Token Bigquery            ${client}[phone]
    ${message}                      Split String From Right         ${sms}     ${SPACE}       -1
    Set Suite Variable              ${token}            ${message}[2]

