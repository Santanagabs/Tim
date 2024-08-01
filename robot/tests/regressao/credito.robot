* Settings *
Documentation           Automação referente as funcionalidades da tela de cartão de crédito no portal Tim Negocia

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
    Selecionar Opcao de Pagamento Cartao De Credito
    Validar Dados Na Tela de Cartao de Credito

Cenário 02: Validar o pagamento com sucesso no portal

Cenário 03: Validar o pagamento com falha no portal

Cenário 04: Validar a utilização do Rybená na página de pagamento com cartão de crédito
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
    Selecionar Opcao de Pagamento Cartao De Credito

    Abrir e Fechar Libras Rybená
    Abrir e Fechar Voz Rybená
    Abrir e Fechar Acessibilidade Rybená