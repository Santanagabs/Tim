* Settings *
Documentation           Automação referente as funcionalidades da tela de código de barras no portal Tim Negocia

Resource                ../../resources/base.robot

Suite Setup             Abrir Navegador
Test Setup              Go To Portal Hml
Test Teardown           Evidenciar Limpar Cache e Recarregar Página

* Test Cases *
Cenário 01: Validar a visualização das informações do cliente
    [Tags]            temp
    Client PF
    Preencher dados PF                ${client}
    Clicar em Continuar
    Preencher Telefone Para Recebimento do Token        ${client}[phone]
    Clicar em Continuar
    Aguardar Visualização do Formulário de Confirmação do Token
    ###preencher token manualmente
    Validar Pagina Inicial

    Selecionar Contrato
    Selecionar Opcao de Pagamento Codigo De Barras



Cenário 02: Validar a visualização das informações do cliente ultrafibra
    [Tags]            temp
    Client PF
    Preencher dados PF                ${client}
    Clicar em Continuar
    Preencher Telefone Para Recebimento do Token        ${client}[phone]
    Clicar em Continuar
    Aguardar Visualização do Formulário de Confirmação do Token
    ###preencher token manualmente
    Validar Pagina Inicial

    Selecionar Contrato
    Selecionar Opcao de Pagamento Codigo De Barras



Cenário 03: Validar a funcionalidade do código de barras
    [Tags]            temp
    Client PF
    Preencher dados PF                ${client}
    Clicar em Continuar
    Preencher Telefone Para Recebimento do Token        ${client}[phone]
    Clicar em Continuar
    Aguardar Visualização do Formulário de Confirmação do Token
    ###preencher token manualmente
    Validar Pagina Inicial

    Selecionar Contrato
    Selecionar Opcao de Pagamento Codigo De Barras



Cenário 04: Validar a funcionalidade do copia e cola do código de barras
    [Tags]            temp
    Client PF
    Preencher dados PF                ${client}
    Clicar em Continuar
    Preencher Telefone Para Recebimento do Token        ${client}[phone]
    Clicar em Continuar
    Aguardar Visualização do Formulário de Confirmação do Token
    ###preencher token manualmente
    Validar Pagina Inicial

    Selecionar Contrato
    Selecionar Opcao de Pagamento Codigo De Barras



Cenário 05: Validar a opção "Pague com o app do seu banco"
    [Tags]            temp
    Client PF
    Preencher dados PF                ${client}
    Clicar em Continuar
    Preencher Telefone Para Recebimento do Token        ${client}[phone]
    Clicar em Continuar
    Aguardar Visualização do Formulário de Confirmação do Token
    ###preencher token manualmente
    Validar Pagina Inicial

    Selecionar Contrato
    Selecionar Opcao de Pagamento Codigo De Barras



Cenário 06: Validar o envio do código de barras por SMS com número válido
    [Tags]            temp
    Client PF
    Preencher dados PF                ${client}
    Clicar em Continuar
    Preencher Telefone Para Recebimento do Token        ${client}[phone]
    Clicar em Continuar
    Aguardar Visualização do Formulário de Confirmação do Token
    ###preencher token manualmente
    Validar Pagina Inicial

    Selecionar Contrato
    Selecionar Opcao de Pagamento Codigo De Barras



Cenário 07: Validar o erro ao inserir um número inválido na solicitação do código de barras via SMS
    [Tags]            temp
    Client PF
    Preencher dados PF                ${client}
    Clicar em Continuar
    Preencher Telefone Para Recebimento do Token        ${client}[phone]
    Clicar em Continuar
    Aguardar Visualização do Formulário de Confirmação do Token
    ###preencher token manualmente
    Validar Pagina Inicial

    Selecionar Contrato
    Selecionar Opcao de Pagamento Codigo De Barras



Cenário 08: Validar o erro ao inserir um número incompleto na solicitação do código de barras via SMS
    [Tags]            temp
    Client PF
    Preencher dados PF                ${client}
    Clicar em Continuar
    Preencher Telefone Para Recebimento do Token        ${client}[phone]
    Clicar em Continuar
    Aguardar Visualização do Formulário de Confirmação do Token
    ###preencher token manualmente
    Validar Pagina Inicial

    Selecionar Contrato
    Selecionar Opcao de Pagamento Codigo De Barras



Cenário 09: Validar o erro ao não inserir um número na solicitação do código de barras via SMS
    [Tags]            temp
    Client PF
    Preencher dados PF                ${client}
    Clicar em Continuar
    Preencher Telefone Para Recebimento do Token        ${client}[phone]
    Clicar em Continuar
    Aguardar Visualização do Formulário de Confirmação do Token
    ###preencher token manualmente
    Validar Pagina Inicial

    Selecionar Contrato
    Selecionar Opcao de Pagamento Codigo De Barras



Cenário 10: Validar o fechamento do modal de envio do código via SMS
    [Tags]            temp
    Client PF
    Preencher dados PF                ${client}
    Clicar em Continuar
    Preencher Telefone Para Recebimento do Token        ${client}[phone]
    Clicar em Continuar
    Aguardar Visualização do Formulário de Confirmação do Token
    ###preencher token manualmente
    Validar Pagina Inicial

    Selecionar Contrato
    Selecionar Opcao de Pagamento Codigo De Barras



Cenário 11: Validar o envio do código de barras por e-mail com um e-mail válido
    [Tags]            temp
    Client PF
    Preencher dados PF                ${client}
    Clicar em Continuar
    Preencher Telefone Para Recebimento do Token        ${client}[phone]
    Clicar em Continuar
    Aguardar Visualização do Formulário de Confirmação do Token
    ###preencher token manualmente
    Validar Pagina Inicial

    Selecionar Contrato
    Selecionar Opcao de Pagamento Codigo De Barras



Cenário 12: Validar o erro ao inserir um e-mail inválido na solicitação de código de barras via e-mail
    [Tags]            temp
    Client PF
    Preencher dados PF                ${client}
    Clicar em Continuar
    Preencher Telefone Para Recebimento do Token        ${client}[phone]
    Clicar em Continuar
    Aguardar Visualização do Formulário de Confirmação do Token
    ###preencher token manualmente
    Validar Pagina Inicial

    Selecionar Contrato
    Selecionar Opcao de Pagamento Codigo De Barras



Cenário 13: Validar o erro ao inserir um e-mail incorreto na solicitação de código de barras via e-mail
    [Tags]            temp
    Client PF
    Preencher dados PF                ${client}
    Clicar em Continuar
    Preencher Telefone Para Recebimento do Token        ${client}[phone]
    Clicar em Continuar
    Aguardar Visualização do Formulário de Confirmação do Token
    ###preencher token manualmente
    Validar Pagina Inicial

    Selecionar Contrato
    Selecionar Opcao de Pagamento Codigo De Barras



Cenário 14: Validar o erro ao não inserir um e-mail na solicitação de código de barras via e-mail
    [Tags]            temp
    Client PF
    Preencher dados PF                ${client}
    Clicar em Continuar
    Preencher Telefone Para Recebimento do Token        ${client}[phone]
    Clicar em Continuar
    Aguardar Visualização do Formulário de Confirmação do Token
    ###preencher token manualmente
    Validar Pagina Inicial

    Selecionar Contrato
    Selecionar Opcao de Pagamento Codigo De Barras



Cenário 15: Validar o fechamento do modal de envio do código via e-mail
    [Tags]            temp
    Client PF
    Preencher dados PF                ${client}
    Clicar em Continuar
    Preencher Telefone Para Recebimento do Token        ${client}[phone]
    Clicar em Continuar
    Aguardar Visualização do Formulário de Confirmação do Token
    ###preencher token manualmente
    Validar Pagina Inicial

    Selecionar Contrato
    Selecionar Opcao de Pagamento Codigo De Barras



Cenário 16: Validar a apresentação do NPS
    [Tags]            temp
    Client PF
    Preencher dados PF                ${client}
    Clicar em Continuar
    Preencher Telefone Para Recebimento do Token        ${client}[phone]
    Clicar em Continuar
    Aguardar Visualização do Formulário de Confirmação do Token
    ###preencher token manualmente
    Validar Pagina Inicial

    Selecionar Contrato
    Selecionar Opcao de Pagamento Codigo De Barras



Cenário 17: Validar a impressão do código de barras
    [Tags]            temp
    Client PF
    Preencher dados PF                ${client}
    Clicar em Continuar
    Preencher Telefone Para Recebimento do Token        ${client}[phone]
    Clicar em Continuar
    Aguardar Visualização do Formulário de Confirmação do Token
    ###preencher token manualmente
    Validar Pagina Inicial

    Selecionar Contrato
    Selecionar Opcao de Pagamento Codigo De Barras



Cenário 18: Validar a utilização do Rybená na pagina de segunda via do código de barras
    [Tags]            temp
    Client PF
    Preencher dados PF                ${client}
    Clicar em Continuar
    Preencher Telefone Para Recebimento do Token        ${client}[phone]
    Clicar em Continuar
    Aguardar Visualização do Formulário de Confirmação do Token
    ###preencher token manualmente
    Validar Pagina Inicial

    Selecionar Contrato
    Selecionar Opcao de Pagamento Codigo De Barras


