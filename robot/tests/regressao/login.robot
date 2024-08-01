* Settings *
Documentation           Automação referente ás funcionalidades de login no portal Tim Negocia

Resource                ../../resources/base.robot

Suite Setup             Abrir Navegador
Test Setup              Go To Portal Hml
Test Teardown           Evidenciar Limpar Cache e Recarregar Página

* Test Cases *
Cenário 01: Validar o aviso sobre o armazenamento dos cookies
    [Tags]        ok
    Validar Texto do Aviso Sobre Cookies
    Validar Politica De Privacidade do Aviso Sobre Cookies
    Aceitar Política de Privacidade

Cenário 02: Validar o login com sucesso pessoa física
    [Tags]        ok
    Client PF
    Preencher dados PF                ${client}
    Clicar em Continuar

    Aguardar Visualização do Formulário de Solicitação do Token
    
Cenário 03: Validar o login com sucesso pessoa jurídica
    [Tags]        ok
    Client PJ
    Selecionar PJ
    Preencher dados PJ                ${client}
    Clicar em Continuar

    Aguardar Visualização do Formulário de Solicitação do Token
    
# Cenário 04: Validar o login com falha utilizando um CPF incorreto
#     [Tags]        ok
#     &{client}           Create Dictionary           cpf=546.879.231-76          birth=21/09/1983
#     Preencher dados PF            ${client}
#     Clicar em Continuar
#     Modal Cliente Sem Faturas

# Cenário 05: Validar o login com falha utilizando uma data de nascimento incorreta
#     [Tags]        ok
#     &{client}           Create Dictionary           cpf=744.725.740-04          birth=21/16/1971
#     Preencher dados PF            ${client}
#     Clicar em Continuar
#     Modal Cliente Sem Faturas

# Cenário 06: Validar o não preenchimento dos campos de CPF e data de nascimento
#     [Tags]        ok
#     &{client}           Create Dictionary           cpf=${EMPTY}          birth=${EMPTY}
#     Preencher dados PF            ${client}
#     Clicar em Continuar
#     Validar Alerta de CPF Obrigatório                           Campo obrigatório
#     Validar Alerta de Data de Nascimento Obrigatória            Campo obrigatório

# Cenário 07: Validar o login com falha utilizando um CNPJ incorreto
#     [Tags]        ok
#     &{client}           Create Dictionary           cnpj=46.556.456/4123-21
#     Selecionar PJ
#     Preencher dados PJ             ${client}
#     Clicar em Continuar
#     Modal Cliente Sem Faturas

# Cenário 08: Validar o não preenchimento do campo de CNPJ
#     [Tags]        ok
#     &{client}           Create Dictionary           cnpj=${EMPTY}
#     Selecionar PJ
#     Preencher dados PJ             ${client}
#     Clicar em Continuar
#     Validar Alerta de CNPJ Obrigatório            Campo obrigatório

# Cenário 09: Validar o login com um cliente sem débitos
#     [Tags]        ok
#     &{client}           Create Dictionary           cpf=372.654.540-90          birth=12/08/1992
#     Preencher dados PF            ${client}
#     Clicar em Continuar
#     Modal Cliente Sem Faturas

# Cenário 10: Validar a troca de formulário de pessoa física e jurídica
#     [Tags]        ok
#     Selecionar PJ
#     Wait For Elements State        css=input[name="cnpj"]            visible        5
#     Take Screenshot
#     Selecionar PF
#     Wait For Elements State        css=input[name="cpf"]             visible        5
#     Wait For Elements State        css=input[name="birthday"]        visible        5
#     Take Screenshot

# Cenário 11: Validar o layout do portal
#     [Tags]        ok
    
#     Click         css=a span >> text="Saiba mais sobre nosso portal"
#     ${url}        Get Url
#     Should End With    ${url}    introduction
#     Click         css=section[id="introduction"] a

#     ${url}        Get Url
#     Should End With    ${url}    advantages
#     Validar Vantagens
#     Click         css=section[id="advantages"] a

#     ${url}        Get Url
#     Should End With    ${url}    accessibility
#     Click         css=section[id="accessibility"] a
    
#     ${url}        Get Url
#     Validar Passo A Passo
#     Should End With    ${url}    tutorial
    
#     Validar Telefones Para Contato

# Cenário 12: Validar o vídeo de apresentação
#     [Tags]        ok
#     Click         css=a span >> text="Saiba mais sobre nosso portal"
#     ${url}        Get Url
#     Should End With    ${url}    introduction
    
#     Wait For Elements State        xpath=//source[@type="video/mp4"]/..        visible        10

# Cenário 13: Validar o direcionamento para a instalação do aplicativo "Meu Tim"
#     [Tags]         ok
#     Click          css=a[aria-label="Baixar aplicativo na Google Play Store"]
#     Switch Page    NEW
#     Wait Until Network Is Idle
#     ${url}         Get Url
#     Should Contain    ${url}    meutim
#     Take Screenshot
#     Close Page

#     Click          css=a[aria-label="Baixar aplicativo na App Store"]
#     Switch Page    NEW
#     Wait Until Network Is Idle
#     ${url}         Get Url
#     Should Contain    ${url}    tim
#     Take Screenshot
#     Close Page

# Cenário 14: Validar o funcionamento do Rybená na página de login
#     [Tags]        ok
#     Abrir e Fechar Libras Rybená
#     Abrir e Fechar Voz Rybená
#     Abrir e Fechar Acessibilidade Rybená
