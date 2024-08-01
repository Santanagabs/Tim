* Settings *
Documentation           Automação referente a funcionalidade de 2fa no portal Tim Negocia

Resource                ../../resources/base.robot

Suite Setup             Abrir Navegador
Test Setup              Go To Portal Hml
Test Teardown           Evidenciar Limpar Cache e Recarregar Página

* Test Cases *
Cenário 01: Validar o retorno para a tela inicial
    [Tags]        ok
    Client PF
    Preencher dados PF                ${client}
    Clicar em Continuar

    Aguardar Visualização do Formulário de Solicitação do Token
    Click                             css=button[type="button"] span >> text="Inserir telefone"
    Aguardar Visualização do Formulário de Login

Cenário 02: Validar o envio de token com um telefone válido da operadora Tim
    [Tags]        ok
    Client PF
    Preencher dados PF                ${client}
    Clicar em Continuar
    Preencher Telefone Para Recebimento do Token        ${client}[phone]
    Clicar em Continuar
    Aguardar Visualização do Formulário de Confirmação do Token


Cenário 03: Validar o envio de token com um telefone válido de outra operadora 
    [Tags]        ok
    Client PF
    Preencher dados PF                ${client}
    Clicar em Continuar
    Preencher Telefone Para Recebimento do Token        ${client}[phone_nao_tim]
    Clicar em Continuar
    Aguardar Visualização do Formulário de Confirmação do Token

Cenário 04: Validar o erro quando inserirmos um telefone incompleto
    [Tags]        ok
    Client PF
    Preencher dados PF                ${client}
    Clicar em Continuar

    Preencher Telefone Para Recebimento do Token        419959641
    Clicar em Continuar

    Sleep                             1
    ${erro_telefone_incompleto}       Get Text          css=p[id="phone-helper"]
    ${style_erro}                     Get Attribute     css=p[id="phone-helper"]        class
    Should Be Equal                   ${erro_telefone_incompleto}        Insira seu telefone celular
    Should Contain                    ${style_erro}                      red
    
Cenário 05: Validar o erro ao insterirmos um telefone inválido 
    [Tags]        ok
    Client PF
    Preencher dados PF                ${client}
    Clicar em Continuar

    Preencher Telefone Para Recebimento do Token        00000000000
    Clicar em Continuar

    Sleep                             1
    ${erro_telefone_incompleto}       Get Text          css=p[id="phone-helper"]
    ${style_erro}                     Get Attribute     css=p[id="phone-helper"]        class
    Should Be Equal                   ${erro_telefone_incompleto}        Insira seu telefone celular
    Should Contain                    ${style_erro}                      red
    
Cenário 06: Validar o erro ao não inserirmos o número para envio do token 
    [Tags]        ok
    Client PF
    Preencher dados PF                ${client}
    Clicar em Continuar

    Preencher Telefone Para Recebimento do Token        ${EMPTY}
    Clicar em Continuar

    Sleep                             1
    ${erro_telefone_incompleto}       Get Text          css=p[id="phone-helper"]
    ${style_erro}                     Get Attribute     css=p[id="phone-helper"]        class
    Should Be Equal                   ${erro_telefone_incompleto}        O campo telefone é obrigatório
    Should Contain                    ${style_erro}                      red

Cenário 07: Validar a utilização do Rybená na página de solicitar token
    [Tags]        ok
    Client PF
    Preencher dados PF                ${client}
    Clicar em Continuar

    Preencher Telefone Para Recebimento do Token        ${EMPTY}
    Clicar em Continuar

    Abrir e Fechar Libras Rybená
    Abrir e Fechar Voz Rybená
    Abrir e Fechar Acessibilidade Rybená

Cenário 08: Validar o retorno para a tela inicial
    [Tags]        ok
    Client PF
    Preencher dados PF                ${client}
    Clicar em Continuar
    Preencher Telefone Para Recebimento do Token        ${client}[phone]
    Clicar em Continuar
    Aguardar Visualização do Formulário de Confirmação do Token
    Click                             css=button[type="button"] span >> text="Inserir código de verificação"
    Aguardar Visualização do Formulário de Login
    
Cenário 09: Validar a visualização dos últimos 4 dígitos do número inserido
    [Tags]        ok
    Client PF
    Preencher dados PF                ${client}
    Clicar em Continuar
    Preencher Telefone Para Recebimento do Token        ${client}[phone]
    Clicar em Continuar
    Aguardar Visualização do Formulário de Confirmação do Token

    ${telefone_apresentado}        Get Text        xpath=//div[text()="O código de verificação foi enviado para:"]/..//b
    @{digitos}                     Split String    ${telefone_apresentado}
    ${ultimos_digitos}             Set Variable    ${digitos}[3]
    Should Contain                 ${client}[phone]        ${ultimos_digitos}

Cenário 10: Validar a inserção correta do token
    [Tags]        ok
    Client PF
    Preencher dados PF                ${client}
    Clicar em Continuar
    Preencher Telefone Para Recebimento do Token        ${client}[phone]
    Clicar em Continuar
    Aguardar Visualização do Formulário de Confirmação do Token
    ###preencher token manualmente
    Validar Pagina Inicial

Cenário 11: Validar o erro quando inserimos um token incorreto
    [Tags]        temp
    Client PF
    Preencher dados PF                ${client}
    Clicar em Continuar
    Preencher Telefone Para Recebimento do Token        ${client}[phone]
    Clicar em Continuar
    Aguardar Visualização do Formulário de Confirmação do Token
    Confirmar Token                   000000

    Wait For Elements State           css=p[id="helper-pin"]        visible            60
    Sleep                             1
    ${erro_telefone_incompleto}       Get Text          css=p[id="helper-pin"]
    ${style_erro}                     Get Attribute     css=p[id="helper-pin"]         class
    Should Be Equal                   ${erro_telefone_incompleto}        Insira o código de verificação
    Should Contain                    ${style_erro}                      red

Cenário 12: Validar o erro quando inserimos um token incompleto
    [Tags]        ok
    Client PF
    Preencher dados PF                ${client}
    Clicar em Continuar
    Preencher Telefone Para Recebimento do Token        ${client}[phone]
    Clicar em Continuar
    Aguardar Visualização do Formulário de Confirmação do Token
    Confirmar Token                   000

    Wait For Elements State           css=p[id="helper-pin"]        visible            60
    Sleep                             1
    ${erro_telefone_incompleto}       Get Text          css=p[id="helper-pin"]
    ${style_erro}                     Get Attribute     css=p[id="helper-pin"]       class
    Should Be Equal                   ${erro_telefone_incompleto}        Insira o código de verificação
    Should Contain                    ${style_erro}                      red

Cenário 13: Validar o erro ao não inserirmos o token
    [Tags]        ok
    Client PF
    Preencher dados PF                ${client}
    Clicar em Continuar
    Preencher Telefone Para Recebimento do Token        ${client}[phone]
    Clicar em Continuar
    Aguardar Visualização do Formulário de Confirmação do Token
    Confirmar Token                   ${EMPTY}

    Wait For Elements State           css=p[id="helper-pin"]        visible            60
    Sleep                             1
    ${erro_telefone_incompleto}       Get Text          css=p[id="helper-pin"]
    ${style_erro}                     Get Attribute     css=p[id="helper-pin"]        class
    Should Be Equal                   ${erro_telefone_incompleto}        O campo código de verificação é obrigatório
    Should Contain                    ${style_erro}                      red

Cenário 14: Validar a solicitação de reenvio do token
    [Tags]        ok
    Client PF
    Preencher dados PF                ${client}
    Clicar em Continuar
    Preencher Telefone Para Recebimento do Token        ${client}[phone]
    Clicar em Continuar
    Aguardar Visualização do Formulário de Confirmação do Token

    Click                             css=button[type="button"] >> text="Reenviar código de verificação"
    Aguardar Visualização do Formulário de Solicitação do Token

Cenário 15: Validar a utilização do Rybená na página de inserção do token
    [Tags]        ok
    Client PF
    Preencher dados PF                ${client}
    Clicar em Continuar
    Preencher Telefone Para Recebimento do Token        ${client}[phone]
    Clicar em Continuar
    Aguardar Visualização do Formulário de Confirmação do Token

    Abrir e Fechar Libras Rybená
    Abrir e Fechar Voz Rybená
    Abrir e Fechar Acessibilidade Rybená