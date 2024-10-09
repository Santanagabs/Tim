* Settings *
Documentation                       Automação para validação pós produção

Resource                            ../../resources/base.robot
Suite Setup                         Abrir Navegador
Test Setup                          Go To Portal

* Test Cases *
Validação Pós Produção 
    Client PF
    Botao Acessar Portal
    Validar Copyright
    Validar Politica De Privacidade

    Validar Vantagens
    Validar Passo A Passo
    Validar Telefones Para Contato

    Fazer Login PF
    Preencher Telefone Para Recebimento do Token             ${client}[phone]
    Pegar e Confirmar Token

    Validar Pagina Inicial

    Pegar Dados Do Acesso
    Pegar Dados Do Contrato

    Selecionar Contrato
    Pegar Dados Da Fatura

    Selecionar Opcao de Pagamento Pix
    Validar Funcionalidades da Tela Pix
    Responder NPS

    Selecionar Contrato
    Selecionar Opcao de Pagamento Segunda Via
    Validar Funcionalidades da Tela de Segunda Via

    Selecionar Contrato
    Selecionar Opcao de Pagamento Codigo De Barras
    Validar Funcionalidades da Tela de Codigo de Barras

    Selecionar Contrato
    Selecionar Opcao de Pagamento Cartao De Credito
    Validar Dados Na Tela de Cartao de Credito

    Selecionar Contrato
    Selecionar Opcao de Pagamento Debito Caixa
    Validar Dados Na Tela de Debito Caixa

    Selecionar Contrato
    Selecionar Opcao de Pagamento GPay
    Validar Dados Na Tela de Gpay

    Criar Report PF            ${client}

    