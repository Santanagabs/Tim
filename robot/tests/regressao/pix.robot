* Settings *
Documentation           Automação referente as funcionalidades da tela de pix no portal Tim Negocia

Resource                ../../resources/base.robot

Suite Setup             Abrir Navegador
Test Setup              Go To Portal Hml
Test Teardown           Evidenciar Limpar Cache e Recarregar Página

* Test Cases *
Cenário 01: Validar a disponibilidade do pagamento via PIX
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
    Selecionar Opcao de Pagamento Pix



Cenário 02: Validar a visualização das informações do cliente
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
    Selecionar Opcao de Pagamento Pix



Cenário 03: Validar a visualização das informações do cliente ultrafibra
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
    Selecionar Opcao de Pagamento Pix



Cenário 04: Validar a funcionalidade do Código QR do pix
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
    Selecionar Opcao de Pagamento Pix



Cenário 05: Validar a funcionalidade do copia e cola do pix
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
    Selecionar Opcao de Pagamento Pix



Cenário 06: Validar a opção "Pague com o app do seu banco"
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
    Selecionar Opcao de Pagamento Pix



Cenário 07: Validar o envio do pix por SMS com número válido
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
    Selecionar Opcao de Pagamento Pix



Cenário 08: Validar o erro ao inserir um número inválido na solicitação do pix via SMS
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
    Selecionar Opcao de Pagamento Pix



Cenário 09: Validar o erro ao inserir um número incompleto na solicitação do pix via SMS
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
    Selecionar Opcao de Pagamento Pix



Cenário 10: Validar o erro ao não inserir um número na solicitação do pix via SMS
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
    Selecionar Opcao de Pagamento Pix



Cenário 11: Validar o fechamento do modal de envio do pix via SMS
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
    Selecionar Opcao de Pagamento Pix



Cenário 12: Validar o envio do pix por e-mail com um e-mail válido
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
    Selecionar Opcao de Pagamento Pix



Cenário 13: Validar o erro ao inserir um e-mail inválido na solicitação de pix via e-mail
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
    Selecionar Opcao de Pagamento Pix



Cenário 14: Validar o erro ao inserir um e-mail incorreto na solicitação de pix via e-mail
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
    Selecionar Opcao de Pagamento Pix



Cenário 15: Validar o erro ao não inserir um e-mail na solicitação de pix via e-mail
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
    Selecionar Opcao de Pagamento Pix



Cenário 16: Validar o fechamento do modal de envio do código via e-mail
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
    Selecionar Opcao de Pagamento Pix



Cenário 17: Validar a apresentação do NPS
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
    Selecionar Opcao de Pagamento Pix



Cenário 18: Validar a utilização do Rybená na pagina de segunda via do pix
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
    Selecionar Opcao de Pagamento Pix


