* Settings *
Documentation                       Ações da funcionalidade de acesso ao portal

Resource                            ../base.robot

* Keywords *

Digitar CPF
    [Arguments]                     ${cpf}
    Click                           css=input[name="cpf"]
    Keyboard Input                  insertText          ${cpf}

Digitar Data Nasc
    [Arguments]                     ${data_nasc}
    Click                           css=input[name="birthday"]
    Keyboard Input                  insertText          ${data_nasc}

Digitar CNPJ
    [Arguments]                     ${cnpj}
    Click                           css=input[name="cnpj"]
    Keyboard Input                  insertText          ${cnpj}

Selecionar PJ
    Click                           css=button[id$="PJ"]

Selecionar PF
    Click                           css=button[id$="PF"]

Preencher dados PF
    [Arguments]         ${client}
    Digitar CPF         ${client}[cpf]
    Digitar Data Nasc   ${client}[birth]

Preencher dados PJ
    [Arguments]         ${client}
    Digitar CNPJ        ${client}[cnpj]

Fazer Login PF
    Preencher dados PF                ${client}
    Clicar em Continuar
    Validar Copyright

Fazer Login PJ
    Preencher dados PJ                ${client}
    Clicar em Continuar
    Validar Copyright